import 'package:flutter/material.dart';
import 'package:my_notes/inherited_widgets/note_inherited_widget.dart';
import 'package:my_notes/providers/note_provider.dart';
import 'package:my_notes/widgets/my_text_field.dart';
import 'package:my_notes/widgets/my_flat_button.dart';

enum NoteMode {
  Editing,
  Adding,
}

class NewNote extends StatefulWidget {
  final NoteMode noteMode;

  final Map<String, dynamic> note;

  NewNote(this.noteMode, this.note);

  @override
  NewNoteState createState() {
    return new NewNoteState();
  }
}

class NewNoteState extends State<NewNote> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  List<Map<String, String >> get _notes => NoteInheritedWidget.of(context).notes;

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Editing) {
      _titleController.text = widget.note['title'];
      _textController.text = widget.note['text'];
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF54B7AF),
        title: Text(
          widget.noteMode == NoteMode.Adding ? 'Add Note' : 'Edit Note',
          style: new TextStyle(
            fontFamily: 'CooperItalic',
            fontSize: 45,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 16),
              child: MyTextField(
                controller: _titleController,
                hint: "Note title",
                textInputType: TextInputType.text,
              ),
            ),
            Container(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: MyTextField(
                controller: _textController,
                hint: "Note text",
                textInputType: TextInputType.text,
              ),
            ),
            Container(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MyFlatButton(
                  Color(0xFF54B7AF),
                  "Save",
                  onPressed: () {
                    final title = _titleController.text;
                    final text = _textController.text;

                    if (widget?.noteMode == NoteMode.Adding) {
                      NoteProvider.insertNote({
                        'title': title,
                        'text': text,
                      });

                    } else if (widget?.noteMode == NoteMode.Editing) {
                      NoteProvider.updateNote({
                        'id': widget.note['id'],
                        'title': _titleController.text,
                        'text': _textController.text,

                      });
                    }

                    Navigator.pop(context);
                  },
                ),
                MyFlatButton(
                  Color(0xFF54B7AF),
                  "Discard",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                widget.noteMode == NoteMode.Editing
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyFlatButton(
                          Color(0xFF54B7AF),
                          "Delete",
                          onPressed: () async {
                           await NoteProvider.deleteNote(widget.note['id']);
                            //_notes.removeAt(widget.index);
                            Navigator.pop(context);
                          },
                        ),
                      )
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
