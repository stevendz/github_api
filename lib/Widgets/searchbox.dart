import 'package:flutter/material.dart';
import 'package:github_http/Providers/user_provider.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key key,
    @required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextField(
        onChanged: (val) {
          Provider.of<UserProvider>(context).setMessage(null);
        },
        controller: _controller,
        enabled: !Provider.of<UserProvider>(context).isLoading(),
        style: TextStyle(color: Colors.grey.shade700),
        decoration: InputDecoration(
          errorText: Provider.of<UserProvider>(context).getMessage(),
          border: InputBorder.none,
          hintText: 'GitHub Username',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
