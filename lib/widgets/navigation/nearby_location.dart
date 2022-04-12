import 'dart:convert';

import 'package:flutter/material.dart';

import '../../main.dart';

Widget nearbyLocation(
  List responses,
  TextEditingController destinationController,
) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: responses.length,
    itemBuilder: (BuildContext context, int index) {
      return Column(
        children: [
          ListTile(
            onTap: () {
              String text = responses[index]['place'];
              destinationController.text = text;
              sharedPreferences.setString(
                  'destination', json.encode(responses[index]));
            },
            leading: const SizedBox(
              height: double.infinity,
              child: CircleAvatar(child: Icon(Icons.map)),
            ),
            title: Text(responses[index]['name'],
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(responses[index]['address'],
                overflow: TextOverflow.ellipsis),
          ),
          const Divider(),
        ],
      );
    },
  );
}
