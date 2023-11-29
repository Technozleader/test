import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:sizer/sizer.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({
    Key? key,
    required this.controller,
    this.obscureText = false,
    this.validator,
    this.onChanged,
  }) : super(key: key);
  final List<TextEditingController> controller;
  final bool obscureText;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: controller
            .map(
              (e) => CodeNumberTextField(
                obscureText: obscureText,
                controller: e,
                validator: validator,
                onChange: (String? value) {
                  if (value!.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                  onChanged?.call(value);
                },
              ),
            )
            .toList());
  }
}

class CodeNumberTextField extends StatelessWidget {
  const CodeNumberTextField({
    Key? key,
    required this.controller,
    required this.onChange,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);
  final TextEditingController controller;
  final void Function(String?) onChange;
  final bool obscureText;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return GlassEffect(
      width: 12.w,
      withElevation: true,
      borderRadius: 10,
      child: TextFormField(
        validator: validator,
        obscureText: obscureText,
        autofocus: true,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 30,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.5.h),
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.5,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1.5),
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1.5),
          ),
          isDense: false,
          counterText: '',
        ),
        onChanged: onChange,
      ),
    );
  }
}
