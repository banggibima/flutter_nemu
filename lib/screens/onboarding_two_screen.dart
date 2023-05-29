import 'package:flutter/material.dart';

import 'home_screen.dart';

class OnboardingTwoScreen extends StatefulWidget {
  const OnboardingTwoScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingTwoScreen> createState() => _OnboardingTwoScreenState();
}

class _OnboardingTwoScreenState extends State<OnboardingTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 675.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 80.0,
                        bottom: 40.0,
                      ),
                      child: Image.asset(
                        'assets/images/onboarding-2.png',
                        width: 300,
                        height: 300,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      width: 350.0,
                      child: Text(
                        'Found something of value on campus',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF212121),
                          fontFamily: 'Inter',
                          fontSize: 30.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.1,
                        ),
                      ),
                    ),
                    Container(
                      width: 275.0,
                      child: Text(
                        'You can find information about any item that have been found and reported to us.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF212121),
                          fontFamily: 'Inter',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 60.0,
                    vertical: 20.0,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFDB2542),
                        Color(0xFFF36C2E),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'Inter',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      extendBody: true,
    );
  }
}
