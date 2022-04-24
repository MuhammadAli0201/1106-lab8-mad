import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp( Q1());
}

class Q1 extends StatefulWidget {
  
  double? latitude=0;
  double? longitude=0;

  @override
  
  State<Q1> createState() => _Q1State();
}

class _Q1State extends State<Q1> {
  var permission;
  @override
  void getcurrentposition() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
      print("Unable to Access Location");
    } 
    }
    Position p = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
        widget.latitude=p.latitude;
        widget.longitude=p.longitude;
    print(p.latitude);
    print(p.longitude);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcurrentposition();
  }

  

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
          children: [
           Container(
             child: Column(
               children: [
                  IconButton(
              onPressed: () {
                setState(() {
                  
                getcurrentposition();
                });
                
                 },
              icon: Icon(Icons.my_location_sharp),
              iconSize: 100,
            ),
            Text("Calculate",style: TextStyle(color: Colors.amber.shade700,fontSize: 30)),
               ],
             ),
           ),
            Column(

              children: [
                Text("LATITUDE:",style: TextStyle(fontSize: 40,color:Colors.blue.shade300),),
                Padding(padding: EdgeInsets.only(left: 30)),
                Text(widget.latitude.toString(),style:TextStyle(fontSize: 25,color:Colors.green.shade700),),
                 Text("LONGITUDE:",style: TextStyle(fontSize: 40,color:Colors.blue.shade300),),
                Padding(padding: EdgeInsets.only(left: 30)),
                Text(widget.longitude.toString(),style:TextStyle(fontSize: 25,color:Colors.green.shade700),),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
