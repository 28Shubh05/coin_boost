import 'package:coin_boost/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RewardingLevels extends StatefulWidget {
  const RewardingLevels({super.key});

  @override
  State<RewardingLevels> createState() => _RewardingLevelsState();
}

class _RewardingLevelsState extends State<RewardingLevels> {
  int color = 0xffF7931A;
  List<double> earning = [25.0, 0.0, 0.0];
  List<double> minWithdrawal = [50.0, 100.0, 150.0];
  List<double> per = [0.0 , 0.0 , 0.0];

  @override
  void initState() {
    super.initState();
    per[0] = earning[0] / minWithdrawal[0];
    per[1] = earning[1] / minWithdrawal[1];
    per[2] = earning[2] / minWithdrawal[2];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: width/12, right: width/12, top: height/60),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: (){
                      setState(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const HomeScreen(),
                          ),
                        );
                      });
                    },
                    child: const Image(image: AssetImage("images/Back.png"), width: 40)
                ),
                SizedBox(width: width / 10),
                Text(
                  "Rewarding Levels",
                  style: GoogleFonts.robotoMono(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(color)
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: height/30,),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context , index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 28.0),
                    child: Container(
                      width: width/1.2,
                      height: height/5,
                      decoration: BoxDecoration(
                          color: Color(color),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(color)),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x40000000),
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                spreadRadius: 0
                            ),
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 24),
                            child: Text(
                              "Level 0${index+1}",
                              style: GoogleFonts.robotoMono(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.white
                              ),
                            ),
                          ),
                          Container(
                            height: height/6.7,
                            width: width/1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Color(color)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0, top: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Minimum Withdrawal = \$${minWithdrawal[index].toStringAsFixed(0)}",
                                    style: GoogleFonts.robotoMono(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Color(color)
                                    ),
                                  ),
                                  Text(
                                    "Your earning = \$${earning[index].toStringAsFixed(0)}",
                                    style: GoogleFonts.robotoMono(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xff555555)
                                    ),
                                  ),
                                  SizedBox(height: height/50),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Container(
                                      height: 18,
                                      width: width/1.4,
                                      decoration: BoxDecoration(
                                        color: Colors.white, // Light grey background
                                        border: Border.all(color: Color(color)),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: FractionallySizedBox(
                                        widthFactor: per[index] > 1 ? 1 : per[index],
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          height: 18,
                                          decoration: BoxDecoration(
                                            color: Color(color),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Center(child: Text("${(per[index]*100).toInt()}%" , style: GoogleFonts.robotoMono(fontWeight: FontWeight.w700 , fontSize: 12 , color: Colors.white),textAlign: TextAlign.center,)),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}