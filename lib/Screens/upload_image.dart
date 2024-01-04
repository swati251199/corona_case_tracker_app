import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? image;
  var imagePicker = ImagePicker();
  void pickImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path).absolute;
      setState(() {});
    } else {
      const Text("No Image ");
    }
  }

  bool loading = false;
  void uploadImage() async {
    setState(() {
      loading = true;
    });

    var stream = http.ByteStream(image!.openRead()); // to read
    stream.cast();
    var length = await image!.length(); // get length

    var uri = Uri.parse("https://fakestoreapi.com/products");

    final request = http.MultipartRequest("POST", uri);

    request.fields["title"] = "static title";

    var multiport = http.MultipartFile("image", stream, length);

    request.files.add(multiport);

    var response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        loading = false;
      });
      print("sucessfull");
    } else {
      loading = false;
      print("failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Image "),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(border: Border.all()),
            child: image == null
                ? Center(
                    child: ElevatedButton(
                        onPressed: () {
                          pickImage();
                        },
                        child: const Text("Picked Image")))
                : Image.file(fit: BoxFit.cover, File(image!.path.toString())),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    uploadImage();
                  },
                  child: loading
                      ? const Text(
                          "Uploading.. .. ..",
                          style: TextStyle(color: Colors.red),
                        )
                      : const Text("Upload Image")))
        ],
      ),
    );
  }
}
