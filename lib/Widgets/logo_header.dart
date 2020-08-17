import 'package:flutter/material.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 125,
            height: 125,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              backgroundImage: NetworkImage(
                  'https://github.githubassets.com/images/modules/logos_page/Octocat.png'),
            ),
          ),
          Text(
            'GitHub',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
