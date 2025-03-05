import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showTopNotification();
    });
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  void _showTopNotification() {

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: SafeArea(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 400,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xffFCFAF2),
                borderRadius: BorderRadius.circular(5),
               border: Border.all(color: const Color(0xffFFFBF1)),
                boxShadow: const [
                  BoxShadow(offset: Offset(0, 4),color: Colors.black , blurRadius: 4)
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              // Remove the overlay only when cross icon is tapped
                              _overlayEntry?.remove();
                              _overlayEntry = null;
                            },
                            child: const Image(image: AssetImage("images/Cancel.png"),width: 30,)
                        ),
                        const SizedBox(width: 30,),
                        Text(
                          '10.00',
                          style: GoogleFonts.roboto(fontWeight: FontWeight.w500 , fontSize: 15,color: Colors.black)
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 103,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(child: Text("Claim" , style: GoogleFonts.roboto(fontSize: 15 , fontWeight: FontWeight.w500),textAlign: TextAlign.center,)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // Insert the overlay
    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    int color = 0xffF7931A;
    int currentTabIndex = 0;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final kBottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Image(image: AssetImage("images/home.png")),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: Image(image: AssetImage("images/app.png")),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: Image(image: AssetImage("images/user.png")),
        label: '',
      ),
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
            builder: (_) => HomeScreen(initialIndex: index),
          ),
        );
      },
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, height / 52),
        child: Container(
          color: Color(color),
        ),
      ),
      body: const Center(
        child: Image(image: AssetImage("images/ads.png") , height: 610,),
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }
}