import 'package:flutter/material.dart';

class Splashscreen1 extends StatelessWidget {
  final PageController pageController;
  Splashscreen1({super.key,required this.pageController});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Start You'r HealthCare Journey",
            style:  TextStyle(
               fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(0xFF000000),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              '''Your health is our priority,Consult with 
        our top doctors today''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily:
                'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFFB5B5B5),
              ),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width:double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                print(pageController);
                pageController.nextPage(duration: Duration(milliseconds: 500), curve:Curves.easeInOut);

                //pageController.animateToPage(1, duration: Duration(microseconds: 500), curve:Curves.easeInOut);

              },
              style: ElevatedButton.styleFrom(
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                backgroundColor: Colors.green,

                ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Next",

                    style:TextStyle(
                      color:Colors.white,
                      fontSize: 20,
                    )
                    ),
                    Icon(Icons.arrow_forward_sharp,
                    size: 30,
                      color:Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



}
