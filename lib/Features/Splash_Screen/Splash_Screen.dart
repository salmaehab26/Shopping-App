
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/Features/auth/log_in/log_in_screen.dart';

import '../../Core/resources/my_colors.dart';
import '../../Core/resources/app_assets.dart';


class SplashScreen extends StatefulWidget {
@override
_SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // إنشاء الأنيميشن
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -0.1, end: 0.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // الانتقال إلى Home Page بعد 3 ثوانٍ
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return  Transform.rotate(
                  angle: _animation.value, // تدوير الصورة بشكل طفيف
                  alignment: Alignment.topCenter, // تثبيت الجزء العلوي وتحريك السفلي
                  child: Image.asset(AppAssets.Splashscreen, width: 250),
                );
              },
            ),
          ),
          Center(child: Column(children: [Text("STYLISH",style:TextStyle(fontSize: 20) ),Text("Find Your Slyle",style:TextStyle(fontSize: 20))]),)
        ],
      ),
    );
  }
}