import 'package:agricultureapp/constants/color.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Contact Us",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('AGRICULTURE APP ',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w400)),
                Container(
                  width: 150,
                  height: 2,
                  color: Colors.orangeAccent,
                ),
                const SizedBox(height: 30),
                const Text('Mobile phone : ',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                const Text('0778947384',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                SizedBox(height: 30),
                const Text('Email : ',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                const Text('OmarNasser@gmail.com',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                const SizedBox(height: 30),
                const Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),
                SizedBox(height: 30),
                Text('Term of services',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: AppColors().primaryColor)),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.share,
        ),
      ),
    );
  }
}
