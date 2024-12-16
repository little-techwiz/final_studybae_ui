import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studybae/core/utils/constants.dart';
import 'package:studybae/core/utils/route.dart';
import 'package:studybae/core/widgets/appButton.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

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
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SvgPicture.asset(
                '${vectorPath}get_started_vector.svg',
                // fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Kick start your learning journey today',
              // overflow: TextOverflow.clip,
            ),
          ),
          AppButton(
            btnText: 'Get Started',
            voidCallBack: (){
              Navigator.pushReplacementNamed(context, authPage);
            },
          )
        ],
      ),
    );
  }
}
