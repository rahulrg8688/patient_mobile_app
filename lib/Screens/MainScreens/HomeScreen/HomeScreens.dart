import 'package:flutter/material.dart';

class Homescreens extends StatelessWidget {
  const Homescreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width:double.infinity,
        height:600,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: double.infinity,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 13),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Expanded(
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF5E55EA),
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 55),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0x99000000),
                                          ),
                                          child: SizedBox(
                                            width: 360,
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(20, 16.5, 20, 6.5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(0, 0, 9, 0),
                                                    child: SizedBox(
                                                      width: 263,
                                                      child: Text(
                                                        '12:57',
                                                        style: TextStyle(
                                                          fontFamily:'Poppins',
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 12,
                                                          color: Color(0xFFFFFFFF),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(0, 3.5, 0, 4.5),
                                                    child: SizedBox(
                                                      width: 48,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                color: Color(0xFFFFFFFF),
                                                                borderRadius: BorderRadius.circular(8),
                                                              ),
                                                              child: Container(
                                                                width: 23,
                                                                height: 10,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.fromLTRB(0, 5, 2, 0),
                                                                  child: Container(
                                                                    decoration: BoxDecoration(
                                                                      color: Color(0xFFFFFFFF),
                                                                      borderRadius: BorderRadius.only(
                                                                        topLeft: Radius.circular(4),
                                                                        topRight: Radius.circular(4),
                                                                      ),
                                                                    ),
                                                                    child: Container(
                                                                      width: 2,
                                                                      height: 5,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets.fromLTRB(0, 3, 2, 0),
                                                                  child: Container(
                                                                    decoration: BoxDecoration(
                                                                      color: Color(0xFFFFFFFF),
                                                                      borderRadius: BorderRadius.only(
                                                                        topLeft: Radius.circular(4),
                                                                        topRight: Radius.circular(4),
                                                                      ),
                                                                    ),
                                                                    child: Container(
                                                                      width: 2,
                                                                      height: 7,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                    color: Color(0xFFFFFFFF),
                                                                    borderRadius: BorderRadius.only(
                                                                      topLeft: Radius.circular(4),
                                                                      topRight: Radius.circular(4),
                                                                    ),
                                                                  ),
                                                                  child: Container(
                                                                    width: 2,
                                                                    height: 10,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(20, 0, 22, 0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(0, 0, 27.5, 0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
                                                    width: 62,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(31),
                                                    ),
                                                    child:
                                                    Positioned(
                                                      right: -1,
                                                      bottom: 0,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: NetworkImage(
                                                              'assets/images/image.png',
                                                            ),
                                                          ),
                                                        ),
                                                        child: Container(
                                                          width: 63,
                                                          height: 62,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(0, 11, 0, 11),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                                                          child: Align(
                                                            alignment: Alignment.topLeft,
                                                            child: Text(
                                                              'Hello Welcome',
                                                              style: TextStyle(
                                                               fontFamily:  'Poppins',
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 10,
                                                                color: Color(0xFFFFFFFF),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Lora Maddison',
                                                          style: TextStyle(
                                                            fontFamily: 'Poppins',
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 14,
                                                            color: Color(0xFFFFFFFF),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(0, 11, 0, 11),
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Color(0xFFD5D5D5)),
                                                borderRadius: BorderRadius.circular(4),
                                                color: Color(0x99000000),
                                              ),
                                              child: SizedBox(
                                                width: 114,
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(14, 11.5, 0, 11.5),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0, 0, 8.6, 0),
                                                        child: Text(
                                                          'Banjarahills',
                                                          style: TextStyle(
                                                           fontFamily:  'Poppins',
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 10,
                                                            color: Color(0xFFFFFFFF),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0, 0.5, 0, 0.5),
                                                        width: 8,
                                                        height: 14,
                                                        child:
                                                        SizedBox(
                                                          width: 8,
                                                          height: 14,
                                                          // child: SvgPicture.network(
                                                          //   'assets/vectors/path_5_x2.svg',
                                                          // ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                SizedBox(
                                  width:double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(child: Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 89, 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin:Alignment(0,-1),
                                              end:Alignment(0,1),
                                              colors:<Color>[Color(0xFFF8F2FF),Color(0xFFFFFFFF)],
                                              stops: <double>[0,0.666],
                                            ),
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(20, 53,13.7, 85),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(1, 0, 5.3, 29),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 19),
                                                        width: 320,
                                                        height: 145,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                        ),
                                                        child:
                                                        Positioned(
                                                          left: 0,
                                                          right: 0,
                                                          top: -3,
                                                          bottom: -3,
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              // image: DecorationImage(
                                                              //   fit: BoxFit.cover,
                                                              //   // image: NetworkImage(
                                                              //   //   'assets/images/image_2.png',
                                                              //   // ),
                                                              // ),
                                                            ),
                                                            child: Container(
                                                              width: 320,
                                                              height: 151,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                                        child: SizedBox(
                                                          width: 35,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  color: Color(0xFF5E55EA),
                                                                  borderRadius: BorderRadius.circular(3.5),
                                                                ),
                                                                child: Container(
                                                                  width: 7,
                                                                  height: 7,
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    color: Color(0xFFD5D5D5),
                                                                    borderRadius: BorderRadius.circular(2.5),
                                                                  ),
                                                                  child: Container(
                                                                    width: 5,
                                                                    height: 5,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    color: Color(0xFFD5D5D5),
                                                                    borderRadius: BorderRadius.circular(2.5),
                                                                  ),
                                                                  child: Container(
                                                                    width: 5,
                                                                    height: 5,
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
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 7.1, 18),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0, 0, 13.5, 0),
                                                        child: SizedBox(
                                                          width: 253.5,
                                                          child: Text(
                                                            'Specialization',
                                                            style: TextStyle(
                                                             fontFamily:  'Poppins',
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 18,
                                                              color: Color(0xFF000000),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0, 2, 0, 1),
                                                        child: Text(
                                                          'See all',
                                                          style: TextStyle(
                                                            fontFamily: 'Poppins',
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 16,
                                                            color: Color(0xFF5E55EA),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                                  child: Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets.fromLTRB(0, 0, 14, 0),
                                                          padding: EdgeInsets.fromLTRB(18, 7, 18.1, 7),
                                                          decoration: BoxDecoration(
                                                            border: Border.all(color: Color(0xFFD5D5D5)),
                                                            borderRadius: BorderRadius.circular(62),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
                                                                child: SizedBox(
                                                                  width: 22,
                                                                  height: 22,
                                                                  // child: SvgPicture.network(
                                                                  //   'assets/vectors/female_3_x2.svg',
                                                                  // ),
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.fromLTRB(0, 0.5, 0, 0.5),
                                                                child: Text(
                                                                  'Maternity',
                                                                  style: TextStyle(
                                                                    fontFamily:'Poppins',
                                                                    fontWeight: FontWeight.w400,
                                                                    fontSize: 14,
                                                                    color: Color(0xFF000000),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                                                          padding: EdgeInsets.fromLTRB(12, 7, 12.2, 7),
                                                          decoration: BoxDecoration(
                                                            border: Border.all(color: Color(0xFFD5D5D5)),
                                                            borderRadius: BorderRadius.circular(62),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.fromLTRB(0, 0.5, 3, 0.5),
                                                                child: SizedBox(
                                                                  width: 20,
                                                                  height: 20,
                                                                  // child: SvgPicture.network(
                                                                  //   'assets/vectors/account_child_1_x2.svg',
                                                                  // ),
                                                                ),
                                                              ),
                                                              Text(
                                                                'Obestetrics',
                                                                style: TextStyle(
                                                                  fontFamily:'Poppins',
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 14,
                                                                  color: Color(0xFF000000),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
            
            
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 11.1, 14),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0, 0, 13.5, 0),
                                                        child: SizedBox(
                                                          width: 249.5,
                                                          child: Text(
                                                            'Top Doctor’s',
                                                            style: TextStyle(
                                                              fontFamily:'Poppins',
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 18,
                                                              color: Color(0xFF000000),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0, 2, 0, 1),
                                                        child: Text(
                                                          'See all',
                                                          style: TextStyle(
                                                            fontFamily:'Poppins',
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 16,
                                                            color: Color(0xFF5E55EA),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                                                  child: Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Container(
                                                      padding: EdgeInsets.fromLTRB(14, 14, 14, 18),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                color: Color(0xFFECECEC),
                                                                borderRadius: BorderRadius.only(
                                                                  topLeft: Radius.circular(4),
                                                                  topRight: Radius.circular(4),
                                                                ),
                                                              ),
                                                              child: SizedBox(
                                                                width: 191,
                                                                child: Container(
                                                                  padding: EdgeInsets.fromLTRB(0, 4, 15, 0),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                                        child: Container(
                                                                          decoration: BoxDecoration(
                                                                            image: DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: NetworkImage(
                                                                                'assets/images/dr_preeti_reddy_2_removebg_preview_1.png',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          child: Container(
                                                                            width: 105,
                                                                            height: 105,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.fromLTRB(0, 11, 0, 71),
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(11.5),
                                                                          color: Color(0xFFD9D9D9),
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Color(0x0F121212),
                                                                              offset: Offset(0, 4),
                                                                              blurRadius: 13,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        child: Container(
                                                                          width: 23,
                                                                          height: 23,
                                                                          padding: EdgeInsets.fromLTRB(8.2, 8.7, 7.2, 7.6),
                                                                          child:
                                                                          Container(
                                                                            width: 7.6,
                                                                            height: 6.7,
                                                                            child:
                                                                            SizedBox(
                                                                              width: 7.6,
                                                                              height: 6.7,
                                                                              // child: SvgPicture.network(
                                                                              //   'assets/vectors/path_8_x2.svg',
                                                                              // ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.fromLTRB(0, 0, 0.5, 0),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.fromLTRB(0, 0, 42.7, 0),
                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                                                        child: Align(
                                                                          alignment: Alignment.topLeft,
                                                                          child: Text(
                                                                            'Dr.Aviksh',
                                                                            style: TextStyle(
                                                                             fontFamily: 'Poppins',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16,
                                                                              color: Color(0xFF000000),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.fromLTRB(2.8, 0, 0, 0),
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              margin: EdgeInsets.fromLTRB(0, 5.7, 8, 5.7),
                                                                              child: SizedBox(
                                                                                width: 14.4,
                                                                                height: 9.6,
                                                                                // child: SvgPicture.network(
                                                                                //   'assets/vectors/vital_signs_4_x2.svg',
                                                                                // ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'Cardiologist',
                                                                              style: TextStyle(
                                                                               fontFamily: 'Poppins',
                                                                                fontWeight: FontWeight.w400,
                                                                                fontSize: 14,
                                                                                color: Color(0xFFC1C1C1),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 32),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.fromLTRB(0, 3.5, 3, 3.5),
                                                                        child: SizedBox(
                                                                          width: 14,
                                                                          height: 14,
                                                                          // child: SvgPicture.network(
                                                                          //   'assets/vectors/star_3_x2.svg',
                                                                          // ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '4.5',
                                                                        style: TextStyle(
                                                                         fontFamily: 'Poppins',
                                                                          fontWeight: FontWeight.w400,
                                                                          fontSize: 14,
                                                                          color: Color(0xFFB5B5B5),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
            
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 7.1, 14),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0, 0, 13.5, 0),
                                                        child: SizedBox(
                                                          width: 253.5,
                                                          child: Text(
                                                            'Speaclists',
                                                            style: TextStyle(
                                                              fontFamily:'Poppins',
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 18,
                                                              color: Color(0xFF000000),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0, 2, 0, 1),
                                                        child: Text(
                                                          'See all',
                                                          style: TextStyle(
                                                            fontFamily:'Poppins',
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 16,
                                                            color: Color(0xFF5E55EA),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
            
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 6.3, 14),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: Color(0xFFFFFFFF),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color(0x0F121212),
                                                        offset: Offset(0, 4),
                                                        blurRadius: 13,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Container(
                                                    padding: EdgeInsets.fromLTRB(11, 11, 20.8, 12),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(4),
                                                            ),
                                                            child:
                                                            Positioned(
                                                              left: -10,
                                                              top: -1,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                    fit: BoxFit.cover,
                                                                    image: NetworkImage(
                                                                      'assets/images/dr_2.png',
                                                                    ),
                                                                  ),
                                                                ),
                                                                child: Container(
                                                                  width: 91,
                                                                  height: 76,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            margin: EdgeInsets.fromLTRB(0, 3, 0, 2),
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Container(
                                                                        child:
                                                                        Text(
                                                                          'Dr. Goutham',
                                                                          style: TextStyle(
                                                                           fontFamily: 'Poppins',
                                                                            fontWeight: FontWeight.w500,
                                                                            fontSize: 16,
                                                                            color: Color(0xFF000000),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.fromLTRB(0, 2, 0, 1),
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              margin: EdgeInsets.fromLTRB(0, 3.5, 3, 3.5),
                                                                              child: SizedBox(
                                                                                width: 14,
                                                                                height: 14,
                                                                                // child: SvgPicture.network(
                                                                                //   'assets/vectors/star_16_x2.svg',
                                                                                // ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              '4.1',
                                                                              style: TextStyle(
                                                                               fontFamily: 'Poppins',
                                                                                fontWeight: FontWeight.w400,
                                                                                fontSize: 14,
                                                                                color: Color(0xFFB5B5B5),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                                                  child: Align(
                                                                    alignment: Alignment.topLeft,
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Container(
                                                                          margin: EdgeInsets.fromLTRB(0, 3.5, 3, 3.5),
                                                                          child: SizedBox(
                                                                            width: 14,
                                                                            height: 14,
                                                                            // child: SvgPicture.network(
                                                                            //   'assets/vectors/urology_2_x2.svg',
                                                                            // ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Pathalogy',
                                                                          style: TextStyle(
                                                                            fontFamily:'Poppins',
                                                                            fontWeight: FontWeight.w400,
                                                                            fontSize: 14,
                                                                            color: Color(0xFFC1C1C1),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment: Alignment.topLeft,
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.fromLTRB(0, 2, 9, 1),
                                                                        child: Container(
                                                                          decoration: BoxDecoration(
                                                                            image: DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: NetworkImage(
                                                                                'assets/images/httpslottiefiles_comanimationsuser_activity_online_status_notification_ping_fzihq_g_7_fso.gif',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          child: Container(
                                                                            width: 12,
                                                                            height: 12,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Online Consultancy Available',
                                                                        style: TextStyle(
                                                                          fontFamily:'Poppins',
                                                                          fontWeight: FontWeight.w400,
                                                                          fontSize: 10,
                                                                          color: Color(0xFF419400),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            margin: EdgeInsets.fromLTRB(0, 5, 0, 51),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.fromLTRB(0, 3.5, 3, 3.5),
                                                                  child: SizedBox(
                                                                    width: 14,
                                                                    height: 14,
                                                                    // child: SvgPicture.network(
                                                                    //   'assets/vectors/star_10_x2.svg',
                                                                    // ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '3.9',
                                                                  style: TextStyle(
                                                                    fontFamily:'Poppins',
                                                                    fontWeight: FontWeight.w400,
                                                                    fontSize: 14,
                                                                    color: Color(0xFFB5B5B5),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.fromLTRB(0, 0, 7.1, 218),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.fromLTRB(0, 0, 13.5, 0),
                                                                child: SizedBox(
                                                                  width: 253.5,
                                                                  child: Text(
                                                                    'Recent Doctor ‘s',
                                                                    style: TextStyle(
                                                                      fontFamily: 'Poppins',
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 18,
                                                                      color: Color(0xFF000000),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.fromLTRB(0, 2, 0, 1),
                                                                child: Text(
                                                                  'See all',
                                                                  style: TextStyle(
                                                                    fontFamily:'Poppins',
                                                                    fontWeight: FontWeight.w400,
                                                                    fontSize: 16,
                                                                    color: Color(0xFF5E55EA),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.fromLTRB(0, 0, 7.3, 41),
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                top: -18,
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(color: Color(0xFFE2E2E2)),
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    gradient: LinearGradient(
                                                                      begin: Alignment(-1, 0),
                                                                      end: Alignment(1, 0),
                                                                      colors: <Color>[Color(0x1AA7FDFF), Color(0x1AD1ADFF)],
                                                                      stops: <double>[0, 1],
                                                                    ),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Color(0x0F121212),
                                                                        offset: Offset(0, 4),
                                                                        blurRadius: 13,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: Container(
                                                                    width: 319,
                                                                    height: 78,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets.fromLTRB(20, 18, 20, 0),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 32),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child: Container(
                                                                              margin: EdgeInsets.fromLTRB(0, 0, 19.9, 0),
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Container(
                                                                                    margin: EdgeInsets.fromLTRB(19, 0, 18.4, 3),
                                                                                    child: Text(
                                                                                      'Get 10% Discount',
                                                                                      style: TextStyle(
                                                                                        fontFamily:'Poppins',
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontSize: 16,
                                                                                        color: Color(0xFF000000),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    'Get 10% Off on first 3 Appointments',
                                                                                    style: TextStyle(
                                                                                      fontFamily:'Poppins',
                                                                                      fontWeight: FontWeight.w400,
                                                                                      fontSize: 10,
                                                                                      color: Color(0xFFB5B5B5),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child: Container(
                                                                              margin: EdgeInsets.fromLTRB(0, 6, 0, 5),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFF5E55EA),
                                                                                  borderRadius: BorderRadius.circular(4),
                                                                                ),
                                                                                child: Container(
                                                                                  padding: EdgeInsets.fromLTRB(18.5, 8, 18.5, 8),
                                                                                  child:
                                                                                  Text(
                                                                                    'Book Now',
                                                                                    style: TextStyle(
                                                                                      fontFamily:'Poppins',
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontSize: 10,
                                                                                      color: Color(0xFFFFFFFF),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.fromLTRB(0, 0, 14, 0),
                                                                      child: SizedBox(
                                                                        width: 21,
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              margin: EdgeInsets.fromLTRB(0, 0, 9, 0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFF5E55EA),
                                                                                  borderRadius: BorderRadius.circular(3.5),
                                                                                ),
                                                                                child: Container(
                                                                                  width: 7,
                                                                                  height: 7,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFD5D5D5),
                                                                                  borderRadius: BorderRadius.circular(2.5),
                                                                                ),
                                                                                child: Container(
                                                                                  width: 5,
                                                                                  height: 5,
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
                                                            ],
                                                          ),
                                                        ),
                                          Text(
                                            '''India’s Best Doctor
                                            Consultancy app''',
                                          style: TextStyle(
                                          fontFamily:'Poppins',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 32,
                                            color: Color(0xFFDDDDDD),
                                          ),
                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
            
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
