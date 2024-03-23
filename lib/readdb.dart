import 'package:flutter/material.dart';
import 'package:fake_fireman/utils/color_palette.dart';
import 'package:fake_fireman/firebase_db.dart';
import 'package:fake_fireman/readdb.dart';

class MyWidget3 extends StatelessWidget {
  MyWidget3({Key? key}) : super(key: key);

  final DBservEvents _db = DBservEvents();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _db.getEvents(),
      builder: (context, snapshot) {
        List myEvents = snapshot.data?.docs ?? [];
        return Scaffold(
          backgroundColor:
              Colors.grey[200], // Set background color for the scaffold
          body: Stack(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: myEvents.length,
                itemBuilder: (context, index) {
                  var event = myEvents[index].data();
                  String eventId = myEvents[index].id;
                  String coValue = event['co'].toString();
                  String humidityValue = event['humidity'].toString();
                  String id = event['id'].toString();
                  String smoke = event['smoke'].toString();
                  String temp = event['temp'].toString();
                  String lpg = event['lpg'].toString();
                  return GestureDetector(
                    onTap: () {
                      print("Event tapped: $eventId");
                      // Handle onTap event here for the specific event
                    },
                    child: Card(
                      elevation: 5.0,
                      color: kWhiteColor, // Set card color to white
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CO: $coValue',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Humidity: $humidityValue'),
                            Text('ID: $id'),
                            Text('Smoke: $smoke'),
                            Text('Temperature: $temp'),
                            Text('LPG: $lpg'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                top: 0,
                left: 0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black, // Set icon color to black
                  onPressed: () {
                    Navigator.pop(
                        context); // Navigate back to the previous page
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
