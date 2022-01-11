import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visual_notes_app/logic/notes_bloc.dart';
import 'package:visual_notes_app/logic/notes_state.dart';
import 'package:visual_notes_app/ui/widgets/sliver_header_delegate.dart';

class ViewNotePage extends StatelessWidget {
  const ViewNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff6f7f9),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 60.0,
                    maxHeight: 250.0,
                    title: 'Title',
                  )),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                    return SafeArea(
                      child: SingleChildScrollView(
                        child: BlocConsumer<NotesBloc, NotesState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is ViewOneNoteState) {
                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(7))),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              'Status :',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xff525453)),
                                            ),
                                            Text(
                                              'Closed',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xff525453)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 8.0),
                                    child: Row(
                                      children: const [
                                        Text(
                                          'Description :',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xff525453)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 8.0),
                                    child: Text(
                                      'Description for the note and testing the multiline with this string adding more word to see what will happen with the string',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff525453)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                ],
                              );
                            } else {
                              return const Center(
                                child: Text('Error loading note'),
                              );
                            }
                          },
                        ),
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
        ));
  }
}
