import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_application/Screens/MainScreens/AboutDoctorScreen/AboutDoctorController.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  CustomDatePicker({
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
  });

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final Aboutdoctorcontroller doctorController = Get.find();
  DateTime _selectedDate = DateTime.now();
  List<DateTime> date = [];
  DateTime _currentMonth = DateTime.now();

  @override
  void initState() {
    super.initState();
    _updateHighlightedDates();
  }

  void _updateHighlightedDates() {
    List<Map<String, dynamic>> highlightedDates = doctorController.AvailableDatesOnly.value;
    List<DateTime> newDates = [];

    for (var dateData in highlightedDates) {
      DateTime? date = dateData['Date'];
      if (date != null) {
        newDates.add(DateTime(date.year, date.month, date.day));
      }
    }

    setState(() {
      date = newDates;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (doctorController.CalenderLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      return Material(
        child: Container(
          height: 400,
          child: Column(
            children: [
              TableCalendar(
                firstDay: widget.firstDate,
                lastDay: widget.lastDate,
                focusedDay: _currentMonth,
                selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDate = selectedDay;
                  });
                },
                onPageChanged: (focusedDay) async {
                  if (focusedDay.month != _currentMonth.month) {
                    setState(() {
                      _currentMonth = focusedDay;
                    });

                    DateTime startDate = DateTime(focusedDay.year, focusedDay.month, 1);
                    DateTime endDate = DateTime(focusedDay.year, focusedDay.month + 1, 0);
                    String startDateString = "${startDate.year}-${startDate.month}-${startDate.day}";
                    String endDateString = "${endDate.year}-${endDate.month}-${endDate.day}";

                    await doctorController.DoctorAvailableDates(
                      StartDate: startDateString,
                      EndDate: endDateString,
                    );
                  }
                },
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    bool isHighlighted = date.any((d) =>
                    d.year == day.year &&
                        d.month == day.month &&
                        d.day == day.day);

                    return Container(
                      margin: const EdgeInsets.all(6.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isHighlighted ? Colors.transparent : Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        '${day.day}',
                        style: TextStyle(
                          color: isHighlighted ? Colors.black : Color(0xFFC1C1C1),
                          decoration: isHighlighted ? TextDecoration.none : TextDecoration.lineThrough,
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, _selectedDate);
                },
                child: Text('Select'),
              ),
            ],
          ),
        ),
      );
    });
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:patient_application/ModelClass/AvailableDatesForDoctorModel.dart';
// import 'package:patient_application/Screens/MainScreens/AboutDoctorScreen/AboutDoctorController.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// class CustomDatePicker extends StatefulWidget {
//
//   final DateTime initialDate;
//   final DateTime firstDate;
//   final DateTime lastDate;
//
//
//
//   CustomDatePicker({
//
//     required this.initialDate,
//     required this.firstDate,
//     required this.lastDate,
//
//   });
//
//   @override
//   _CustomDatePickerState createState() => _CustomDatePickerState();
// }
//
// class _CustomDatePickerState extends State<CustomDatePicker> {
//   Aboutdoctorcontroller doctorController=Get.put(Aboutdoctorcontroller());
//   DateTime _selectedDate = DateTime.now();
//   List<DateTime> date=[];
//   DateTime? DateData;
//   DateTime _focusedDate=DateTime.now();
//   DateTime _currentMonth = DateTime.now();
//   bool isLoading=false;
//   void _updateDateList() {
//
//
//     print("Dates in highlighted are :: ${date}");
//     print("Length of highlighted is :: ${date.length}");
//     setState(() {}); // Call setState to update the UI
//   }
//   @override
//   void initState() {
//
//     print("Dates in highlighted rae init :: $date");
//     print("Length of highlighted is :: ${date.length}");
//
//
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   void didUpdateWidget(CustomDatePicker oldWidget) {
// print("Did update widget");
//     super.didUpdateWidget(oldWidget);
//     List<Map<String,dynamic>> highlightedDates=doctorController.AvailableDatesOnly;
//     print("Highlighted data is ${highlightedDates}");
//     for(int i=0;i<highlightedDates.length;i++) {
//       DateTime? DateData = highlightedDates[i]['Date'];
//       if (DateData != null) {
//         date.add(DateTime(DateData.year, DateData.month, DateData.day));
//       }
//     }
//
//
//   }
//   Future<void> _fetchDatesForMonth(DateTime month) async {
//     // Extract year and month from the DateTime object
//     int year = month.year;
//     int monthNumber = month.month;
//
//     // Example API call simulation
//     await Future.delayed(Duration(seconds: 1)); // Simulate network delay
//     List<DateTime> newDates = [
//       DateTime(year, monthNumber, 10),
//       DateTime(year, monthNumber, 20),
//     ];
//     setState(() {
//    date = newDates;
//     });
//     print("Fetched dates for month: ${month.toLocal()}");
//   }
//
//   @override
//   Widget build(BuildContext context) {
// return Obx(() {
//   print("Calender loading ${Aboutdoctorcontroller().CalenderLoading.value}");
// setState(() {
//   doctorController.CalenderLoading.value=true;
// });
//   List<Map<String,dynamic>> highlightedDates=doctorController.AvailableDatesOnly.value;
//   for (int i = 0; i < highlightedDates.length; i++) {
//     DateTime? DateData = highlightedDates[i]['Date'];
//     if (DateData!= null) {
//       date.add(DateTime(DateData.year, DateData.month, DateData.day));
//     }
//   }
//   return  Material(
//     child: Container(
//       height: 400,
//       child: Column(
//         children: [
//           TableCalendar(
//             firstDay: widget.firstDate,
//             lastDay: widget.lastDate,
//             focusedDay: _currentMonth,
//             selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
//             onDaySelected: (selectedDay, focusedDay) {
//               setState(() {
//                 _selectedDate = selectedDay;
//
//               });
//               String Date="${selectedDay.year}-${selectedDay.month}-${selectedDay.day}";
//               //doctorController.DoctorAvialableTimes(Date: Date);
//             },
//             onPageChanged: (focusedDay) async{
//               if (focusedDay.month != _selectedDate.month) {
//                 setState(() {
//                   _currentMonth=focusedDay;
//                 });
//                 print("Focused day year ${focusedDay.year}");
//                 print("FOcused day month ${focusedDay.month}");
//                 print("FOcused day is ${focusedDay.day}");
//                 DateTime startDate = DateTime(
//                     focusedDay.year, focusedDay.month, 1);
//                 DateTime endDate = DateTime(
//                     focusedDay.year, focusedDay.month + 1, 0);
//                 String StartDateString = "${startDate.year}-${startDate
//                     .month}-${startDate.day}";
//                 String EndDateString = "${endDate.year}-${endDate
//                     .month}-${endDate.day}";
//                 await doctorController.DoctorAvailableDates(
//                     StartDate: StartDateString, EndDate: EndDateString);
//                 print("Widget detraisl :: }");
//
//               }
//
//             },
//             calendarBuilders: CalendarBuilders(
//
//               defaultBuilder: (context, day, focusedDay) {
//
//
//                 bool isHighlighted = date.any((dates) =>
//                 dates.year == day.year &&
//                     dates.month == day.month &&
//                     dates.day == day.day);
// doctorController.CalenderLoading.value?CircularProgressIndicator():
//                    Container(
//                     margin: const EdgeInsets.all(6.0),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       color:isHighlighted? Colors.transparent:Colors.transparent,
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: Text(
//                       '${day.day}',
//                       style: TextStyle(
//                           color:isHighlighted? Colors.black:Color(0xFFC1C1C1),
//                       decoration: isHighlighted?TextDecoration.none:TextDecoration.lineThrough
//                       ),
//                     ),
//                   );
//
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context, _selectedDate);
//             },
//             child: Text('Select'),
//           ),
//           if(Aboutdoctorcontroller().CalenderLoading.value)
//
//             Center(
//               child: CircularProgressIndicator(),
//             )
//         ],
//       ),
//     ),
//
//   );
//
// });
//
//
//   }
// }
