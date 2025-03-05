import 'dart:math';

import 'package:coin_boost/read_news.dart';
import 'package:coin_boost/rewarding_levels.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  final int? initialIndex;
  const HomeScreen({super.key, this.initialIndex = 0});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class CustomSpringCurve extends Curve {
  final double mass;
  final double stiffness;
  final double damping;

  const CustomSpringCurve({
    this.mass = 1.0,
    this.stiffness = 80.0,
    this.damping = 20.0,
  });

  @override
  double transformInternal(double t) {
    final double spring = 1.0 - (1.0 - t) * math.exp(-damping / mass * t);
    return spring;
  }
}



class _HomeScreenState extends State<HomeScreen> {
  int color = 0xffF7931A;

  late int _currentTabIndex;

  @override
  void initState() {
    super.initState();

    _currentTabIndex = widget.initialIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    final kTabPages = <Widget>[
      homepage(width, height , context),
      const RewardingLevels(),
      const Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
    ];
    final kBottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Image(image: AssetImage("images/home.png")) , label: ''),
      const BottomNavigationBarItem(icon: Image(image: AssetImage("images/app.png")) , label: ''),
      const BottomNavigationBarItem(icon: Image(image: AssetImage("images/user.png")) , label: ''),
    ];
    assert(kTabPages.length == kBottomNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      backgroundColor: Color(color),
      items: kBottomNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
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
      body: kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}

Widget homepage(double width, double height, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: width / 15, right: width / 15, top: height / 48),
    child: Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Image(image: AssetImage("images/profile.png"), width: 30),
                  SizedBox(width: width/60,),
                  Text(
                    "John Doe",
                    style: GoogleFonts.robotoMono(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Row(
                children: [
                  const Image(image: AssetImage("images/star-medal.png"), width: 30),
                  Text(
                    "Level 01",
                    style: GoogleFonts.robotoMono(fontSize: 13, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(width: width / 80),
                  const Image(image: AssetImage("images/wallet.png"), width: 30),
                  Text(
                    "\$25.00",
                    style: GoogleFonts.robotoMono(fontSize: 13, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: height / 20),
          Text(
            "Claim your Daily Reward",
            style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w700, color: const Color(0xff965200)),
          ),
          SizedBox(height: height / 65),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(
                width: width/3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.rotate(
                      angle: pi,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFFF7931A).withOpacity(0.18)),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xffF7931A),
                              Color(0xffFFAB45),
                            ],
                          ),
                        ),
                        child: Center(
                            child: Transform.rotate(
                                angle: pi ,
                                child: Text(
                                  "\$2\nAD" ,
                                  style: GoogleFonts.robotoMono(color: Colors.white,fontWeight: FontWeight.w700 , fontSize: 8),
                                  textAlign: TextAlign.center,
                                )
                            )
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: pi,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFFF7931A).withOpacity(0.18)),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xffF7931A),
                              Color(0xffFFAB45),
                            ],
                          ),
                        ),
                        child: Center(
                            child: Transform.rotate(
                                angle: pi ,
                                child: Text(
                                  "\$2\nAD" ,
                                  style: GoogleFonts.robotoMono(color: Colors.white,fontWeight: FontWeight.w700 , fontSize: 9),
                                  textAlign: TextAlign.center,
                                )
                            )
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: pi,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFFF7931A).withOpacity(0.18)),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xffF7931A),
                              Color(0xffFFAB45),
                            ],
                          ),
                        ),
                        child: Center(
                            child: Transform.rotate(
                                angle: pi ,
                                child: Text(
                                  "\$2\nAD" ,
                                  style: GoogleFonts.robotoMono(color: Colors.white,fontWeight: FontWeight.w700 , fontSize: 11),
                                  textAlign: TextAlign.center,
                                )
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFF7931A).withOpacity(0.18)),
                  boxShadow: const [
                    BoxShadow(offset: Offset(0,4) , blurRadius: 4 , color: Color(0x40000000) , spreadRadius: 0)
                  ]
                ),
                child: Center(
                    child: Text(
                      "\$2\nAD" ,
                      style: GoogleFonts.robotoMono(color: const Color(0xFFF7931A),fontWeight: FontWeight.w700 , fontSize: 15),
                      textAlign: TextAlign.center,
                    )
                ),
              ),

              SizedBox(
                width: width/3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.rotate(
                      angle: pi,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFFF7931A).withOpacity(0.18)),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xffF7931A),
                              Color(0xffFFAB45),
                            ],
                          ),
                        ),
                        child: Center(
                            child: Transform.rotate(
                                angle: pi ,
                                child: Text(
                                  "\$2\nAD" ,
                                  style: GoogleFonts.robotoMono(color: Colors.white,fontWeight: FontWeight.w700 , fontSize: 11),
                                  textAlign: TextAlign.center,
                                )
                            )
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: pi,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFFF7931A).withOpacity(0.18)),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xffF7931A),
                              Color(0xffFFAB45),
                            ],
                          ),
                        ),
                        child: Center(
                            child: Transform.rotate(
                                angle: pi ,
                                child: Text(
                                  "\$2\nAD" ,
                                  style: GoogleFonts.robotoMono(color: Colors.white,fontWeight: FontWeight.w700 , fontSize: 9),
                                  textAlign: TextAlign.center,
                                )
                            )
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: pi,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFFF7931A).withOpacity(0.18)),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xffF7931A),
                              Color(0xffFFAB45),
                            ],
                          ),
                        ),
                        child: Center(
                            child: Transform.rotate(
                                angle: pi ,
                                child: Text(
                                  "\$2\nAD" ,
                                  style: GoogleFonts.robotoMono(color: Colors.white,fontWeight: FontWeight.w700 , fontSize: 8),
                                  textAlign: TextAlign.center,
                                )
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              )


      ]
          ),
          SizedBox(height: height/30,),
          Text(
            "Do Task, Earn Reward",
            style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 20, color: const Color(0xff965200)),
          ),
          SizedBox(
            width: width/1.3,
            child: Text(
              "You can do these tasks as many times as you want to",
              style: GoogleFonts.robotoMono(fontWeight: FontWeight.w700, fontSize: 13, color: const Color(0xff0D0D0D)),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: height/40,),
          Container(
            width: width/1.25,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.black,
              image: const DecorationImage(image: AssetImage("images/photo1.png") , fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Opacity(
                  opacity: 0.88,
                  child: Container(
                    width: 358,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Play Games" , style: GoogleFonts.robotoMono(fontWeight: FontWeight.w700 , fontSize: 16) , textAlign: TextAlign.center,),
                        Text("\$10" , style: GoogleFonts.robotoMono(fontWeight: FontWeight.w700 , fontSize: 16) , textAlign: TextAlign.center,),
                      ],
                    ),
                    ),
                  ),
              ],
            ),
          ),

          SizedBox(height: height/40,),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const ReadNews(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    var begin = const Offset(0.0, 1.0);
                    var end = Offset.zero;

                    var curve = const CustomSpringCurve(
                      mass: 1.0,
                      stiffness: 80.0,
                      damping: 20.0,
                    );

                    var tween = Tween(begin: begin, end: end).chain(
                      CurveTween(curve: curve),
                    );

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 800),
                ),
              );
            },
            child: Container(
              width: width/1.25,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.black,
                image: const DecorationImage(image: AssetImage("images/photo2.png") , fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Opacity(
                    opacity: 0.88,
                    child: Container(
                      width: 358,
                      height: 45,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Read News" , style: GoogleFonts.robotoMono(fontWeight: FontWeight.w700 , fontSize: 16) , textAlign: TextAlign.center,),
                          Text("\$5" , style: GoogleFonts.robotoMono(fontWeight: FontWeight.w700 , fontSize: 16) , textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}