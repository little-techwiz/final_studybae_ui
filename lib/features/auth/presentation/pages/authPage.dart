import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studybae/core/configs/theme/app_colours.dart';
import 'package:studybae/core/utils/constants.dart';
import 'package:studybae/core/utils/route.dart';
import 'package:studybae/core/widgets/appButton.dart';
import 'package:studybae/core/widgets/appCheckBox.dart';
import 'package:studybae/core/widgets/appDropdown.dart';
import 'package:studybae/core/widgets/appTextField.dart';

List<FocusNode> focusNodes = [
  FocusNode(),
  FocusNode(),
];

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isDarkMode = true;

  int tabIndex = 0;
  final PageController _pageController = PageController();


  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Background Graphics
          Container(
            width: double.infinity,
            child: Stack(
              children: [
                SvgPicture.asset(
                  '${vectorPath}page_style_element.svg',
                  fit: BoxFit.contain,
                  alignment: Alignment.topLeft,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,70, 0, 0),
                    child: SvgPicture.asset(
                      '${vectorPath}logo_minimized.svg',
                      // fit: BoxFit.contain,
                      // alignment: Alignment.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          _topTabs(),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  tabIndex = index;
                });
              },
              children: [
                _signInForm(),
                _signUpForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTabButton("Sign In", 0),
          const SizedBox(width: 10),
          _buildTabButton("Sign Up", 1),
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
        height: 40,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          border: tabIndex == index
              ? const Border(
            bottom: BorderSide(
              color: Colors.green,
              width: 2.0,
            ),
          )
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: tabIndex == index ? AppColors.textColorGreen : AppColors.green,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildSelectedWidget() {
  //   switch (tabIndex) {
  //     case 0:
  //       return _signInForm();
  //     case 1:
  //       return _signUpForm();
  //     default:
  //       return const SizedBox.shrink();
  //   }
  // }

  Widget _signInForm() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            focusNode: focusNodes[0],
            controller: nameController,
            hintText: 'Name',
            isDarkMode: isDarkMode
          ),
          const SizedBox(height: 10),
          AppTextField(
            focusNode: focusNodes[1],
            controller: emailController,
            hintText: 'E-mail',
            isDarkMode: isDarkMode
          ),
          const SizedBox(height: 20),
          AppCheckBox(
            value: isRememberMe,
            onChanged:  (value) {
              setState(() {
                isRememberMe = value!;
              });
            },
            isDarkMode: isDarkMode,
            label: "Remember me"
          ),
          const SizedBox(height: 20),
          AppButton(
            btnText: 'Login',
            voidCallBack: (){
              Navigator.pushReplacementNamed(context, homePage);
            },
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Expanded(child: Divider(color: Colors.white)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "OR",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(child: Divider(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 20),
          _socialIcons(),
        ],
      ),
    );
  }


  Widget _signUpForm() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            focusNode: focusNodes[0],
            controller: nameController,
            hintText: 'Name',
            isDarkMode: isDarkMode
          ),
          const SizedBox(height: 10),
          AppDropdown(
            hintText: 'Faculty',
            isDarkMode: isDarkMode,
            items: ['Science', 'Arts', 'Engineering'],
            onChanged: (value) {
              // Handle faculty selection
            },
          ),
          const SizedBox(height: 10),
          AppDropdown(
            hintText: 'Course',
            isDarkMode: isDarkMode,
            items: ['Course 1', 'Course 2', 'Course 3'],
            onChanged: (value) {
              // Handle course selection
            },
          ),
          const SizedBox(height: 10),
          AppDropdown(
            hintText: 'Session',
            isDarkMode: isDarkMode,
            items: ['2021/2022', '2022/2023', '2023/2024'],
            onChanged: (value) {
              // Handle session selection
            },
          ),
          const SizedBox(height: 10),
          AppTextField(
            focusNode: focusNodes[1],
            controller: TextEditingController(), // Replace with phone number controller
            hintText: 'Phone Number',
            isDarkMode: isDarkMode
          ),
          const SizedBox(height: 10),
          AppCheckBox(
            //TODO: handle value of isRememberMe properly
            value: isRememberMe,
            onChanged:  (value) {
              setState(() {
                isRememberMe = value!;
              });
            },
            isDarkMode: isDarkMode,
            label: "I agree to the ",
            clickableText: "terms and conditions",
            onClickableTextTap: (){
              //TODO: Redirect to terms and conditions page
            },
          ),
          const SizedBox(height: 20),
          AppButton(
            btnText: 'Sign Up',
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "Continue Sign up using",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          _socialIcons(),
        ],
      ),
    );
  }


  Widget _socialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon('${vectorPath}logo_google_g_icon.svg'),
        // const SizedBox(width: 15),
        _buildSocialIcon('${vectorPath}facebook_logo_icon.svg'),
        // const SizedBox(width: 15),
        _buildSocialIcon('${vectorPath}github_icon.svg'),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return GestureDetector(
      onTap: () {},
      child: SvgPicture.asset(
        assetPath,
        height: 40,
        width: 40,
      ),
    );
  }
}

