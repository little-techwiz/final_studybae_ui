import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studybae/core/configs/theme/app_colours.dart';
import 'package:studybae/core/utils/constants.dart';
import 'package:studybae/core/utils/route.dart';
import 'package:studybae/core/widgets/appDropdown.dart';
import 'package:studybae/core/widgets/bottomNavigation.dart';
import 'package:studybae/core/widgets/courseCard.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({super.key});

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {

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

  final List<Map<String, dynamic>> _courses = [
    {
      'title': 'Data Analytics Basics',
      'topics': ['Introduction to Data Analytics', 'Data Cleaning', 'Data Visualization'],
    },
    {
      'title': 'Flutter Development',
      'topics': ['Setting up Flutter', 'State Management', 'Custom Widgets'],
    },
    {
      'title': 'Machine Learning',
      'topics': ['Supervised Learning', 'Unsupervised Learning', 'Neural Networks'],
    },
    {
      'title': 'Web Development',
      'topics': ['HTML & CSS Basics', 'JavaScript Fundamentals', 'Responsive Design'],
    },
  ];

  //Navigaton through pages section
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      //Handling navigation to different pages
      if(index !=1){
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, homePage);
            break;
          case 1:
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          "Library",
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
          // Static Tabs
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
                _notesPage(),
                _papersPage(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, chatPage);
        },
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTabButton("Notes", 0),
              const SizedBox(width: 20),
              _buildTabButton("Papers", 1),
            ],
          ),
          SvgPicture.asset('${vectorPath}search.svg'),
        ],
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
          style: TextStyle(
            color: tabIndex == index ? AppColors.primaryColor : AppColors.textColorWhite,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _notesPage() {
    return SingleChildScrollView(
      // padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _sectionTitle('Recommended'),
          ),
          const SizedBox(height: 6),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                _horizontalList(courseTitles),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'My Courses',
              style: appTextTheme(context).titleMedium!.copyWith(color: isDarkMode ? AppColors.textColorWhite : AppColors.textColorGrey,),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08,),
              child: _dropdownList(_courses)
          )
        ],
      ),
    );
  }

  Widget _papersPage() {
    return SingleChildScrollView(
      // padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _sectionTitle('Course Papers'),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08,),
              child: _dropdownList(_courses)
          )
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

  Widget _dropdownList(List<Map<String, dynamic>> courses) {
    return ListView.builder(
      shrinkWrap: true, // Allows ListView to adjust height dynamically
      physics: NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0), // Add spacing between items
          child: ExpandingDropdown(
            hintText: course['title'], // Course title
            items: course['topics'],  // Course topics
            isDarkMode: true,
            onChanged: (value) {
              print("Selected from ${course['title']}: $value");
            },
          ),
        );
      },
    );
  }

}
