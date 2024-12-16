import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studybae/core/configs/theme/app_colours.dart';
import 'package:studybae/core/utils/constants.dart';

class CourseCard extends StatelessWidget {
  final String title;
  const CourseCard({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.textColorGrey,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          SvgPicture.asset(
            '${vectorPath}moon.svg',
            fit: BoxFit.contain
            // fit: BoxFit.cover,
          ),
          // Text at the bottom-left
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.textColorWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
