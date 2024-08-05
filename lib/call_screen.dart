import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  final data;
  final pressed;
  const CallScreen({super.key,required this.data,required this.pressed});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Widget data is :: ${widget.data}");
    print("Widget pressed is :: ${widget.pressed}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call Screen"),
      ),
body:Column(
  children: [
    Text(widget.data['roomName']),
    Text(widget.data['doctorName'])
  ],
)


    );
  }
}
