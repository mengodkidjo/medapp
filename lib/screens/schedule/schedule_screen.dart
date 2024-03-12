import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medapp/constants/constantes.dart';
import 'package:medapp/screens/schedule/widgets/event_widget.dart';
import 'package:medapp/styles/vertical_space.dart';
import 'package:medapp/utils/utils.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime _selectedDay = DateTime.now();

  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_rounded)),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded))
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(48),
                        bottomLeft: Radius.circular(48))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's",
                        style: GoogleFonts.montserrat(fontSize: 23),
                      ),
                      Text(
                        "Schedule",
                        style: GoogleFonts.montserrat(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ])),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TableCalendar(
                firstDay: DateTime.utc(2000, 01, 01),
                lastDay: DateTime.utc(2090, 3, 14),
                focusedDay: DateTime.now(),
                calendarFormat: CalendarFormat.week,
                headerStyle: HeaderStyle(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    formatButtonShowsNext: false,
                    leftChevronVisible: false,
                    headerMargin: const EdgeInsets.only(bottom: 16.0),
                    titleTextFormatter: (date, locale) {
                      return "${date.day} ${Utils.monthToStr(date.month)}";
                    },
                    titleTextStyle: GoogleFonts.montserrat(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                    rightChevronVisible: false,
                    formatButtonDecoration: const BoxDecoration(),
                    formatButtonTextStyle: GoogleFonts.montserrat(
                        color: Colors.grey, fontWeight: FontWeight.w500)),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                eventLoader: (day) {
                  return day == _selectedDay ? ["event1", "event2"] : [];
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay =
                        focusedDay; // update `_focusedDay` here as well
                  });
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: VerticalSpace.vSpace16,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return EventWidget(
                    index: index,
                    time: Constantes.times.elementAt(index),
                    status: Constantes.status.elementAt(index),
                    title: Constantes.schedules.elementAt(index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
