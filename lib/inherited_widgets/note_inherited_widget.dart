import 'package:flutter/material.dart';
import 'package:my_notes/pages/new_note_page.dart';
class NoteInheritedWidget extends InheritedWidget {

  final notes = [
    {
      'title': 'A JFJDLKCNHLDKomeTitle',
      'text': 'AJDKL;SLDFKRJDKLPEOIKVD;OSIDJDKSLDJFMXZL,XMNCC XMC,,,,MCMJDSKCM',

    },
    {
      'title': 'Sjn;klTitlejdklsljfrifekflk',
      'text': 'SDLKMDLFKDJBGDFKJSODJFOD;KSPD;SKFS;FKDFKDOJFDNVFJBNFKBDLKFSPIREOGGHUGHDSjfjelt',

    },
    {
      'title': 'QJFFDKFJKJGLDFJGDGK;DSGJ;DSLMV,NBJKHLDFKsomeTitle',
      'text': 'QFIJKFKOEGJD;KCDNBFJBNDMVVMNMNNNNNNVNVNVNVNVNVNVNVNVJVJVJVJVJVJVJVJVJFJFJFJFJFJFJFJFJFFJFJUURUTUTomeText',

    }
  ];

  NoteInheritedWidget(Widget child) : super(child: child);

  static NoteInheritedWidget of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(NoteInheritedWidget)
    as NoteInheritedWidget);
  }

  @override
  bool updateShouldNotify( NoteInheritedWidget oldwidget){
    return oldwidget.notes != notes ;
  }

}
