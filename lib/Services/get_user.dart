import 'package:flutter/material.dart';
import 'package:github_http/Providers/user_provider.dart';
import 'package:github_http/Screens/following_screen.dart';
import 'package:provider/provider.dart';

void getUser(controller, context) {
  if (controller.text == '') {
    Provider.of<UserProvider>(context)
        .setMessage('Please insert your username');
  } else {
    Provider.of<UserProvider>(context).fetchUser(controller.text).then((value) {
      if (value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Following()));
        controller.text = '';
      }
    });
  }
}
