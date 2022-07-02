// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_application/screen2.dart';

void main() {
  runApp(screen1());
}

class screen1 extends StatefulWidget {
  const screen1({Key? key}) : super(key: key);

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Training',
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'DancingScript',
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  child: Image(
                    image: NetworkImage(
                        'https://thesaltretreat.com/wp-content/uploads/2019/09/3991440-training-png-87-images-in-collection-page-1-training-png-470_313_preview-400x266.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontStyle: FontStyle.normal),
                  ),
                  onPressed:  () {
                  Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => screen2()),
                                            );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}








import 'package:flutter/material.dart';

import 'package:flutter_application/screen3.dart';

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();

class screen2 extends StatefulWidget {
  const screen2({Key? key}) : super(key: key);
  @override
  State<screen2> createState() => _screen2();
}

// ignore: camel_case_types
class _screen2 extends State<screen2> {

  String? _nError = null;
  String? _eError = null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ListView(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("Login",
                        style: TextStyle(
                            color: Color.fromARGB(255, 39, 13, 116),
                            fontWeight: FontWeight.bold,
                            fontSize: 70)),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      maxLength: 30,
                      controller: _name,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          errorText: _nError,
                          border: InputBorder.none,
                          labelText: ("Student Name"),
                          icon: Icon(Icons.person)),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      maxLength: 30,
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          errorText: _eError,
                          border: InputBorder.none,
                          labelText: ("Email ID"),
                          icon: Icon(Icons.email_rounded)),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (_name.text.isEmpty) {
                                    _nError = "Enter the amount";
                                  } else {
                                    _nError = null;
                                  }
                                  if (_email.text.isEmpty) {
                                    _eError = "Enter the amount";
                                  } else {
                                    _eError = null;
                                  }
                                  if (_name.text.isNotEmpty &&
                                      _email.text.isNotEmpty) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => screen3(name:_name.text)),
                                            );
                                  }
                                });
                              },
                              child: Text('Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.normal,
                                  ))),
                        ),
                      ]),
                    ),
                  ])),
            )));
  }
}



import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class screen3 extends StatelessWidget {
  var name = "";
  DateTime today = DateTime.now();
   screen3({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: ListView(children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Hi,${name}",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image(
              image: NetworkImage(
                  'https://img.freepik.com/free-vector/modern-employee-month-certificate_52683-75428.jpg?w=2000'),
              height: 500,
              width: 500,
            ),
          ),
          Container(
            padding: EdgeInsets.all(3.0),
            child: Text(
              "You Have Successfully Completed Hybrid Mobile App Developement Course.",
              style: TextStyle(fontWeight: FontWeight.w300),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(2.0),
            child: Text(
              "INSTRUCTOR NAME",
              style: TextStyle(fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: EdgeInsets.all(2.0),
            child: Text("Pankaj Kapoor",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.blue)),
          ),
          Container(
            child: Text(
              "Date ${today.day}-${today.month}-${today.year}",
              style: TextStyle(fontSize: 20),
            ),
            alignment: Alignment.bottomRight,
          ),
        ]),
      ),
    )));
  }
}

