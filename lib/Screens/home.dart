import 'package:flutter/material.dart';
import 'package:github_http/Widgets/logo_header.dart';
import 'package:github_http/Widgets/rounded_button.dart';
import 'package:github_http/Widgets/searchbox.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade100,
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              LogoHeader(),
              SearchBox(controller: _controller),
              RoundedButton(controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}
