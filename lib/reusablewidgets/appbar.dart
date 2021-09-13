import 'package:flutter/material.dart';

class Reusableappbar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? widgettitle;
  final Color? backgroundcolor;
  final double? appbarheigth;
  final Widget? leadingwidget;
  final String? titletext;
  Reusableappbar(
      {Key? key,
      this.appbarheigth,
      this.backgroundcolor,
      this.leadingwidget,
      this.titletext,
      this.widgettitle})
      : super(key: key);

  @override
  _ReusableappbarState createState() => _ReusableappbarState();

  @override
  Size get preferredSize => Size.fromHeight(70);
}

class _ReusableappbarState extends State<Reusableappbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundcolor,
      elevation: 0,
      toolbarHeight: widget.appbarheigth,
      title: widget.widgettitle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(48),
        ),
      ),
    );
  }
}
