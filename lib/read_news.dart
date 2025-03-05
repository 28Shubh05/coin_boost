import 'package:coin_boost/home_screen.dart';
import 'package:coin_boost/task.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class ReadNews extends StatefulWidget {
  const ReadNews({super.key});

  @override
  State<ReadNews> createState() => _ReadNewsState();
}

class _ReadNewsState extends State<ReadNews> {
  @override
  Widget build(BuildContext context) {
    int color = 0xffF7931A;
    int currentTabIndex = 0;
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;



    final kBottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Image(image: AssetImage("images/home.png")) , label: ''),
      const BottomNavigationBarItem(icon: Image(image: AssetImage("images/app.png")) , label: ''),
      const BottomNavigationBarItem(icon: Image(image: AssetImage("images/user.png")) , label: ''),
    ];

    final bottomNavBar = BottomNavigationBar(
      backgroundColor: Color(color),
      items: kBottomNavBarItems,
      currentIndex: currentTabIndex,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (int index) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (_) => HomeScreen(initialIndex: index)
            )
        );
      },
    );


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(width, height / 52),
        child: Container(
          color: Color(color),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: height/48 , left: width/15 , right: width/15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                    child: const Image(image: AssetImage("images/Back.png"), width: 40)
                ),
                SizedBox(width: width / 5),
                Text(
                  "Read News",
                  style: GoogleFonts.robotoMono(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(color)
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: height/20,),
            Container(
                width: width/1.2,
                height: 160,
                decoration: BoxDecoration(
                color: Colors.black,
                image: const DecorationImage(image: AssetImage("images/photo2.png") , fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(10),
                ),
            ),
            SizedBox(height: height/20,),
            Text("Rules of Task" , style: GoogleFonts.robotoMono(fontSize: 20 , fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            SizedBox(height: height/30,),
            Text("1. Keep scrolling for 10 minutes.\n2. Keep clicking every 30 seconds.\n3. Don't leave still screen for more than 30 seconds.",
            style: GoogleFonts.roboto(fontWeight: FontWeight.w400 , fontSize: 14 , height: height/400),),
            SizedBox(height: height/30,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const Task(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: animation.drive(
                          Tween<double>(begin: 0.0, end: 1.0).chain(
                            CurveTween(
                              curve: const SpringCurve(
                                mass: 1.0,
                                stiffness: 100.0,
                                damping: 15.0,
                              ),
                            ),
                          ),
                        ),
                        child: child,
                      );
                    },
                  ),
                );

              },
              child: Container(
                width: width/2.1,
                height: height/18,
                decoration: BoxDecoration(
                  color: Color(color),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x40000000), // Updated color
                      offset: Offset(0, 4), // x = 0, y = 4
                      spreadRadius: 0, // spread = 0
                      blurRadius: 4, // blur = 4
                    ),
                  ],
                ),
                child: Center(child: Text("Start Task" , style: GoogleFonts.robotoMono(fontSize: 16 , fontWeight: FontWeight.w700 , color: Colors.white),textAlign: TextAlign.center,)),
              ),
            )
        ]
        ),
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }
}

class SpringCurve extends Curve {
  final double mass;
  final double stiffness;
  final double damping;

  const SpringCurve({
    required this.mass,
    required this.stiffness,
    required this.damping,
  });

  @override
  double transformInternal(double t) {
    return 1.0 - math.exp(-damping / mass * t) *
        math.cos(stiffness / mass * t);
  }
}
