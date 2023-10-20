import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{
  
  String? location;
  String? time;
  String? flag;
  String? url;
  String? weekday;
  bool? isDayTime;
  
     WorldTime({required this.location, required this.flag, required this.url});
     
      Future <void> getTime() async{
        try{
          Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
          Map data = jsonDecode(response.body);

          String datetime = data['datetime'];
          String offset = data['utc_offset'].substring(1,3);
          int today = data['day_of_week'];




          DateTime now = DateTime.parse(datetime);
          now = now.add(Duration(hours: int.parse(offset)));

          DateTime weekly = DateTime(today);
          weekly = weekly.subtract(new Duration(days:1));

          weekday = DateFormat('EEEE').format(weekly);

          isDayTime = now.hour >6 && now.hour <20 ? true : false;
          time = DateFormat.jm().format(now);

        }catch(e){
          print('caught the error: $e');
        }

      }
  
}