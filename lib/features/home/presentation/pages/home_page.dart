import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studybae/core/configs/theme/app_colours.dart';
import 'package:studybae/core/utils/route.dart';
import 'package:studybae/core/widgets/bottomNavigation.dart';
import 'package:studybae/core/widgets/courseCard.dart';
import 'package:studybae/core/widgets/linkedCourseCard.dart';

import '../../../../core/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int tabIndex = 0;
  final PageController _pageController = PageController();

  bool isDarkMode = true;

  List<String> courseTitles = [
    'Flutter Development',
    'Dart Programming',
    'UI/UX Design',
    'React Native Basics',
    'Web Development',
    'Machine Learning',
    'Data Science',
    'Android App Development'
  ];

  //Navigaton through pages section
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      //Handling navigation to different pages
      if(index !=0){
        switch (index) {
          case 0:
            break;
          case 1:
            Navigator.pushReplacementNamed(context, studyPage);
            break;
          case 2:
            Navigator.pushReplacementNamed(context, downloadPage);
            break;
          case 3:
            Navigator.pushReplacementNamed(context, profilePage);
            break;
        }
      }
    });
  }

  // Tracks the currently selected date
  DateTime? selectedDate;

  // Days in a week
  final List<String> days = ["MON", "TUE", "WED", "THUR", "FRI", "SAT", "SUN"];

  final tasks = [
    {
      "title": "Comp 222. Assembly Language Prog...",
      "time": "09:00 A.M - 11:00 A.M",
      "location": "PST2",
      "isCompleted": true,
    },
    {
      "title": "Stat 232. Statistics and Probability i",
      "time": "3:00 P.M - 5:00 P.M",
      "location": "NPL 1A",
      "isCompleted": false,
    },
    {
      "title": "Comp 223. OOP Programming",
      "time": "2:00 P.M - 3:00 P.M",
      "location": "PST3",
      "isCompleted": false,
    },
    {
      "title": "Comp 223. OOP Programming",
      "time": "11:00 A.M - 1:00 P.M",
      "location": "PST3",
      "isCompleted": false,
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          "Home",
          // style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('${vectorPath}streaks.svg'),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset('${vectorPath}streaks.svg'),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Static Tabs (Home and Calendar)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _topTabs()
          ),
          // PageView for swiping between pages
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  tabIndex = index;
                });
              },
              children: [
                _homePage(),
                _calendarPage(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Adjust border radius here
        ),
        backgroundColor: AppColors.primaryColor, // Background color
        elevation: 6.0,
        tooltip: 'Chat with AI',
        child: SvgPicture.asset('${vectorPath}ai.svg'),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }

  Widget _topTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildTabButton("Home", 0),
              const SizedBox(width: 20),
              _buildTabButton("Calendar", 1),
            ],
          ),
          SvgPicture.asset('${vectorPath}search.svg'),
        ]
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tabIndex = index;
        });
        _pageController.jumpToPage(index);
      },
      child: Container(
        decoration: BoxDecoration(
          border: tabIndex == index
              ? Border(
            bottom: BorderSide(
              color: AppColors.primaryColor,
              width: 3.0,
            ),
          )
              : null,
        ),
        child: Text(
          title,
          style: appTextTheme(context).titleMedium!.copyWith(color: tabIndex == index ? AppColors.textColorWhite : AppColors.textColorGrey,),
        ),
      ),
    );
  }

  Widget _homePage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _sectionTitle('Recents')
          ),
          const SizedBox(height: 6),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.greenTenthOpacity,
            ),
            child: Column(
              children: [
                _horizontalList(courseTitles),
                const SizedBox(height: 10),
                _sectionTitle('My Courses', actionText: 'See More'),
                const SizedBox(height: 10,),
                _horizontalList(courseTitles),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: _sectionTitle('Explore More'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              children: [
                LinkedCourseCard(
                  imageUrl: 'https://i.pinimg.com/736x/4e/10/e0/4e10e0995adad7c09565fd0bc1f8f4a8.jpg',
                  title: 'Free Beginner Data Analytics Sessions with Ms. Konya',
                  description: 'Join Our Free 7-Day Data Analytics Course with Ms. docs.google.com',
                  link: 'https://doc.google.com/forms/d/e/1FAIpQlSeuP3n...'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, {String? actionText}) {
    List<Widget> children = [
      Text(
        title,
        style: appTextTheme(context).titleSmall,
      ),
    ];

    if (actionText != null) {
      children.add(
        GestureDetector(
          onTap: () {},
          child: Text(
            actionText!,
            style: appTextTheme(context).titleSmall!.copyWith(color: AppColors.primaryColor),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }



  Widget _horizontalList(List<String> items) {
    return SizedBox(
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) => CourseCard(title: items[index]),
      ),
    );
  }

  Widget _calendarPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: _sectionTitle("January 2025")
          ),
          const SizedBox(height: 10),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: _calendarGrid()),
          const SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.primaryColor,
                  width: 3.0,
                ),
              ),
            ),
            child: Text(
              'Today',
              style: appTextTheme(context).titleMedium!.copyWith(color: isDarkMode ? AppColors.textColorWhite : AppColors.textColorGrey,),
            ),
          ),
          const SizedBox(height: 6,),
          _taskList(),
        ],
      ),
    );
  }

  Widget _calendarGrid(){
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: days
                .map((day) => Text(
              day,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ))
                .toList(),
          ),
          Container(// Set the height for the ListView
            // height: 900,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 10,
              ),
              itemCount: 31, // Set the item count to the length of the services list
              itemBuilder: (context, index) {
                final day = index + 1;
                final isSelected = selectedDate != null && selectedDate!.day == day;
                return GestureDetector(
                  onTap: (){
                    // Navigator.pushNamed(context, search, arguments: service.name);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8.0),
                      border: isSelected
                          ? Border.all(color: Colors.green, width: 2.0)
                          : null,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$day',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        // fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
          // Expanded(
          //   child: GridView.builder(
          //     physics: const NeverScrollableScrollPhysics(), // Prevent scrolling if not needed
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 7, // 7 days per week
          //       crossAxisSpacing: 8.0,
          //       mainAxisSpacing: 8.0,
          //     ),
          //     itemCount: 31, // Total days in the month
          //     itemBuilder: (context, index) {
          //       final day = index + 1;
          //       final isSelected = selectedDate != null && selectedDate!.day == day;
          //
          //       return GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             selectedDate = DateTime(2023, 12, day);
          //           });
          //         },
          //         child: Container(
          //           decoration: BoxDecoration(
          //             color: Colors.grey[800],
          //             borderRadius: BorderRadius.circular(8.0),
          //             border: isSelected
          //                 ? Border.all(color: Colors.green, width: 2.0)
          //                 : null,
          //           ),
          //           alignment: Alignment.center,
          //           child: Text(
          //             '$day',
          //             style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 16,
          //               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }


  Widget _scheduleItem({
    required String title,
    required String time,
    required String location,
    required bool isCompleted,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            margin: const EdgeInsets.only(top: 4.0),
            child: isCompleted
                ? const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
                : const Icon(
              Icons.radio_button_off,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }


  Widget _taskList() {
    // final tasks = [
    //   {
    //     "title": "Comp 222. Assembly Language Programming",
    //     "time": "09:00 A.M - 11:00 A.M",
    //     "completed": true,
    //     "location": "PST 2"
    //   },
    //   {
    //     "title": "Comp 223. OOP Programming",
    //     "time": "11:00 A.M - 1:00 P.M",
    //     "completed": false,
    //     "location": "PST 2"
    //   },
    //   {
    //     "title": "Comp 223. OOP Programming",
    //     "time": "2:00 P.M - 3:00 P.M",
    //     "completed": false,
    //     "location": "NPL1 A"
    //   },
    //   {
    //     "title": "Stat 232. Statistics and Probability I",
    //     "time": "3:00 P.M - 5:00 P.M",
    //     "completed": false,
    //     "location": "PST 1"
    //   },
    // ];

    return Container(
      height: 500,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.greenTenthOpacity,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 2,
                  height: constraints.maxHeight, // Set the height relative to the parent
                  color: Colors.white,
                ),
              );
            },
          ),
          Expanded(
            child: Column(
              children: tasks.map((task) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(16),
                  // decoration: BoxDecoration(
                  //   color: Colors.grey[800],
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task["title"] as String,
                              style: appTextTheme(context).titleSmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              task["time"] as String,
                              style: appTextTheme(context).labelMedium,
                            ),
                            Text(
                              task["location"] as String,
                              style: appTextTheme(context).labelMedium,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        (task["completed"] as bool? ?? false) // Use null-aware operator to handle null values
                            ? Icons.check_circle
                            : Icons.circle_outlined,
                        color: AppColors.green,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }


}

// ListView.builder(
// itemCount: tasks.length,
// itemBuilder: (context, index) {
// final schedule = tasks[index];
// return _scheduleItem(
// title: schedule['title'] ?? 'No title',
// time: schedule['time'] ?? 'No time',
// location: schedule['location'] ?? 'No location',
// isCompleted: schedule['isCompleted'] ?? false,
// );
// },

// children: [
//   _scheduleItem(
//     title: "Comp 222. Assembly Language Prog...",
//     time: "09:00 A.M - 11:00 A.M",
//     location: "PST2",
//     isCompleted: true,
//   ),
//   _scheduleItem(
//     title: "Comp 223. OOP Programming",
//     time: "11:00 A.M - 1:00 P.M",
//     location: "PST3",
//     isCompleted: false,
//   ),
//   _scheduleItem(
//     title: "Comp 223. OOP Programming",
//     time: "2:00 P.M - 3:00 P.M",
//     location: "PST3",
//     isCompleted: false,
//   ),
//   _scheduleItem(
//     title: "Stat 232. Statistics and Probability i",
//     time: "3:00 P.M - 5:00 P.M",
//     location: "NPL 1A",
//     isCompleted: false,
//   ),
// ],
// )
