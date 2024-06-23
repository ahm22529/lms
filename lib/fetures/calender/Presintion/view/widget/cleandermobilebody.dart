import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/calender/Presintion/manager/cubit/calender_cubit.dart';
import 'package:open/fetures/calender/data/model/calender_model/calender_model.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../Home/presention/view/widget/Appbar.dart';

class Bodycalender extends StatefulWidget {
  const Bodycalender({Key? key}) : super(key: key);

  @override
  State<Bodycalender> createState() => _BodycalenderState();
}

class _BodycalenderState extends State<Bodycalender> {
  late DateTime focusedDay;
  late DateTime selectedDay;
  ValueNotifier<DateTime> selectedDayNotifier = ValueNotifier<DateTime>(DateTime.now());
  List<Color> containerColors = [
    const Color(0xffD1FAE5),
    const Color(0xffFBCFE8).withOpacity(.6),
    const Color(0xffA5B4FC)
  ];
  int currentColorIndex = 0;

  @override
  void initState() {
    super.initState();
    focusedDay = DateTime.now();
    selectedDay = focusedDay;
    BlocProvider.of<CalenderCubit>(context).getevent("Calendar/GetAllCalendar");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: CustomApbar(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<CalenderCubit, CalenderState>(
              builder: (context, state) {
                if (state is Calendersucess) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TableCalendar(
                        eventLoader: (day) {
                          return _getEventsForDay(day, state.event);
                        },
                        calendarStyle: CalendarStyle(
                          selectedTextStyle: const TextStyle(color: Colors.black),
                          selectedDecoration: BoxDecoration(
                            color: selectedDay == focusedDay
                                ? const Color(0xff3D5CFF).withOpacity(.16)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        rowHeight: 100,
                        calendarFormat: CalendarFormat.week,
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: focusedDay,
                        selectedDayPredicate: (day) {
                          return isSameDay(selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            this.selectedDay = selectedDay;
                            this.focusedDay = selectedDay;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * .8,
                        child: ValueListenableBuilder<List<CalenderModel>>(
                          valueListenable: ValueNotifier<List<CalenderModel>>(
                            _getEventsForDay(selectedDay, state.event),
                          ),
                          builder: (context, events, _) {
                            return ListView.builder(
                              itemCount: events.length,
                              itemBuilder: (context, index) {
                                // Increment the currentColorIndex to change the color
                                currentColorIndex = (currentColorIndex + 1) % containerColors.length;
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12),
                                      color: containerColors[currentColorIndex], // Use the current color
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          events[index].body ?? 'No body text',
                                          style: AppStyles.styleMedium14(context).copyWith(color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.alarm_sharp),
                                            Text(
                                              events[index].startDate ?? 'No start date',
                                              style: AppStyles.styleMedium14(context).copyWith(color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Icon(Icons.delete),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  List<CalenderModel> _getEventsForDay(DateTime day, List<CalenderModel> allEvents) {
    List<CalenderModel> eventsForDay = [];
    DateFormat formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss");

    for (var event in allEvents) {
      if (event.startDate != null && event.endDate != null) {
        DateTime startDate = formatter.parse(event.startDate!);
        DateTime endDate = formatter.parse(event.endDate!);

        if (startDate.isBefore(day) && endDate.isAfter(day)) {
          eventsForDay.add(event);
        }
      }
    }
    return eventsForDay;
  }
}
