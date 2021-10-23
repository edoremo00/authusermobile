import 'package:flutter/material.dart';

class Textfieldregister extends StatefulWidget {
  //Textfieldregister({Key? key}) : super(key: key);
  final String labeltext;
  final Widget? suffixicon;
  final Icon? prefixicon;
  final TextInputType? textInputType;
  final bool obscuretext;
  final TextInputAction? textInputAction;
  final TextEditingController textEditingController;
  final String? Function(String? value)? validator;

  const Textfieldregister(
      {this.suffixicon,
      required this.labeltext,
      this.prefixicon,
      this.textInputType,
      this.obscuretext = false,
      this.textInputAction,
      required this.textEditingController,
      this.validator}); //graffe indicano che i parametri sono opzionali

  @override
  _TextfieldregisterState createState() => _TextfieldregisterState();
}

class _TextfieldregisterState extends State<Textfieldregister> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        labelText: widget.labeltext,
        suffixIcon: widget.suffixicon,
        prefixIcon: widget.prefixicon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      keyboardType: widget.textInputType,
      obscureText: widget.obscuretext,
      textInputAction: widget.textInputAction,
    );
  }
}
