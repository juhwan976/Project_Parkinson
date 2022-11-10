import 'package:flutter/material.dart';
import 'package:project_parkinson/bloc/check_state_bloc.dart';
import 'package:project_parkinson/component/custom_app_bar.dart';
import 'package:project_parkinson/value/decoration_value.dart';
import 'package:project_parkinson/value/screen_value.dart';

class CheckStatePage extends StatefulWidget {
  const CheckStatePage({
    Key? key,
    required this.checkStateBloc,
  }) : super(key: key);

  final CheckStateBloc checkStateBloc;

  @override
  State<CheckStatePage> createState() => _CheckStatePageState();
}

class _CheckStatePageState extends State<CheckStatePage> {
  final _buttonHeight = appWidth * 0.175;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            _buildMyStateChart(),
            Expanded(
              child: ListView(
                children: [
                  _buildCheckStateButton(),
                  _buildCheckPronunciation(),
                  _buildEarlyAndNowChart(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  Widget _buildAppBar() {
    return CustomAppBar(
      title: '나의 상태 확인',
      onPressedLeading: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _buildNavigationBar() {
    return Container(
      height: navigationHeight,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
    );
  }

  Widget _buildMyStateChart() {
    return Container(
      height: appWidth * 0.692,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(boxBorderRadiusValue),
          bottomRight: Radius.circular(boxBorderRadiusValue),
        ),
        color: Theme.of(context).primaryColor,
      ),
      padding: EdgeInsets.only(
        left: contentPadding / 2,
        right: contentPadding / 2,
        bottom: contentPadding / 2,
      ),
      child: Container(
        color: Colors.yellow,
        child: const Center(
          child: Text(
            '그래프 들어갈 자리',
          ),
        ),
      ),
    );
  }

  Widget _buildCheckStateButton() {
    return Container(
      height: _buttonHeight,
      margin: EdgeInsets.only(
        top: contentPadding / 1.5,
        right: contentPadding / 2,
        left: contentPadding / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: boxBorderRadius,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildCheckPronunciation() {
    return Container(
      height: _buttonHeight,
      margin: EdgeInsets.only(
        top: contentPadding / 2,
        right: contentPadding / 2,
        left: contentPadding / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: boxBorderRadius,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildEarlyAndNowChart() {
    return Container(
      height: appWidth * 0.5,
      margin: EdgeInsets.only(
        top: contentPadding / 1.5,
        left: contentPadding / 2,
        right: contentPadding / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: boxBorderRadius,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
