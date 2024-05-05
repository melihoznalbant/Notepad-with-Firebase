import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/widgets/showdialog_body.dart';
import '../../../../router/app_router.dart';
import '../widgets/custom_textfield.dart';
import '../bloc/users_bloc/users_bloc.dart';
import '../../../../core/contants/fonts.dart';
import '../../../../../services/firestore.dart';

@RoutePage()
class FireBasePage extends StatefulWidget {
  const FireBasePage({super.key});

  @override
  State<FireBasePage> createState() => _FireBasePageState();
}

class _FireBasePageState extends State<FireBasePage> {
  final FirestoreService firestoreService = FirestoreService();

  final TextEditingController textController = TextEditingController();

  void openNoteBox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: CustomTextField(
          textController: textController,
          labelText: "Write your note",
          title: "Add Note",
        ),
        actions: [
          ShowDialogBodyWidget(
            docID: docID,
            onTap: () {
              try {
                if (docID == null) {
                  firestoreService.addNote(textController.text);
                } else {
                  firestoreService.updateNote(docID, textController.text);
                }

                textController.clear();
                context.router.maybePop();
              } catch (e) {
                debugPrint("Error adding note: $e");
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersBloc, UsersState>(
      listener: (context, state) {
        if (state is UsersInitial) {
          context.router.replace(const MyHomeRoute());
        }
      },
      child: PopScope(
        onPopInvoked: (didPop) =>
            context.read<UsersBloc>().add(const UserLogout()),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () =>
                    context.read<UsersBloc>().add(const UserLogout()),
                icon: const Icon(
                  Icons.logout,
                ),
              ),
            ],
            title: Text(
              "Notes",
              style: CustomizeFonts.tittleBlack,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: openNoteBox,
            child: const Icon(Icons.add),
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: firestoreService.getNotesStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List noteList = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: noteList.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = noteList[index];
                    String docID = document.id;

                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    String noteText = data["note"];

                    return ListTile(
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => openNoteBox(docID: docID),
                            icon: const Icon(Icons.settings),
                          ),
                          IconButton(
                            onPressed: () => firestoreService.deleteNote(docID),
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                      title: Text(
                        noteText,
                      ),
                    );
                  },
                );
              } else {
                return const Text("No Notes...");
              }
            },
          ),
        ),
      ),
    );
  }
}
