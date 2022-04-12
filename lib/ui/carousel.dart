import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key, this.id, this.lat, this.lng}) : super(key: key);
  final id;
  final lat;
  final lng;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('places')
            .doc(widget.id)
            .collection('media')
            .snapshots(),
        builder: (ctx, AsyncSnapshot imgSnapshot) {
          if (imgSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final imgDocs = imgSnapshot.data!.docs;
          final imgList = [
            'https://www.srmist.edu.in/sites/default/files/images/ARIIA-2020-SRMIST-2.jpg',
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Chengalpet_Railway_Station.jpg/1200px-Chengalpet_Railway_Station.jpg',
            'https://theadmissionbox.com/wp-content/uploads/2021/06/direct-admission-srm-university.png',
            'https://images.shiksha.com/mediadata/images/articles/1584704603phpyv6Sd7.jpeg'
          ];

          return CarouselSlider(
              items: imgList.map((doc) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Image.network(
                      doc,
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ));
        });
  }
}
