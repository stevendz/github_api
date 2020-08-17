import 'package:flutter/material.dart';
import 'package:github_http/Providers/user_provider.dart';
import 'package:github_http/Services/get_user.dart';
import 'package:provider/provider.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required TextEditingController controller,
  })  : controller = controller,
        super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(20),
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        child: Provider.of<UserProvider>(context).isLoading()
            ? CircularProgressIndicator(
                backgroundColor: Colors.white, strokeWidth: 2)
            : Text(
                'Get your following now.',
                style: TextStyle(color: Colors.white),
              ),
      ),
      onPressed: () {
        getUser(controller, context);
      },
    );
  }
}
