import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/android_params.dart';
import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/entities/ios_params.dart';
import 'package:flutter_callkit_incoming/entities/notification_params.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:patient_application/GetStorage/HiveBox.dart';
import 'package:patient_application/GetStorage/StorageService.dart';
import 'package:patient_application/Jitse/call_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AuthenticateLogin/Authenticate.dart';
import '../Screens/MainScreens/JitseScreen/call_state.dart';

import 'NotificationModel.dart';
import 'navigation_service.dart';

class CallService{
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final callState=CallState.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  Map<String,dynamic> messagingData={};
  CallController controller=Get.put(CallController());

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    print("Token from call service is :: ${token}");
    return token!;
  }
  void isRefreshToken() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      print("Token refrshed");
    });
  }
  Future<void> requestNotificationPermissions() async {
    print(" i am request permissions");
    if (Platform.isIOS) {
      await messaging.requestPermission(
          alert: true,
          announcement: true,
          badge: true,
          carPlay: true,
          criticalAlert: true,
          provisional: true,
          sound: true
      );
    }
    NotificationSettings notificationSettings = await messaging
        .requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true
    );
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      print("user has granted permission");
    }
    else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("user has already granted provisional permisso");
    }
    else {
      print("user has denied pemission");
    }
  }
  Future foregroundMessage() async {
    print("fore ground");
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true
    );
  }
  void firebaseInit(BuildContext context) {
    print("initializing the firebase");
    FirebaseMessaging.onMessage.listen((message) {
      print("Message data is ${jsonEncode(message.data)}");
      //RemoteNotification? notification = message.data;
      //AndroidNotification? android = message.notification!.android;
      print("Notification is :: ${message.data['message']}");
      // print("notification title is :: ${notification!.title}");
      // print("notificaton body is :: ${notification.body}");
      print("notification data is :: ${message.data.toString()}");
      print("Each not data is ::: ${message.data['domain']}");
      //handleIncomingCall(message.data);
      // messagedata = message;
      //print("message data is :: ${messagedata.data.toString()}");
      if (Platform.isIOS) {
        foregroundMessage();
      }
      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotifications(message);
      }
    });
  }
  void initLocalNotifications(BuildContext context,
      RemoteMessage message) async {

    var androidInitSettings = const AndroidInitializationSettings(
        '@mipmap/ic_launcher');
    var IosInitSettings = const DarwinInitializationSettings();
    var InitSettings = InitializationSettings(
        android: androidInitSettings,
        iOS: IosInitSettings
    );
    await _flutterLocalNotificationsPlugin.initialize(InitSettings,
        onDidReceiveNotificationResponse: (payload) {
          handleMessage(context, message);
        }
    );
  }
  handleMessage(BuildContext context, RemoteMessage message) {
    print("handle message functon");
    if (message.data['type'] == 'text') {
      //redirect to one screen
      print("Handling of message routing");
      Navigator.pushNamed(context, '/jitse');
    }
    if (message.data['type'] == 'call') {
      print("i am at call");
      NavigationService.instance.pushNamedIfNotCurrent('/jitse',arguments: message);
    }
  }
  Future<void> showNotifications(RemoteMessage message) async {
    
    // var textFile =  File("D:\\RahulSoftwares\\AndroidAppPractice\\patient_application\\lib\\Jitse\\temp.txt");
    // textFile.writeAsString("This is temp text file ",mode:FileMode.writeOnly);


    Fluttertoast.showToast(
        msg: "This is app terminated Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    print("showing notifications");
    print("Show messages :: ${message.data}");

    controller.UpdateValue(message.data['type']);
    // Get.dialog(Notificationmodel(
    //   title: message.data['message'],
    //   body: message.data['roomName'],
    //
    // ));
    print("message controller type is :: ${controller.TypeTelemedicine}");
    if (message.data['type'] == "Telemedicine") {
      handleIncomingCall(message.data);
    }

    // else {
      AndroidNotificationChannel androidNotificationChannel = AndroidNotificationChannel(
        // message.notification!.android!.channelId.toString(),
        // message.notification!.android!.channelId.toString(),
          message.data['message'].toString(),
          message.data['roomName'].toString(),

          importance: Importance.max,
          showBadge: true,
          playSound: true

      );
      AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
          androidNotificationChannel.id,
          androidNotificationChannel.name,
          channelDescription: 'FLutter Notification',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          ticker: 'ticker',
          sound: androidNotificationChannel.sound

      );
      const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,

      );
      NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails,
          iOS: darwinNotificationDetails
      );
      Future.delayed(Duration.zero, () {
        _flutterLocalNotificationsPlugin.show(
            0,
            message.data['message'],
            message.data['roomNo'],
            notificationDetails);
      });
    }
  // }
  void handleIncomingCall(Map<String, dynamic> data) async{
    //print("Call handling incoming is :: ${callState.isInCall}");
    // print("Controller Isvideo caller ${controller.IsJoined}");
    // if(controller.IsVideoJoined()){
    if(true){
      print("Call handling incoming is :: ${callState.isInCall}");
      await showCallkitIncoming(data);
    }
    else{
     print("All ready in call");
      // CallScreen().handleCallEvents();
    }


  }
  Future<void> showCallkitIncoming(Map<String,dynamic> message) async {
    //print("showing call kit $uuid");
    print("Showing kit data is :: ${message}");
    controller.setMessageDataValue(message);
    print("controller data is :: ${controller.MessageData}");
    //SharedPreferences prefs=await SharedPreferences.getInstance();

    messagingData=message;
    bool isloggedIn=Authenticate().isLoggedIn();
    if(isloggedIn) {
      final params = CallKitParams(
        id: message['telemedicineId'],
        nameCaller: message['message'],
        appName: message['message'],
        avatar: '',
        handle: '0123456789',
        type: 0,
        duration: 30000,
        textAccept: 'Accept',
        textDecline: 'Decline',
        missedCallNotification: const NotificationParams(
          showNotification: true,
          isShowCallback: true,
          subtitle: 'Missed call',
          callbackText: 'Call back',
        ),
        extra: <String, dynamic>{'userId': message['originalRoomName'],'type':message['type']},
        headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
        android: const AndroidParams(
          isCustomNotification: true,
          isShowLogo: false,
          ringtonePath: 'system_ringtone_default',
          backgroundColor: '#0955fa',
          backgroundUrl: 'assets/test.png',
          actionColor: '#4CAF50',
          textColor: '#ffffff',
        ),
        ios: const IOSParams(
          iconName: 'CallKitLogo',
          handleType: '',
          supportsVideo: true,
          maximumCallGroups: 2,
          maximumCallsPerCallGroup: 1,
          audioSessionMode: 'default',
          audioSessionActive: true,
          audioSessionPreferredSampleRate: 44100.0,
          audioSessionPreferredIOBufferDuration: 0.005,
          supportsDTMF: true,
          supportsHolding: true,
          supportsGrouping: false,
          supportsUngrouping: false,
          ringtonePath: 'system_ringtone_default',
        ),
      );

      await FlutterCallkitIncoming.showCallkitIncoming(params);
    }
    else{
      print("user not logged in call ignored");
    }
  }


  void checkAndNavigationCallingPage() async {
    // print("i am at check and nav");
    //
    // print("Data from users is :: ${data}");
    // Map<String, dynamic> messagedata = {};
    // print("checking czall and navigate funcn");
    // print("Messga e data is ::::>> ${messagingData ?? "empty"}");
    // if (messagingData.isEmpty) {
    //   // await GetMessageData().then((value){
    //   //   print("value from bg is :: $value");
    //   //   messagingData=value;
    //   messagingData = jsonDecode(
    //       SharedPrefsService().prefs.getString('messageNotification') ?? '');
    //
    //   print("Messaging again data is :: ${messagingData}");
      print("Current Navigator State: ${NavigationService.instance.navigationKey
          .currentState}");

      // NavigationService.instance.pushNamedIfNotCurrent(
      //     '/jitse');
    }


    //


    Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
      print("state of the application is :: $state");
      if (state == AppLifecycleState.resumed) {
        //Check call when open app from background
        //checkAndNavigationCallingPage();
      }
    }
    void handleCallEvents() {
      print("handling events at "
      );
      FlutterCallkitIncoming.onEvent.listen((event) {
        print("event is :: $event");

        if (event!.event == Event.actionCallAccept) {
          HiveBox().StoreCallData(event.body);
          if (Authenticate().isLoggedIn()) {
            print("Call is accepted");
            print("${event.body}");
            print("Json encode is ${jsonEncode(event.body)}");
            print(event.body['id']);
            // print("Json Decode is ${jsonDecode(event.body)}");
            NavigationService.instance.pushNamedIfNotCurrent(
                '/jitse', arguments: jsonEncode(event.body));
            //checkAndNavigationCallingPage();
          }
        }
        if (event.event == Event.actionCallDecline) {
          print("call is declined");
        }
        //  switch (event!.event) {
        //     case Event.ACTION_CALL_INCOMING:
        //     // Handle incoming call
        //       break;
        //     case Event.ACTION_CALL_ACCEPT:
        //     // Handle call accepted
        //       print('Call accepted');
        //       // Navigate to the call screen or perform any other action
        //       NavigationService.instance.pushNamed('/jitse', arguments: event.body);
        //       break;
        //     case Event.ACTION_CALL_DECLINE:
        //     // Handle call declined
        //       print('Call declined');
        //       break;
        //     case Event.ACTION_CALL_ENDED:
        //     // Handle call ended
        //       print('Call ended');
        //       break;
        //     case Event.ACTION_CALL_TIMEOUT:
        //     // Handle call timeout
        //       print('Call timed out');
        //       break;
        //     case Event.ACTION_CALL_CALLBACK:
        //     // Handle call callback
        //       print('Call callback');
        //       break;
        //     default:
        //       print('Unhandled event: ${event.event}');
        //       break;
        //   }
      });
    }
  }
