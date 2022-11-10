import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_parkinson/bloc/check_state_bloc.dart';
import 'package:project_parkinson/bloc/user_bloc.dart';
import 'package:project_parkinson/model/button_data.dart';
import 'package:project_parkinson/ui/check_state_page/check_state_page.dart';
import 'package:project_parkinson/value/decoration_value.dart';
import 'package:project_parkinson/value/screen_value.dart';

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
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildUserInfo(),
            _buildSpacer(),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Container(
      padding: EdgeInsets.only(
        top: appWidth * 0.075,
        left: contentPadding,
        right: contentPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildSayHello(),
          _buildUserEmotion(),
        ],
      ),
    );
  }

  Widget _buildSayHello() {
    return StreamBuilder(
      stream: widget.userBloc.userName,
      builder: (_, userNameSnapshot) {
        if (userNameSnapshot.hasData) {
          return RichText(
            text: TextSpan(
              text: userNameSnapshot.data!,
              style: Theme.of(context).textTheme.headlineMedium,
              children: [
                TextSpan(
                  text: ' 님\n안녕하세요',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          );
        }

        return const CupertinoActivityIndicator();
      },
    );
  }

  Widget _buildUserEmotion() {
    return Container(
      height: appWidth * 0.25,
      width: appWidth * 0.25,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(appWidth * 0.125),
      ),
      child: StreamBuilder(
        stream: widget.userBloc.userEmotion,
        builder: (_, userEmotionSnapshot) {
          if (userEmotionSnapshot.hasData) {
            return Icon(
              userEmotionSnapshot.data!.icon,
              size: 60,
              color: Theme.of(context).textTheme.headlineSmall?.color,
            );
          }

          return const CupertinoActivityIndicator();
        },
      ),
    );
  }

  Widget _buildSpacer() {
    return SizedBox(
      height: appWidth * 0.175,
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        _buildBigButton(
          ButtonData(
            title: '상태 확인',
            icon: Icons.trending_up_outlined,
            onPressed: () {
              _onPressedCheckState(context);
            },
          ),
        ),
        _buildSmallButtons(
          leftButton: ButtonData(
            title: '운동 관리',
            icon: Icons.timer_outlined,
            onPressed: () {},
          ),
          rightButton: ButtonData(
            title: '약복용 관리',
            icon: Icons.medication_outlined,
            onPressed: () {},
          ),
        ),
        _buildSmallButtons(
          leftButton: ButtonData(
            title: '식단 관리',
            icon: Icons.fastfood_outlined,
            onPressed: () {},
          ),
          rightButton: ButtonData(
            title: '수면 관리',
            icon: Icons.bedtime_outlined,
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  void _onPressedCheckState(BuildContext context) async {
    final checkStateBloc = CheckStateBloc();

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

    //TODO: 서버에서 나의 상태 관련 정보 받아오기.
    await Future.delayed(const Duration(seconds: 1)).then(
      (value) async {
        Navigator.pop(dialogContext);

        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (pageContext) => CheckStatePage(
              checkStateBloc: checkStateBloc,
            ),
          ),
        );

        checkStateBloc.dispose();
      },
    );
  }

  Widget _buildBigButton(ButtonData buttonData) {
    return Container(
      height: buttonSize,
      margin: EdgeInsets.only(
        bottom: contentPadding,
        left: contentPadding,
        right: contentPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: boxBorderRadius,
      ),
      child: MaterialButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        padding: boxPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              buttonData.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Expanded(
              child: Center(
                child: Icon(
                  buttonData.icon,
                  size: appWidth * 0.35,
                  color: Theme.of(context).textTheme.headlineSmall?.color,
                ),
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
      height: buttonSize,
      margin: EdgeInsets.only(
        bottom: contentPadding,
        left: contentPadding,
        right: contentPadding,
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
    return Container(
      width: buttonSize,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: boxBorderRadius,
      ),
      child: MaterialButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        padding: boxPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              buttonData.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Flexible(
              child: Center(
                child: Icon(
                  buttonData.icon,
                  size: appWidth * 0.175,
                  color: Theme.of(context).textTheme.headlineSmall?.color,
                ),
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
}
