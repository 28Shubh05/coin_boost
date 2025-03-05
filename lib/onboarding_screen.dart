import 'package:animations/animations.dart';
import 'package:coin_boost/assets/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int color = 0xffF7931A;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height/18,),
              const Image(image: AssetImage("images/boost_splash.png"),width: 110,),
              SizedBox(height: height/60,),
              Text("COINBOOST" ,
                style: AppWidth.subHeadingTextFieldStyle(),
              ),
              SizedBox(height: height/24,),
              const Image(image: AssetImage("images/savings.png"),width: 240,),
              SizedBox(height: height/12,),
              Container(
                width: 307,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: const Color(0xDEDEDEDB)),
                    boxShadow: const [
                      BoxShadow(offset: Offset(0, 4) , blurRadius: 4 , color: Color(0x40000000))
                    ]
                ),
                child: TextField(
                  controller: _controller,
                  onChanged: (value){

                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Enter your Mobile Number",
                    hintStyle: GoogleFonts.robotoMono(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey // Changed from white24 to visible grey
                    ),
                    // Remove border
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    // Add left padding
                    contentPadding: const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  ),
                  style: GoogleFonts.robotoMono(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black, // Text color when typing
                  ),
                ),
              ),
              SizedBox(height: height/24,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const HomeScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return SharedAxisTransition(
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.scaled,
                          fillColor: Colors.transparent,
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 700), //Adjust to your liking
                    ),
                  );
                },
                child: Container(
                  width: 307,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(color),
                  ),
                  child: Center(
                      child:
                      Text(
                        "Continue" ,
                        style: GoogleFonts.robotoMono(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.w700),
                      )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}