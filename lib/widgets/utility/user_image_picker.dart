import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn);

  final void Function(File pickedImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImageFile = File('');
  Future<void> _pickImage(ImageSource source, BuildContext ctx) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: source,
      imageQuality: 50,
      maxWidth: 150,
    );
    try {
      setState(() {
        if (pickedImage != null) {
          _pickedImageFile = File(pickedImage.path);
          print('image picked');
        } else {
          print('No image selected.');
        }
      });
      widget.imagePickFn(_pickedImageFile);
      Navigator.pop(ctx);
    } catch (error) {
      setState(() {
        print(error);
        throw Exception();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
              // ignore: unnecessary_null_comparison
              _pickedImageFile != null ? FileImage(_pickedImageFile) : null,
        ),
        TextButton.icon(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Choose an Image'),
                content: const Text('Choose an image from camera or gallery'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextButton(
                      onPressed: () {
                        _pickImage(ImageSource.gallery, ctx);
                      },
                      child: const Text('Gallery'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextButton(
                      onPressed: () {
                        _pickImage(ImageSource.camera, ctx);
                      },
                      child: const Text('Camera'),
                    ),
                  ),
                ],
              ),
            );
          },
          icon: const Icon(Icons.image),
          label: const Text('Add image'),
        ),
      ],
    );
  }
}
