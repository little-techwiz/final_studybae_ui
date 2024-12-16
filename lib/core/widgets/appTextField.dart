import 'package:flutter/material.dart';
import 'package:studybae/core/configs/theme/app_colours.dart';
import 'package:studybae/core/utils/constants.dart';

class AppTextField extends StatelessWidget {
  String? hintText;
  VoidCallback? searchFieldCallBack;
  Function(String)? onChanged;
  FocusNode focusNode;
  TextInputType? keyboardType;
  TextEditingController controller;
  bool? isEnabled, isDarkMode;
  Function(String)? onSubmitted;

  AppTextField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.onChanged,
    this.searchFieldCallBack,
    this.isEnabled,
    this.isDarkMode,
    required this.focusNode,
    required this.controller,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {

    Color textColor = isDarkMode == true
        ? AppColors.textColorWhite
        : AppColors.textColorBlack;

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        enabled: isEnabled ?? true,
        controller: controller,
        style: appTextTheme(context).titleSmall!.copyWith(color: textColor),
        onTap: searchFieldCallBack,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        focusNode: focusNode,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: textColor.withOpacity(0.6)),
          // border: UnderlineInputBorder(
          //     borderSide: BorderSide(color: AppColors.primaryColor),
          // ),
          enabledBorder: enabledOutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
          focusedBorder: focusedOutlineInputBorder(),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(8),
          // ),
        ),
      ),
    );
  }
}

focusedOutlineInputBorder() {
  return UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor),
    // borderRadius: BorderRadius.vertical(
    //   // bottom: Radius.circular(15), // Optional for rounded bottom border
    // ),
  );
}

enabledOutlineInputBorder() {
  return UnderlineInputBorder(
    borderSide: BorderSide(
        color: AppColors.grey,
    ),
  );
}
