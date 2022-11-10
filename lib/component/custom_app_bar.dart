import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_parkinson/value/screen_value.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.onPressedLeading,
    this.action,
  }) : super(key: key);

  final String title;
  final Function? onPressedLeading;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appBarHeight,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: appWidth * 0.2,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.only(
                  left: contentPadding,
                ),
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).textTheme.labelLarge?.color,
                ),
              ),
              onPressed: () {
                onPressedLeading?.call();
              },
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          SizedBox(
            width: appWidth * 0.2,
            child: action,
          ),
        ],
      ),
    );
  }
}
