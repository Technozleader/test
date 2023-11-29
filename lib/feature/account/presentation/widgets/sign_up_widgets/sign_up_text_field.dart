import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:sizer/sizer.dart';

class PhoneInputTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(CountryCode value) onChanged;

  const PhoneInputTextField({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         GlassEffect(
          withElevation: true,
          child: CountryCodePickerWidget(
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: AccountTextField(
            hintText: "5xxxxxxx",
            controller: controller,
          ),
        ),
      ],
    );
  }
}

class CountryCodePickerWidget extends StatelessWidget {
  final void Function(CountryCode value)? onChanged;

  const CountryCodePickerWidget({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      searchStyle: TextManager.cardDarkFont,
      dialogTextStyle: TextManager.cardDarkFont,
      textStyle: TextManager.cardDarkFont,
      onChanged: onChanged,
      initialSelection: '+966',
      dialogSize: Size(80.w, 80.h),
      showFlag: false,
      flagDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3))),
    );
  }
}

class AccountTextField extends StatelessWidget {
  const AccountTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.onlyDigits = true,
    this.keyboardType,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final bool onlyDigits;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return GlassEffect(
      withElevation: true,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TextFormField(
          controller: controller,
          autofocus: true,
          textAlign: TextAlign.left,
          inputFormatters:
              onlyDigits ? [FilteringTextInputFormatter.digitsOnly] : null,
          style: TextManager.cardDarkFont,
          onChanged: (value) {},
          textAlignVertical: TextAlignVertical.center,
          keyboardType: keyboardType ??
              const TextInputType.numberWithOptions(
                signed: false,
                decimal: false,
              ),
          cursorColor: ColorManager.grey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            hintText: hintText,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
