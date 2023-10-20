import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iyax_weather_app/services/world_time.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void SetUpWorldTime() async{
    WorldTime newtime = WorldTime(location: 'Lagos', flag: 'nigeria.jpg', url:'Africa/Lagos');
    await newtime.getTime();
    print(newtime.weekday);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': newtime.location,
      'flag': newtime.flag,
      'time': newtime.time,
      'isDayTime': newtime.isDayTime,
      'weekday': newtime.weekday,

    });


  }

  @override
  void initState() {
    SetUpWorldTime();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Center(child: SpinKitFadingCube(
        color: Colors.white, size: 70,
      ),),
    );
  }
}
