import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:telemedicine_app/controller/product_loaded_controller.dart';
import 'package:telemedicine_app/models/booking_model.dart';
import 'package:telemedicine_app/utils/app_color.dart';
import 'package:telemedicine_app/utils/app_string.dart';
import 'package:telemedicine_app/utils/app_style.dart';
import 'package:telemedicine_app/widgets/custom_titleText_layout.dart';
import 'package:telemedicine_app/widgets/home_view_widgets.dart';

import '../utils/utils.dart';
class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {

  final CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2023, 1, 1),
          lastDay: DateTime.utc(2023, 12, 31),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;

              // print("Selected Day: $outputDateString");
            });
          },
        ),
       tileTextLayout(text: AppString.text_morning,context: context,isHideText: true),
        FutureBuilder(
          future: ProductLoaded().loadAppointment(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Snapshot:: ${snapshot.data}"),
              );

            } else if (snapshot.hasData) {
              Appointment items = snapshot.data as Appointment;
              return items.schedule!.morning!.isNotEmpty?
                GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / .6,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2),
                itemCount: items.schedule?.morning?.length,
                padding: const EdgeInsets.all(0),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 0,
                    shape: roundedRectangleBorder.copyWith(
                        borderRadius: BorderRadius.circular(6),
                        side: BorderSide(color: AppColor.primaryColor)),
                    color: items.date.toString()==_selectedDay.toString() && items.schedule!.morning![index].isSecreted==true
                        ? AppColor.primaryColor
                        : Theme.of(context).cardColor,
                    child: Center(
                        child: Text(
                            items.schedule!.morning![index].time.toString(),
                          style: AppStyle.normal_text_black.copyWith(
                            color:items.date.toString()==_selectedDay.toString() && items.schedule!.morning![index].isSecreted==true
                                ? Theme.of(context).cardColor
                                : AppColor.primaryColor,
                          ),
                        )),
                  );
                },
              ):Container();


            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),

        tileTextLayout(text: AppString.text_eveing,context: context,isHideText: true),
        FutureBuilder(
          future: ProductLoaded().loadAppointment(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Snapshot:: ${snapshot.data}"),
              );

            } else if (snapshot.hasData) {
              Appointment items = snapshot.data as Appointment;
              return items.schedule!.morning!.isNotEmpty?
              GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / .6,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2),
                itemCount: items.schedule?.evening?.length,
                padding: const EdgeInsets.all(0),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 0,
                    shape: roundedRectangleBorder.copyWith(
                        borderRadius: BorderRadius.circular(6),
                        side: BorderSide(color: AppColor.primaryColor)),
                    color: items.date.toString()==_selectedDay.toString() && items.schedule!.evening![index].isSecreted==true
                        ? AppColor.primaryColor
                        : Theme.of(context).cardColor,
                    child: Center(
                        child: Text(
                          items.schedule!.evening![index].time.toString(),
                          style: AppStyle.normal_text_black.copyWith(
                            color:items.date.toString()==_selectedDay.toString() && items.schedule!.evening![index].isSecreted==true
                                ? Theme.of(context).cardColor
                                : AppColor.primaryColor,
                          ),
                        )),
                  );
                },
              ):Container();


            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),



      ],
    );
  }
}




