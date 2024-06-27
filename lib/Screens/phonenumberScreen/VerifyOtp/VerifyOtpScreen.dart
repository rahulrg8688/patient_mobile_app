import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_application/Screens/phonenumberScreen/OtpController.dart';
import 'package:patient_application/Screens/phonenumberScreen/VerifyOtp/VerifyOtpController.dart';

class Verifyotpscreen extends StatefulWidget {

  const Verifyotpscreen({super.key});

  @override
  State<Verifyotpscreen> createState() => _VerifyotpscreenState();
}

class _VerifyotpscreenState extends State<Verifyotpscreen> {
  bool Move1Next=false;
  bool IsTapped=false;

  Verifyotpcontroller Otpcontroller=Get.put(Verifyotpcontroller());
  @override
  void initState() {
    Move1Next=false;
    IsTapped=false;
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      appBar: AppBar(

      ),
      body: GetBuilder<Verifyotpcontroller>(
        builder: (Otpcontroller) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                margin: EdgeInsets.only(bottom: isKeyboardVisible ? 20 : 345),
                      //margin: EdgeInsets.fromLTRB(0, 0, 0, 303),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                         // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 13.5, 34),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
                                    child: Text(
                                      'Verfication',
                                      style: TextStyle(
                                        fontFamily: 'Playfair Display',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:300,
                                    child: Center(
                                      child: Text(
                                        'Enter the code we just sent you to you’r registered mobile number',
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
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:EdgeInsets.only(bottom:30),
                              //margin:EdgeInsets.only(bottom: isKeyboardVisible?20:100),
                              // margin: EdgeInsets.only(bottom: isKeyboardVisible ? 20 : 345),
                              child: Column(

                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: SizedBox(

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 53,
                                            height: 53,

                                            margin: EdgeInsets.fromLTRB(0, 0, 22, 0),

                                            child: TextFormField(
                                              controller:Otpcontroller.Otp1,
                                              keyboardType: TextInputType.phone,
                                              onTap: (){

                                                setState(() {
                                                  IsTapped=true;
                                                });
                                              },
                                              onChanged: (val){
                                                if(val.length==1){
                                                  FocusScope.of(context).nextFocus();
                                                }
                                                },
                                              decoration: InputDecoration(

                                                border: OutlineInputBorder(

                                                  borderRadius: BorderRadius.all(Radius.circular(8.0),
                                                  ),


                                                ),

                                              ),
                                              textInputAction:Move1Next?TextInputAction.next:TextInputAction.none,
                                            ),
                                          ),
                                          Container(
                                            width: 53,
                                            height: 53,

                                            margin: EdgeInsets.fromLTRB(0, 0, 22, 0),

                                            child: TextFormField(
                                              keyboardType: TextInputType.phone,
                                              controller:Otpcontroller.Otp2,
                                              onChanged: (val){
                                                if(val.length==1){
                                                  FocusScope.of(context).nextFocus();
                                                }
                                              },
                                              decoration: InputDecoration(

                                                border: OutlineInputBorder(

                                                  borderRadius: BorderRadius.all(Radius.circular(8.0),
                                                  ),


                                                ),

                                              ),
                                              textInputAction:Move1Next?TextInputAction.next:TextInputAction.none,

                                            ),
                                          ),
                                          Container(
                                            width: 53,
                                            height: 53,

                                            margin: EdgeInsets.fromLTRB(0, 0, 22, 0),

                                            child: TextFormField(
                                              controller:Otpcontroller.Otp3,
                                              keyboardType: TextInputType.phone,
                                              onChanged: (val){
                                                if(val.length==1){
                                                  FocusScope.of(context).nextFocus();
                                                }
                                              },

                                              decoration: InputDecoration(

                                                border: OutlineInputBorder(

                                                  borderRadius: BorderRadius.all(Radius.circular(8.0),
                                                  ),


                                                ),

                                              ),
                                              textInputAction:Move1Next?TextInputAction.next:TextInputAction.none,

                                            ),
                                          ),
                                          Container(
                                            width: 53,
                                            height: 53,
                                            child: TextFormField(
                                              controller:Otpcontroller.Otp4,
                                              keyboardType: TextInputType.phone,
                                              onChanged: (val){
                                                if(val.length==1){
                                                  FocusScope.of(context).unfocus();
                                                }
                                              },
                                              decoration: InputDecoration(

                                                  border: OutlineInputBorder(

                                                    borderRadius: BorderRadius.all(Radius.circular(8.0),
                                                    ),


                                                  ),
                                              ),
                                              textInputAction: TextInputAction.done,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Otpcontroller.OtpErr.value!=''?Text("${Otpcontroller.OtpErr.value}",
                                  style: TextStyle(

                                    color:Colors.red,
                                  )
                                  ):SizedBox(),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0.7, 0, 0.7, 0),
                                    child: TextButton(
                                      onPressed: (){
                                          Otpcontroller.SendOtp();
                                      },
                                      child:
                                      Text(
                                      'Resend Code',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xFF1B4DFF),
                                      ),
                                    ),
                                  ),
                                  ),
                                  Text(Otpcontroller.timerText),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFC1C1C1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                         // padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                          child:
                          SizedBox(
                            width:double.infinity,
                            child: ElevatedButton(
                              onPressed: (){
                                Otpcontroller.CompareOtp();
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor:IsTapped?Color(0xFF5E55EA):Color(0xFFC1C1C1)
                              ),
                              child:Otpcontroller.isLoading?CircularProgressIndicator(): Text(
                                'Verify',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color:IsTapped?Colors.white:Colors.black ,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
