import 'package:flutter/material.dart';

class CustomHorizentalContainer extends StatelessWidget {
  final String? text;
  final Widget? chart;
  const CustomHorizentalContainer({Key? key, this.text, this.chart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 140,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Text(
              text.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            chart!
          ],
        ));
  }
}
