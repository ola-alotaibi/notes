import 'package:flutter/material.dart';
import 'package:my_notes/pages/login_page.dart';
import 'package:my_notes/inherited_widgets/note_inherited_widget.dart';

import 'package:my_notes/pages/splash_page.dart';
import 'package:my_notes/pages/note_list_page.dart';
import 'package:my_notes/pages/new_note_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoteInheritedWidget (
       MaterialApp(
        title: "MY Notes",
        //home: NoteListPage(),
        routes: <String, WidgetBuilder> {
          "/": (context) => SplashPage(),
          "/login": (context) => LoginPage(),
          "/NoteList": (context) => NoteListPage(),
          //"/NewNote": (context) => NewNote(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
