import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}


class _ChooseLocationState extends State<ChooseLocation> {
  List <WorldTime> locations = [

  WorldTime(location: 'Abidjan',flag: 'Abidjan.png',url: 'Africa/Abidjan'),
  WorldTime(location: 'Accra',flag: 'Accra.png',url: 'Africa/Accra'),
  WorldTime(location: 'Algiers',flag: 'Algiers.png',url: 'Africa/Algiers'),
  WorldTime(location: 'Adak',flag: 'Adak.png',url: 'America/Adak'),
  WorldTime(location: 'Salta',flag: 'Salta.png',url: 'America/Argentina/Salta'),
  WorldTime(location: 'Denver',flag: 'Denver.png',url: 'America/Denver'),
  WorldTime(location: 'Los_Angeles',flag: 'Los_Angeles.png',url: 'America/Los_Angeles'),
  WorldTime(location: 'Dubai',flag: 'Dubai.png',url: 'Asia/Dubai'),
  WorldTime(location: 'Bangkok',flag: 'Bangkok.png',url: 'Asia/Bangkok'),
  WorldTime(location: 'Hong_Kong',flag: 'Hong_Kong',url: 'Asia/Hong_Kong'),
  WorldTime(location: 'Kolkata',flag: 'Kolkata.png',url: 'Asia/Kolkata'),
  WorldTime(location: 'Tokyo',flag: 'Tokyo.png',url: 'Asia/Tokyo'),
  WorldTime(location: 'South_Georgia',flag: 'South_Georgia',url: 'Atlantic/South_Georgia'),
  WorldTime(location: 'Melbourne',flag: 'Melbourne.png',url: 'Australia/Melbourne'),
  WorldTime(location: 'Moscow',flag: 'Moscow.png',url: 'Europe/Moscow'),
  WorldTime(location: 'Berlin',flag: 'Berlin.png',url: 'Europe/Berlin'),


  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context , {
    'location' : instance.location,
    'flag' : instance.flag,
    'time': instance.time,
    'isDayTime': instance.isDayTime,
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Choose a Location"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0,

      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0 , horizontal: 5.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
