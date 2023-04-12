import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, 'home');
    },);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Image.network(
                  "https://cdn.dribbble.com/users/1293294/screenshots/3860885/3.png",
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill),
              Text("Address Book",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 25),)
            ],
          ),
        ),
      ),
    );
  }
}
