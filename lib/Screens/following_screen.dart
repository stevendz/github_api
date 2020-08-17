import 'package:flutter/material.dart';
import 'package:github_http/Providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../Services/github_request.dart';
import '../Models/User.dart';
import 'dart:convert';

class Following extends StatefulWidget {
  @override
  _FollowingState createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  User user;
  List<User> users;

  @override
  Widget build(BuildContext context) {
    setState(() {
      user = Provider.of<UserProvider>(context).getUser();
      Github(user.login).fetchFollowing().then((following) {
        Iterable list = json.decode(following.body);
        setState(() {
          users = list.map((model) => User.fromJson(model)).toList();
        });
      });
    });

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize:
              Size(double.infinity, MediaQuery.of(context).size.height * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.avatarUrl),
                ),
              ),
              SizedBox(height: 20),
              Text(
                user.login,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: users != null
                        ? ListView.builder(
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 15),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          NetworkImage(users[index].avatarUrl),
                                    ),
                                    SizedBox(width: 25),
                                    Text(
                                      users[index].login,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey.shade700),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : Container(
                            child: Align(
                              child: Text('Data is loading...'),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
