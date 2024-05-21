import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'services/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  final picker = ImagePicker();
  XFile? _image;

  Future<void> _uploadFiles() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }

  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_light_grey1,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    darkest_grey,
                    darker_grey,
                  ],
                ),
                borderRadius: BorderRadius.circular(14.0), // Rounded border
                border: Border.all(color: bg_light_grey1),
              ),
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 18, bottom: 18),
              child: Text(
                "Speak Up, Stay Safe: Your Voice Matters! Report Anything to Authorities Instantly.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: mf,
                  fontWeight: FontWeight.bold,
                  color: white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // padding: EdgeInsets.all(15.0),
            children: [
              if (_image != null)
                FutureBuilder<Uint8List>(
                  future: File(_image!.path).readAsBytes(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Container(
                        width: 350,
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: bg_light_grey1,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          color: bg_light_grey1,
                        ),
                        child: Image.memory(
                          snapshot.data!,
                          width: 350,
                          height: 400,
                          fit: BoxFit.contain,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              if (_image == null)
                Container(
                  width: 340,
                  height: 270,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: bg_light_grey1,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                    color: darker_grey,
                  ),
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      'assets/add-ss.png',
                      height: 250,
                      width: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              SizedBox(height: 15.0),
              _buildTextField(_locationController, 'Location of incident',
                  Icons.location_pin),
              _buildTextField(
                _descriptionController,
                'Description of the incident',
                Icons.description,
              ),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: _uploadFiles,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: dark_green,
                        foregroundColor: bg_light_grey1,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 140.0),
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              fontFamily: mf,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _showNotification(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: darkest_grey,
                          foregroundColor: darkest_grey),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 140.0),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontFamily: mf,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}

void _showNotification(BuildContext context) {
  Fluttertoast.showToast(
    msg: 'Post submitted successfully',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP, // Show notification at the top
    backgroundColor: dark_green,
    textColor: white,
    fontSize: 14,
  );
}

Widget _buildTextField(
    TextEditingController controller, String labelText, IconData prefixIcon) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    child: TextField(
      controller: controller,
      style: TextStyle(fontFamily: mf, color: darkest_grey),
      decoration: InputDecoration(
        // fillColor: Color.fromRGBO(42, 51, 79, 1),
        labelText: labelText,
        labelStyle: TextStyle(color: darker_grey, fontFamily: mf, fontSize: 14),
        prefixIcon: Icon(prefixIcon, color: lightest_green),
        border: OutlineInputBorder(
          borderSide: BorderSide(), // Normal border color
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: text_grey), // Focused border color
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}
