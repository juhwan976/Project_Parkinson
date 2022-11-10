import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_parkinson/bloc/user_bloc.dart';
import 'package:project_parkinson/model/enum.dart';
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
    super.initState();
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
            child: const Text('로그인'),
            onPressed: () async {
              _onPressedLogin(context);
            },
          ),
        ),
      ),
    );
  }

  void _onPressedLogin(BuildContext context) async {
    late BuildContext dialogContext;

    showCupertinoDialog(
      context: context,
      builder: (context) {
        dialogContext = context;

        return const CupertinoAlertDialog(
          content: CupertinoActivityIndicator(),
        );
      },
    );

    //TODO: 로그인 구현하기.
    await Future.delayed(const Duration(seconds: 1)).then(
      (value) {
        _setTestData();
        Navigator.pop(dialogContext);

        // TODO: 이 방법 말고 그냥 보고있는 페이지를 변경하는것도 고려해보기.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (pageContext) => MainPage(
              userBloc: userBloc,
            ),
          ),
        );
      },
    );
  }

  void _setTestData() {
    userBloc.updateUserName("김철수");
    userBloc.updateUserEmotion(EmotionType.happy);
  }
}
