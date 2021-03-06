import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ultron_5/ui/carousel.dart';

class DestinationDataScreen extends StatelessWidget {
  final address;
  final lat;
  final lng;
  const DestinationDataScreen(
      {Key? key, required this.address, required this.lat, required this.lng})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('places')
            .where('lat', isEqualTo: lat)
            .snapshots(),
        builder: (ctx, AsyncSnapshot locationSnapshot) {
          if (locationSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final locDocs = locationSnapshot.data!.docs;
          if (locDocs.isEmpty) {
            return Scaffold(
              appBar: AppBar(title: Text(address)),
              body: const Center(
                child: Text('No data found'),
              ),
            );
          }
          final lat = locDocs[0]['lat'].toString();
          final lng = locDocs[0]['lng'].toString();
          final docId = locDocs[0].id;
          final amenities = locDocs[0]['amenities'];
          bool braille = amenities.values.toList()[0];
          bool wheelChair = amenities.values.toList()[1];
          bool ramps = amenities.values.toList()[2];
          bool lift = amenities.values.toList()[3];
          bool asl = amenities.values.toList()[4];

          return Scaffold(
            appBar: AppBar(title: Text(address)),
            body: Column(
              children: [
                Carousel(id: docId, lat: lat, lng: lng),
                SizedBox(height: 20),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.book_online_outlined),
                        title: const Text(
                          'Braille Boards',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        trailing: braille
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 22,
                              )
                            : const Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 18,
                              ),
                      ),
                      ListTile(
                        leading: Icon(Icons.accessible_forward_outlined),
                        title: Text(
                          'WheelChairs',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        trailing: wheelChair
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 22,
                              )
                            : const Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 22,
                              ),
                      ),
                      ListTile(
                        leading: Icon(Icons.ramp_right_rounded),
                        title: Text(
                          'Ramps',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        trailing: ramps
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 22,
                              )
                            : const Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 22,
                              ),
                      ),
                      ListTile(
                        leading: Icon(Icons.elevator_rounded),
                        title: Text(
                          'Lift',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        trailing: lift
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 22,
                              )
                            : const Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 22,
                              ),
                      ),
                      ListTile(
                        leading: Icon(Icons.accessible_forward_outlined),
                        title: Text(
                          'ASL Qualified Staffs',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        trailing: asl
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 22,
                              )
                            : const Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 22,
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
