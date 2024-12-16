import 'package:flutter/material.dart';
import 'package:studybae/core/configs/theme/app_colours.dart';
import 'package:studybae/core/utils/constants.dart';

class AppButton extends StatelessWidget {
  String btnText;
  Color? backgroundColor, textColor, borderColor;
  double? textSize, height, width;
  VoidCallback? voidCallBack;

  AppButton(
      {super.key,
        required this.btnText,
        this.backgroundColor,
        this.textColor,
        this.borderColor,
        this.textSize,
        this.height,
        this.width,
        this.voidCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Material(
        color: backgroundColor ?? AppColors.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: InkWell(
          onTap: voidCallBack,
          highlightColor: AppColors.green.withOpacity(0.4),
          splashColor: AppColors.green.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Center(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 15, bottom: 15),
                child: Text(
                  btnText,
                  style: appTextTheme(context).labelSmall?.copyWith(
                      color: textColor ?? AppColors.green, fontSize: textSize ?? 15),
                ),
              )),
        ),
      ),
    );
  }
}
