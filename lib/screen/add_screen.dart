import 'dart:io';

import 'package:core_exam/book_modal.dart';
import 'package:core_exam/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({Key? key}) : super(key: key);

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  String? path;
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Add Contact",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700, fontSize: 25, color: Colors.blue),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Stack(
                alignment: Alignment(1.2, 0.8),
                children: [
                  path == null
                      ? CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage("assets/person.jpg"),
                        )
                      : CircleAvatar(
                          radius: 70,
                          backgroundImage: FileImage(File("$path")),
                        ),
                  InkWell(
                    onTap: () {
                      dialog();
                    },
                    child: CircleAvatar(
                        radius: 20,
                        child: Icon(Icons.camera, color: Colors.blue),
                        backgroundColor: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full Name",
                    style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    controller: name,keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade400, width: 2),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2))),
                  )
                ],
              ),
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Number",
                    style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    controller: number,keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade400, width: 2),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2))),
                  )
                ],
              ),
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "E-mail",
                    style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    controller: email,keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade400, width: 2),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2))),
                  )
                ],
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      BookModal b=BookModal(name: name.text,email: email.text,number: number.text,img: path);
                      booklist.add(b);
                    });
                    Navigator.pushReplacementNamed(context, 'home');
                  },
                  child: Container(
                    height: 55,
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text("Add Contact",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 25)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void dialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Take Image"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async {
                      ImagePicker img = ImagePicker();
                      XFile? xfile =
                          await img.pickImage(source: ImageSource.gallery);
                      setState(() {
                        path = xfile!.path;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(Icons.image, color: Colors.blue, size: 30),
                        SizedBox(height: 5),
                        Text("Gallery"),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      ImagePicker img = ImagePicker();
                      XFile? xfile =
                          await img.pickImage(source: ImageSource.camera);
                      setState(() {
                        path = xfile!.path;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(Icons.camera_alt, color: Colors.blue, size: 30),
                        SizedBox(height: 5),
                        Text("Camera"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
