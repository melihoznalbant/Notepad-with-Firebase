import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/bloc/stream_bloc/stream_bloc.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<StreamBloc>().add(LoadNotesEvent());
  }

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
                if (textController.text.isNotEmpty) {
                  if (docID == null) {
                    context
                        .read<StreamBloc>()
                        .add(AddNotesEvent(note: textController.text));
                  } else {
                    context.read<StreamBloc>().add(
                        UpdateNotesEvent(id: docID, note: textController.text));
                  }

                  textController.clear();
                  context.router.maybePop();
                }
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
        } else if (state is UserError) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => context.router.maybePop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
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
          body: BlocBuilder<StreamBloc, StreamState>(
            builder: (context, state) {
              if (state is NoteLoading) {
                return const CircularProgressIndicator();
              } else if (state is NotesLoaded) {
                if (state.notes.isNotEmpty) {
                  return ListView.builder(
                    itemCount: state.notes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () =>
                                  openNoteBox(docID: state.notes[index].docId),
                              icon: const Icon(Icons.settings),
                            ),
                            IconButton(
                              onPressed: () => firestoreService
                                  .deleteNote(state.notes[index].docId),
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                        title: Text(state.notes[index].note),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No notes available"));
                }
              } else {
                return const Center(child: Text("No notes available"));
              }
            },
          ),
        ),
      ),
    );
  }
}
