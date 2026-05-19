import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SecondStateFullWidget extends StatefulWidget {
  const SecondStateFullWidget({super.key});

  @override
  State<SecondStateFullWidget> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondStateFullWidget> {
  @override
  void initState() {
    super.initState();

   /* SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );*/
  }

  /*@override
  void dispose() {
    // Optional: restore default when leaving page
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.black),
    );

    super.dispose();
  }*/

  File? selectedImage;

  final ImagePicker picker = ImagePicker();

  // Gallery
  Future<void> pickFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  // Camera
  Future<void> pickFromCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  // Bottom sheet
  void showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              onTap: () {
                Navigator.pop(context);
                pickFromCamera();
              },
            ),

            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Gallery"),
              onTap: () {
                Navigator.pop(context);
                pickFromGallery();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {},
              child: const Text("Red Button"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {},
              child: const Text("Black Button"),
            ),
            SizedBox(height: 20),
            GestureDetector(onTap: showImagePickerOptions,
            child: Container(height: 150,width: 150,
              decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
            ),
              child: selectedImage != null ? ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(
                  selectedImage!,
                  fit: BoxFit.cover,
                ),
              ) : const Icon(
                Icons.add_a_photo,
                size: 50,
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
