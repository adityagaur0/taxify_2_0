import 'package:flutter/material.dart';
import 'package:taxify_2_0/modal/app_modal.dart';
import 'package:taxify_2_0/screens/b_home_screen.dart';

class SignUpScreen extends StatelessWidget {
  final AppModel appModel;

  SignUpScreen({required this.appModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(appModel: appModel),
              ),
            );
          },
          child: Text('Sign Up'),
        ),
      ),
    );
  }
}
