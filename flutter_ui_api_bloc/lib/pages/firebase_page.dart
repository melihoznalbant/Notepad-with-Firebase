import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app_router.dart';
import '../blocs/users_bloc/users_bloc.dart';
import '../fonts.dart';
import '../services/firestore.dart';
import '../widgets/custom_textfield.dart';

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
          ElevatedButton(
            onPressed: () {
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
            child: docID == null
                ? Text(
                    "Add",
                    style: CustomizeFonts.insideTextLabelGrey,
                  )
                : Text(
                    "Update",
                    style: CustomizeFonts.insideTextLabelGrey,
                  ),
          ),
        ],
      ),
    );
  }

/*   void logout() {
    FirebaseAuth.instance.signOut();
    context.router.push(const AuthRoute());
  } */

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersBloc, UsersState>(
      listener: (context, state) {
        if (state is UsersInitial) {
          context.router.push(const MyHomeRoute());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                context.read<UsersBloc>().add(const UserLogout());
                
              },
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
    );
  }
}
