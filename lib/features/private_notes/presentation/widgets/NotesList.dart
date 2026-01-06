import 'package:flutter/material.dart';

import '../../domain/entities/priv_notes.dart' as domain;
import 'NoteCard.dart';

class Noteslist extends StatelessWidget {
  Noteslist({super.key, required this.displayedNotes});

  final List<domain.PrivNotes> displayedNotes;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return ListView.builder(
      controller: _scrollController,
      itemCount: displayedNotes.length,
      itemBuilder: (context, index) {
        final note = displayedNotes[index];
        return Notecard(note: note);
      },
    );
  }
}
