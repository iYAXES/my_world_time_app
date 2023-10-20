import 'package:flutter/material.dart';

class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {
     data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
     String bgImage = data['isDayTime'] ? 'day2.jpg' : 'night2.jpg';

    return Scaffold(
      backgroundColor: Colors.purple[600],
      body: Container(
        decoration: BoxDecoration(image:
        DecorationImage(image: AssetImage('assets/$bgImage'),fit: BoxFit.cover)),
        child: SafeArea(child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 160, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed: () async{
                dynamic result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'location': result['location'],
                    'time': result['time'],
                    'flag': result['flag'],
                    'isDayTime': result['isDayTime'],
                    'weekday': result['weekday']
                  };
                });
              },
                  icon: Icon(Icons.edit_location, size: 25,),
                  style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: Colors.transparent),
                  label: Text('Edit Location', style: TextStyle(fontSize: 18),)),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 CircleAvatar(backgroundImage: AssetImage('assets/${data['flag']}'),radius: 22,),
                  SizedBox(width: 10,),
                  Text(data['location'],style: TextStyle(fontSize: 40, fontFamily: 'Tektur', color: Colors.white),),

              ],),
              SizedBox(height: 20,),
              Text(data['weekday'], style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),),
              Text(data['time'], style: TextStyle(fontSize: 70, fontFamily: 'Moonrock', color: Colors.white),),
            ],
          ),
        )),
      ),
    );
  }
}
