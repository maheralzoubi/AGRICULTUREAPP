import 'package:flutter/material.dart';

class CustomVerticalContainer extends StatelessWidget {
  final String? text;
  final Widget? chart;
  const CustomVerticalContainer({Key? key, this.text, this.chart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 210,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            color: Colors.white,
            borderRadius: BorderRadius.circular(0)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  text.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(flex: 4, child: chart!)
          ],
        ),
      ),
    );
  }
}
