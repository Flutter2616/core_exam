import 'dart:io';

import 'package:core_exam/book_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

List booklist = [
  BookModal(
      number: "4758934758",
      email: "princerawal@gmail.com",
      name: "prince rawal"),
];

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          height: 55,
          child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, 'add').then((value) {
                  setState(() {

                  });
                },);
              },
              backgroundColor: Colors.blue,
              child: Icon(Icons.add)),
        ),
        appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            actions: [
              Icon(Icons.more_vert, color: Colors.blue, size: 25),
            ],
            title: Text(
              "Address Book",
              style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue),
            )),
        backgroundColor: Colors.grey.shade100,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
              child: Text("MY CONTACT",
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                alignment: Alignment.center,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Type name or number",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade400,
                      )),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return box(booklist[index]);
                  },
                  itemCount: booklist.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget box(BookModal b) {
    return Column(
      children: [
        Divider(color: Colors.grey, height: 1, thickness: 1),
        SizedBox(height: 5),
        ExpansionTile(
          leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: b.img==null?Image.asset(
                  "assets/person.jpg",
                  fit: BoxFit.fill):Image.file(File("${b.img}"),fit: BoxFit.fill)),
          subtitle: Text("${b.number}"),
          title: Text("${b.name}",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w500)),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(onTap: () {
                    launchUrl(Uri.parse("tel:${b.number}"));
                  },child: Icon(Icons.call,color: Colors.blue,size: 25)),
                  InkWell(onTap: () {
                    launchUrl(Uri.parse("sms:${b.number}"));
                  },child: Icon(Icons.sms,color: Colors.blue,size: 25)),
                  InkWell(onTap: () {
                    launchUrl(Uri.parse("mailto:${b.email}"));
                  },child: Icon(Icons.email,color: Colors.blue,size: 25)),
                ],
              ),
            )
          ],
          ),
        SizedBox(height: 5),
      ],
    );
  }
}
