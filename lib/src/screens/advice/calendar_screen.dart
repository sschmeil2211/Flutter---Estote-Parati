// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:estote_parati/src/widgets/widgets.dart';
import 'package:estote_parati/src/utils/utils.dart';
import 'package:estote_parati/src/models/event_model.dart';
import 'package:estote_parati/src/models/models.dart';
import 'package:estote_parati/src/providers/providers.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: scoutColor,
      appBar: CustomizedAppBar(context: context, title: 'CALENDARIO'),
      body: BodyWithList(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 150),
            height: MediaQuery.of(context).size.height,
            child: Consumer<EventProvider>(
              builder: (context, eventProvider, child){
                return SfCalendar(
                  dataSource: MeetingDataSource(eventProvider.events),
                  view: CalendarView.schedule,
                  scheduleViewSettings: const ScheduleViewSettings(
                    monthHeaderSettings: MonthHeaderSettings(backgroundColor: scoutColor),
                    appointmentItemHeight: 100,
                    hideEmptyScheduleWeek: true,
                    appointmentTextStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Event> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) => appointments?[index].from.toDate();

  @override
  DateTime getEndTime(int index) => appointments?[index].to.toDate();

  @override
  String getSubject(int index) => appointments?[index].name;

  @override
  Color getColor(int index) => getBranchColor(appointments?[index].branch);

  @override
  bool isAllDay(int index) => appointments?[index].isAllDay;
}