import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kj/services/constants.dart';

class IPC extends StatefulWidget {
  const IPC({Key? key});

  @override
  State<IPC> createState() => _IPCState();
}

class _IPCState extends State<IPC> {
  TextEditingController controller = TextEditingController();

  List<Map<String, dynamic>>? _wordData;
  String? input;

  Future<void> _fetchWordData(String? word) async {
    final response =
        await http.get(Uri.parse('https://ipc-find.vercel.app/api?q=$word'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      if (responseData.isNotEmpty) {
        setState(() {
          _wordData = responseData.cast<Map<String, dynamic>>();
        });
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bg_light_grey1,
          centerTitle: true,
          toolbarHeight: 80,
          title: Text(
            'Karnataka State Police',
            style: TextStyle(
                color: darkest_grey,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: mf),
          ),
        ),
        backgroundColor: bg_light_grey1,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 40, left: 20, bottom: 40, right: 20),
                  child: Text(
                    "IPC LookUp",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: mf,
                        color: darkest_grey),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkest_grey,
                  ),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      fillColor: darkest_grey.withOpacity(0.8),
                      filled: true,
                      hintText: "Eg 300 or Murder Case",
                      hintStyle: TextStyle(
                          fontFamily: mf, color: lighter_green, fontSize: 14),
                      focusColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: darkest_grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        color: dark_green,
                        onPressed: () {
                          setState(() {
                            input = controller.text;
                            _fetchWordData(input);
                          });
                        },
                      ),
                    ),
                    style: TextStyle(color: lightest_green),
                  ),
                ),
              ),
              SizedBox(height: 10),
              _wordData == null
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              bg_light_grey1,
                              lightest_green,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: darkest_grey, width: 1), // Border color
                          // Rounded corners
                        ),
                        padding: EdgeInsets.all(18.0),
                        child: Text(
                          "The Indian Penal Code (IPC) is India's main criminal law, covering a wide range of offenses and their punishments, shaping the country's legal landscape since its enactment in 1860. erving as the cornerstone of India's criminal justice system, the IPC delineates various offenses and prescribes corresponding punishments, guiding the investigation, prosecution, and adjudication of criminal cases throughout the country.",
                          style: TextStyle(
                            color: darkest_grey,
                            fontFamily: mf,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ))
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                bg_light_grey1,
                                lightest_green,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                                color: darkest_grey, width: 1), // Border color
                            // Rounded corners
                          ),
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            _wordData!.first['section_content'] as String,
                            style: TextStyle(
                                fontFamily: mf,
                                fontSize: 16,
                                color: darkest_grey),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
