import 'package:flutter/material.dart';
import 'package:studybae/core/configs/theme/app_colours.dart';
import 'package:studybae/core/utils/constants.dart';

class LinkedCourseCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String link;

  const LinkedCourseCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      // padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.black,
        // borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.blackyNinetyOpacity,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                  child: Image.network(
                    imageUrl,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                // const SizedBox(width: 12.0),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // padding: EdgeInsets.all(6),
                      children: [
                        Text(
                          title,
                          style: appTextTheme(context).labelMedium,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          description,
                          style: appTextTheme(context).labelMedium!.copyWith(color: AppColors.textColorGrey
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                // Handle link tap
              },
              child: Text(
                link,
                style: appTextTheme(context).labelMedium!.copyWith(color: AppColors.textColorGreen),
              ),
            ),
          ),
        ],
      ),
    );
  }
}