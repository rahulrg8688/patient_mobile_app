import 'package:flutter/cupertino.dart';

class Notificationmodel extends StatelessWidget {
  final String title;
  final String body;

  const Notificationmodel({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
     return Container(
      // Your model design here
      child: Column(
        children: [
          Text(title),
          Text(body),
        ],
      ),
    );;
  }
}
