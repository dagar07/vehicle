import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget title;
  final Widget leading;
  final List<Widget> actions;

  const CustomAppBar({
    Key key,
    @required this.height,
    this.title,
    this.leading,
    this.actions
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            leading,
            title,
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions,
                ),
              ),
            )
          ],
        ),
    ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}