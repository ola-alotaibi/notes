import 'package:flutter/material.dart';
import 'package:my_notes/inherited_widgets/note_inherited_widget.dart';
import 'package:my_notes/providers/note_provider.dart';
import 'new_note_page.dart';
import 'package:my_notes/pages/new_note_page.dart';


class NoteListPage extends StatefulWidget {
  @override
  NoteListPageState createState(){

    return new NoteListPageState();

  }
}

class NoteListPageState extends State<NoteListPage> {
  //List<Map<String, String>> get _notes => NoteInheritedWidget.of(context).notes;
  //List<Map<String, String>> get notes => NoteInheritedWidget.of(context).notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF54B7AF),
        title: Text(
          'Note List',
          textDirection: TextDirection.ltr,
          style: new TextStyle(
            fontFamily: 'CooperItalic',
            fontSize: 45,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: FutureBuilder(
        future: NoteProvider.getNoteList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final notes = snapshot.data;
            //List<Map<String, String>> get notes => NoteInheritedWidget.of(context).notes;
            return ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NewNote(NoteMode.Editing, notes[index])));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, bottom: 30.0, left: 13.0, right: 22.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _NoteTitle(notes[index]['title']),/////////////////////
                          Container(
                            height: 4,
                          ),
                          _NoteText(notes[index]['text']),/////////////////////

                        ],
                      ),
                    ),
                  ),
                );

              },
              itemCount: notes.length,
              //itemCount: notes.length,
            );

          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewNote(NoteMode.Adding, null)));
        },
        //shape: null,
        backgroundColor: Color(0xFF54B7AF),
        child: Icon(
          Icons.note_add,
          size: 40,
        ),
      ),
    );
  }
}

class _NoteTitle extends StatelessWidget {
  final String _titel;

  _NoteTitle(this._titel);

  @override
  Widget build(BuildContext context) {
    return Text(
      _titel,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _NoteText extends StatelessWidget {
  final String _text;

  _NoteText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        color: Colors.grey.shade600,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

//style: new TextStyle(fontFamily: "CooperItalic",fontSize: 55,fontWeight: FontWeight.w700,),

/*          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: FlatButton(
                  child: Image(
                    width: 70,
                    height: 70,
                    image: AssetImage("assets/images/AddNote.png"),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/NewNote");
                  },
                ),
              ), */
