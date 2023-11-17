import 'package:flutter/material.dart';

Widget appButton({
  Color color = Colors.deepPurple,
  required String text,
  required void Function() onPressed,
}) =>
    ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: color,
            fixedSize: Size(double.maxFinite, 50),
            alignment: AlignmentDirectional.center,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ));

Widget appTextFormField({
  required TextEditingController fieldController,
  required TextInputType inputType,
  required String label,
  required IconData icon,
  required String type,
  bool isPassword = false,
  void Function(String)? onSubmit,
  Widget? suffix
}) =>
    TextFormField(
      obscureText: isPassword,
      controller: fieldController,
      keyboardType: inputType,
      validator: (value) {
        if (type == 'email'){
          if (isEmail(value!)) {
            return null;
          }
          return "Please enter a correct email";
        } else if (type == 'password'){
          if (value!.length < 6) {
            return "Password is too short";
          }
          return null;
        } else if (type == 'name'){
          if (value!.isEmpty || !value.contains(' ') || value.endsWith(' ')) {
            return "Please enter your full name";
          }
          return null;
        } else if (type == 'phone'){
          if (value!.isEmpty) {
            return "Please enter your phone number";
          }
          return null;
        }
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.grey[900],
          label: Text(label),
          labelStyle: TextStyle(color: Colors.deepPurple[300]),
          prefixIcon: Icon(
            icon,
            color: Colors.deepPurple[300],
          ),
        suffixIcon: suffix
      ),
      onFieldSubmitted: onSubmit,
    );

bool isEmail(String email) {
  String regularExpression =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(regularExpression);
  return regExp.hasMatch(email);
}