import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_parkinson/bloc/user_bloc.dart';
import 'package:project_parkinson/ui/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserBloc userBloc = UserBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userBloc.updateUserName("김철수");
  }

  @override
  void dispose() {
    super.dispose();

    userBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CupertinoButton(
            child: Text('로그인 했다고 가정합시다 일단은.'),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (pageContext) => MainPage(
                    userBloc: userBloc,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
