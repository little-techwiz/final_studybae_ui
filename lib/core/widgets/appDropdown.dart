import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studybae/core/configs/theme/app_colours.dart';
import 'package:studybae/core/utils/constants.dart';

class AppDropdown extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final String? selectedValue;
  bool? isDarkMode;

  AppDropdown({
    Key? key,
    required this.hintText,
    required this.items,
    this.isDarkMode,
    this.onChanged,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color textColor = isDarkMode == true
        ? AppColors.textColorWhite
        : AppColors.textColorBlack;

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: appTextTheme(context).titleSmall!.copyWith(color: textColor.withOpacity(0.6)),
          contentPadding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
          // filled: true,
          // fillColor: Colors.grey[200],
          enabledBorder: enabledOutlineInputBorder(),
          focusedBorder: focusedOutlineInputBorder(),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10),
          //   borderSide: BorderSide.none,
          // ),
        ),
        value: selectedValue,
        items: items
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        ))
            .toList(),
        onChanged: onChanged,
        icon: SvgPicture.asset('${vectorPath}dropdown_arrow.svg')
      ),
    );
  }
}


class ExpandingDropdown extends StatefulWidget {
  final String hintText;
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final bool isDarkMode;

  const ExpandingDropdown({
    Key? key,
    required this.hintText,
    required this.items,
    this.selectedValue,
    this.onChanged,
    this.isDarkMode = false,
  }) : super(key: key);

  @override
  State<ExpandingDropdown> createState() => _ExpandingDropdownState();
}

class _ExpandingDropdownState extends State<ExpandingDropdown> {
  bool _isExpanded = false;
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = widget.isDarkMode
        ? AppColors.textColorWhite
        : AppColors.textColorBlack;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dropdown Header
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded; // Toggle the dropdown
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            // decoration: BoxDecoration(
            //   border: Border(
            //     bottom: BorderSide(
            //       color: _isExpanded
            //           ? AppColors.primaryColor
            //           : AppColors.grey,
            //       width: 1.5,
            //     ),
            //   ),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedValue ?? widget.hintText,
                  style: appTextTheme(context).titleSmall
                ),
                SvgPicture.asset(
                  '${vectorPath}dropdown_arrow.svg',
                  color: AppColors.grey,
                ),
              ],
            ),
          ),
        ),
        // Dropdown Content
        if (_isExpanded)
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 8.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
              color: widget.isDarkMode ? Colors.black : Colors.white,
            ),
            child: ListView(
              shrinkWrap: true, // Allows the ListView to size itself
              children: widget.items
                  .map(
                    (item) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedValue = item;
                      _isExpanded = false; // Close dropdown
                      if (widget.onChanged != null) {
                        widget.onChanged!(item);
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 20.0),
                    child: Text(
                      item,
                      style: TextStyle(
                        color: widget.isDarkMode
                            ? AppColors.textColorWhite
                            : AppColors.textColorBlack,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ),
      ],
    );
  }
}

//TODO: Example usage of expanded dropdown
// ExpandingDropdown(
//   hintText: "Select an Option",
//   items: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
//   isDarkMode: true,
//   onChanged: (value) {
//     print("Selected Value: $value");
//   },
// ),


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

