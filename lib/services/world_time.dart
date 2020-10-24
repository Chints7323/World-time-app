import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

 String location ; //location name for the ui
 String time ;//time for that location
 String flag; //url to asset flag icon
 String url ; //location url for api end points
 bool isDayTime; //true / false if its day time
 WorldTime ({this.location,this.flag,this.url});


 Future<void> getTime () async {

   try{
     Response response = await get('http://worldtimeapi.org/api/timezone/$url');
     Map data = jsonDecode(response.body);
     //print(data);

     //get property from data
     String datetime =data['datetime'];
     String offset =data['utc_offset'].substring(0,3);
     //print(datetime);
     //print(offset);

     //create datetime object

     DateTime now = DateTime.parse(datetime);
     now=now.add(Duration(hours: int.parse(offset)));
     print(now);
     //set time property
     isDayTime = (now.hour >=6 && now.hour<= 20)?true : false;
     time=DateFormat.jm().format(now);
   }
   catch(e){
     print(e);
     time='Could not get the time';
   }

   //make request
 }

}

