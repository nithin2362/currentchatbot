import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';



class TimeInHourAndMinute extends StatefulWidget {
  @override
  _TimeInHourAndMinuteState createState() => _TimeInHourAndMinuteState();
}

class _TimeInHourAndMinuteState extends State<TimeInHourAndMinute> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  @override
  
  
  
  
  
  
  String gettime(var period)
  {
    String time = '';
    var hour = _timeOfDay.hourOfPeriod;
    var minute = _timeOfDay.minute;
    
    if(period == 'PM')
    {
      if(hour == 0)
        hour = 12;
      else if(hour > 12)
        hour -= 12;
    }
    else if(period == 'AM')
    {
      if(hour == 0)
        hour = 12;
    }
  
  if(hour < 10)
      time += '0' + hour.toString();
  else
    time += hour.toString();
    
    time += ':';
    if(minute < 10)
      time += '0' + minute.toString();
    else
      time += minute.toString();
    print(time + ' ' + period);
    return time;
    
  }
  
  
  void initState() {
    super.initState();
     Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    
    
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          
          gettime(_period) + ' ' + _period,
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            
            fontFamily: 'Noticia',
          ),
        ),
        // SizedBox(width: 5),
        // RotatedBox(
        //   quarterTurns: 3,
        //   child: Text(
        //     _period,
        //     style: TextStyle(fontSize: 20,
        //     color: Colors.white,
        //     fontFamily: 'Noticia'),
        //   ),
        // ),
      ],
    );
  }
}