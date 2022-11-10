import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_parkinson/ui/login_page.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 1)),
          builder: (_, futureSnapshot) {
            if (futureSnapshot.connectionState == ConnectionState.done) {
              return LoginPage();
            }

            return const Center(
              child: CupertinoActivityIndicator(),
            );
          },
        ),
      ),
    );
  }
}
