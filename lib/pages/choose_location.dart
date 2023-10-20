import 'package:flutter/material.dart';
import 'package:iyax_weather_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Lagos', flag: 'nigeria.jpg', url: 'Africa/Lagos'),
    WorldTime(location: 'Chicago', flag: 'usa.png', url: 'America/Chicago'),
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Qatar', flag: 'qatar.png', url: 'Asia/Qatar'),
    WorldTime(location: 'NewYork', flag: 'newyork.png', url: 'America/New_York'),
    WorldTime(location:  'Germany', flag: 'germany.png', url:'Europe/Berlin'),
    WorldTime(location: 'Egypt', flag:'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'South Korea', flag: 'south_korea.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Australia', flag: 'australia.jpg', url: 'Australia/Melbourne'),
    WorldTime(location: 'Dubai', flag: 'dubai.jpg', url: 'Asia/Dubai'),
  ];

    void UpdateWorldTime(index) async{
        WorldTime updating = locations[index];
        await updating.getTime();
        Navigator.pop(context, {
          'location': updating.location,
          'flag': updating.flag,
          'time': updating.time,
          'isDayTime': updating.isDayTime,
          'weekday': updating.weekday,
        });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[500],
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        centerTitle: true,
        title: Text('Choose Location'),
        
      ),
    body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            margin: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
            child: ListTile(
              onTap: (){
                UpdateWorldTime(index);
              },
              leading: CircleAvatar(backgroundImage: AssetImage('assets/${locations[index].flag}'),),
              title: Text('${locations[index].location}', style: TextStyle(fontFamily: 'Tektur', fontSize: 16),),

            ),
          );
        }),
    );
  }
}
