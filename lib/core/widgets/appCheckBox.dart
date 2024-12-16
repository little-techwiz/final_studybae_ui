import 'package:flutter/material.dart';
import 'package:studybae/core/configs/theme/app_colours.dart';
import 'package:studybae/core/utils/constants.dart';

class AppCheckBox extends StatefulWidget {
  final bool value, isDarkMode;
  final ValueChanged<bool?> onChanged;
  final String label;
  final String? clickableText;
  final VoidCallback? onClickableTextTap;

  AppCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    required this.isDarkMode,
    this.clickableText,
    this.onClickableTextTap,
  });

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  @override
  Widget build(BuildContext context) {
    // Get the current theme brightness
    // final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Color textColor = widget.isDarkMode == true
        ? AppColors.textColorWhite
        : AppColors.textColorBlack;

    // Set the dynamic outline color based on theme
    final outlineColor = widget.value
        ? Colors.transparent // No outline when active
        : ( widget.isDarkMode ? Colors.white : Colors.black);

    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start, // Aligns the text to start
      children: [
        GestureDetector(
          onTap: () {
            widget.onChanged(!widget.value);
          },
          child: Checkbox(
            tristate: false, // No tri-state behavior
            value: widget.value,
            onChanged: widget.onChanged,
            checkColor: Colors.black, // Color of the checkmark when checked
            activeColor: Colors.green, // Color of the checkbox when checked
            side: BorderSide(
              color: Colors.white, // White border color
              width: 1.0, // Border width
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrinks the tap target
          ),
        ),
        const SizedBox(width: 8.0), // Space between checkbox and text
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: appTextTheme(context).titleSmall!.copyWith(color: textColor),
                softWrap: true, // Enable wrapping of text
              ),
              if (widget.clickableText != null) // Check if clickable text exists
                GestureDetector(
                  onTap: widget.onClickableTextTap,
                  child: Text(
                    widget.clickableText!,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
