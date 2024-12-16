import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studybae/core/configs/theme/app_colours.dart';
import 'package:studybae/core/utils/constants.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        indicatorColor: AppColors.indicatorColor,
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>(
              (Set<WidgetState> states) {
                return appTextTheme(context).labelSmall;
            // if (states.contains(WidgetState.selected)) {
            //   // Text style for the selected label
            //
            // } else {
            //   // Text style for unselected labels
            //   return appTextTheme(context).labelSmall;
            // }
          },
        ),
      ),
      child: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: <NavigationDestination>[
          NavigationDestination(
            icon: SvgPicture.asset(
              '${vectorPath}home.svg',
              color: AppColors.grey,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              '${vectorPath}book.svg',
              color: AppColors.grey,
            ),
            label: 'Study',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              '${vectorPath}download.svg',
              color: AppColors.grey,
            ),
            label: 'Downloads',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              '${vectorPath}person.svg',
              color: AppColors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
