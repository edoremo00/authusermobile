import 'package:flutter/material.dart';

class Editprofiletextwidget extends StatefulWidget {
  final String label;
  final String text;
  final int maxlines;
  final ValueChanged<String> onchanged;
  TextEditingController? controller;
  Editprofiletextwidget(
      {Key? key,
      required this.label,
      required this.text,
      required this.onchanged,
      this.maxlines = 1,
      this.controller})
      : super(key: key);

  @override
  _EditprofiletextwidgetState createState() => _EditprofiletextwidgetState();
}

class _EditprofiletextwidgetState extends State<Editprofiletextwidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        TextField(
          maxLines: widget.maxlines,
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
      ],
    );
  }
}
