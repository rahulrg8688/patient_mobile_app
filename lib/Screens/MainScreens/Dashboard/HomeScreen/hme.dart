import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

class Speciality {
  List specialities = ["Neuro", "Cardio", "Ortho", "Urology", "Gastro"];

  List doctors = [
    {"name": "ramakanth", "Speciality": "Neuro"},
    {"name": "rajesh", "Speciality": "Cardio"},
    {"name": "srikanth", "Speciality": "Ortho"},
    {"name": "ramu", "Speciality": "Neuro"},
    {"name": "vijay", "Speciality": "Cardio"},
    {"name": "vishal", "Speciality": "Neuro"},
    {"name": "kohli", "Speciality": "Gastro"},
    {"name": "rohit", "Speciality": "Urology"},
    {"name": "Eshwar", "Speciality": "Ortho"},
    {"name": "vignesh", "Speciality": "Gastro"},
  ];
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String specialitySelected = '';
  Speciality speciality = Speciality();

  @override
  void initState() {
    super.initState();
    specialitySelected = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 120,
                width: double.infinity,
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.purple.shade300,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    setState(() {});
                  },
                )),
            Container(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: speciality.specialities.length,
                  itemBuilder: (context, position) {
                    return GestureDetector(
                      onTap: () {
                        specialitySelected = (speciality.specialities[position]);
                        setState(() {});
                      },
                      child: Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            speciality.specialities[position],
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: speciality.doctors.length,
                itemBuilder: (context, position) {
                  if (specialitySelected.isEmpty || speciality.doctors[position]['Speciality'] == specialitySelected) {
                    return Card(
                      elevation: 10,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              speciality.doctors[position]['name'],
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(speciality.doctors[position]['Speciality']),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink(); // Skip rendering if not selected speciality
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
