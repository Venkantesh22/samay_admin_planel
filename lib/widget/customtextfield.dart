// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:samay_admin_plan/utility/dimenison.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  bool obscureForPassword = false;
  final TextInputType? keyboardType;
  int? maxline;

  final String label;
  CustomTextField({
    Key? key,
    required this.controller,
    required this.obscureForPassword,
    this.keyboardType,
    this.maxline = 1,
    required this.label,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxline,
      cursorHeight: Dimensions.dimenisonNo16,
      obscureText: widget.obscureForPassword,
      style: const TextStyle(fontSize: 12),
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        suffixIcon: widget.label == "Password"
            ? InkWell(
                onTap: () {
                  setState(() {
                    widget.obscureForPassword = !widget.obscureForPassword;
                  });
                },
                child: Icon(widget.obscureForPassword
                    ? Icons.visibility
                    : Icons.visibility_off),
              )
            : null,
        labelText: widget.label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.dimenisonNo16),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your ${widget.label}';
        }
        return null;
      },
    );
  }
}

// Text field for Profile form
class FormCustomTextField extends StatefulWidget {
  final TextEditingController controller;

  int? maxline;
  final String title;

  FormCustomTextField({
    Key? key,
    required this.controller,
    this.maxline = 1,
    required this.title,
  }) : super(key: key);

  @override
  State<FormCustomTextField> createState() => _FormCustomTextFieldState();
}

class _FormCustomTextFieldState extends State<FormCustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.dimenisonNo18,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                ),
              ),
              TextSpan(
                text: ' *',
                style: TextStyle(
                  color: const Color(0xFFFC0000),
                  fontSize: Dimensions.dimenisonNo18,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 0.15,
                ),
              ),
            ],
          ),
        ),
        // Text(
        //   widget.title,,
        //   style: TextStyle(
        //     color: Colors.black,
        //     fontSize: Dimensions.dimenisonNo16,
        //     fontFamily: GoogleFonts.roboto().fontFamily,
        //     fontWeight: FontWeight.w500,
        //     letterSpacing: 0.15,
        //   ),
        // ),
        SizedBox(
          height: Dimensions.dimenisonNo5,
        ),
        SizedBox(
          //salon description textbox has. max line.

          height: widget.maxline! < 2 ? Dimensions.dimenisonNo30 : null,
          child: TextFormField(
            maxLines: widget.maxline,
            cursorHeight: Dimensions.dimenisonNo16,
            style: const TextStyle(fontSize: 12),
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: Dimensions.dimenisonNo10,
                  vertical: Dimensions.dimenisonNo10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.dimenisonNo16),
              ),
            ),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Enter your ${widget.title}';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
