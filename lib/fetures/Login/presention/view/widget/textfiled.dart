import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';

class CustomTextfiled extends StatefulWidget {
  const CustomTextfiled({super.key, required this.label, required this.icon});
  final String label;
  final Icon icon;
  @override
  State<CustomTextfiled> createState() => _CustomTextfiledState();
}

class _CustomTextfiledState extends State<CustomTextfiled> {
  bool _isFocused = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (v) {
        if (v!.isEmpty) {
          return "This field is required";
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: widget.label,
        labelStyle: _isFocused
            ? AppStyles.styleMedium15(context).copyWith(color: Colors.blue)
            : AppStyles.styleMedium15(context),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.blue, // لون الحدود عند التركيز
            width: 2.0, // عرض الحدود عند التركيز
          ),
        ),
      ),
      onChanged: (value) {
        setState(() {
          _isFocused = value.isNotEmpty;
        });
      },
      onTap: () {
        setState(() {
          _isFocused = true;
        });
      },
      onFieldSubmitted: (value) {
        setState(() {
          _isFocused = false;
        });
      },
    );
  }
}
