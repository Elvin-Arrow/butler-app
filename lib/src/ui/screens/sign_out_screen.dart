import 'package:auto_size_text/auto_size_text.dart';
import 'package:butler_app/src/resources/services/auth_service.dart';
import 'package:butler_app/src/resources/utilities/constants.dart';
import 'package:butler_app/src/ui/widgets/rounded_rectanlge_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignOutScreen extends StatefulWidget {
  static const String id = 'sign_out_screen';

  @override
  _SignOutScreenState createState() => _SignOutScreenState();
}

class _SignOutScreenState extends State<SignOutScreen> {

  Future<String> _getUserName() async {
    User user = await Auth().getCurrentUser();
    return user.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2 - 100,
            ),
            FutureBuilder(
              future: _getUserName(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
               if (!snapshot.hasData) {
                 return CircularProgressIndicator();
               }
               else {
                 return Padding(
                   padding: const EdgeInsets.all(18.0),
                   child: Container(
                     height: 100,
                     width: MediaQuery.of(context).size.width,
                     decoration: BoxDecoration(
                       color: kDullBlueColor,
                       borderRadius: BorderRadius.circular(42)
                     ),
                     child: Center(
                       child: AutoSizeText(
                         snapshot.data,
                         style: TextStyle(
                           fontStyle: FontStyle.italic,
                           color: kDefaultIconColour,
                           fontSize: 32,
                         ),
                         overflow: TextOverflow.ellipsis,
                         maxLines: 2,
                       ),
                     ),
                   ),
                 );
               }
            },),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24),
              child: RoundedRectangleButton(
                onPressed: () {
                  /// TODO sign out
                },
                buttonText: 'Sign Out',
                buttonColour: kSelectedIconColour,
                buttonTextColour: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
