import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_parkinson/bloc/user_bloc.dart';
import 'package:project_parkinson/value/global_value.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
    required this.userBloc,
  }) : super(key: key);

  final UserBloc userBloc;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            _buildUserInfo(),
            _buildSpacer(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Container(
      padding: EdgeInsets.only(
        top: appWidth * 0.1,
        left: contentPadding,
        right: contentPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: widget.userBloc.userName,
            builder: (_, userNameSnapshot) {
              if (userNameSnapshot.hasData) {
                return RichText(
                  text: TextSpan(
                    text: userNameSnapshot.data!,
                    style: Theme.of(context).textTheme.headline4,
                    children: [
                      TextSpan(
                        text: ' 님\n안녕하세요',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                );
              }

              return const CupertinoActivityIndicator();
            },
          ),
          Container(
            height: appWidth * 0.25,
            width: appWidth * 0.25,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(appWidth * 0.125),
            ),
            child: Icon(
              Icons.insert_emoticon_outlined,
              size: 60,
              color: Theme.of(context).textTheme.headline5?.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpacer() {
    return SizedBox(
      height: appWidth * 0.2,
    );
  }

  Widget _buildButtons() {
    return Column(
      children: [
        _buildBigButton(
          ButtonData(
            title: '상태확인',
            icon: Icons.trending_up_outlined,
            onPressed: () {},
          ),
        ),
        // _buildSmallButtons(),
      ],
    );
  }

  Widget _buildBigButton(ButtonData buttonData) {
    return Container(
      height: appWidth * 0.45,
      margin: EdgeInsets.only(
        bottom: contentPadding,
        left: contentPadding,
        right: contentPadding,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(appWidth * 0.05),
      ),
      child: MaterialButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              buttonData.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            Flexible(
              child: Icon(
                buttonData.icon,
                size: appWidth * 0.35,
              ),
            ),
          ],
        ),
        onPressed: () {
          buttonData.onPressed.call();
        },
      ),
    );
  }

  Widget _buildSmallButtons({
    required ButtonData leftButton,
    required ButtonData rightButton,
  }) {
    return Container(
      width: appWidth * 0.8,
      height: appHeight * 0.45,
      margin: EdgeInsets.only(
        bottom: contentPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSmallButton(
            leftButton,
          ),
          _buildSmallButton(
            rightButton,
          ),
        ],
      ),
    );
  }

  Widget _buildSmallButton(ButtonData buttonData) {
    return Container();
  }
}

class ButtonData {
  ButtonData({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final IconData icon;
  final Function onPressed;
}
