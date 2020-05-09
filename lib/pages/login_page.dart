import 'package:flutter/material.dart';
import 'package:my_notes/widgets/my_flat_button.dart';
import 'package:my_notes/widgets/my_text_field.dart';
import 'package:flutter/services.dart';
import 'package:my_notes/repository/auth_repository.dart';


class LoginPage extends StatelessWidget {

  final AuthRepository _auth = AuthRepository.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  height: 200,
                  image: AssetImage("assets/images/myNotesLogo.png"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: MyTextField(
                    hint: "email",
                    textInputType: TextInputType.emailAddress,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: MyTextField(
                    hint: "Password",
                    isPassword: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: MyFlatButton(

                        Color(0xFF54B7AF),
                      "login",
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, "/NoteList");
                      }
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: MyFlatButton(
                      Color(0xFF54B7AF),
                      "signup",
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
