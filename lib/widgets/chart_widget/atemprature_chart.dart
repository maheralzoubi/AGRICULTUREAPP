// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// ignore: must_be_immutable
class AtempratureChart extends StatefulWidget {
  dynamic valueAtemprature;
  AtempratureChart({
    Key? key,
    required this.valueAtemprature,
  }) : super(key: key);

  @override
  State<AtempratureChart> createState() => _AtempratureChartState();
}

class _AtempratureChartState extends State<AtempratureChart> {
  final GlobalKey<SfRadialGaugeState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
        minimum: 0.0,
        maximum: 40.0,
        interval: 10.0,
        minorTicksPerInterval: 0,
        animateAxis: true,
        labelFormatterCallback: (String value) {
          return value + '°c';
        },
        axisTrackStyle: const LinearAxisTrackStyle(thickness: 1),
        barPointers: <LinearBarPointer>[
          LinearBarPointer(
              value: 80,
              thickness: 24,
              position: LinearElementPosition.outside,
              shaderCallback: (Rect bounds) {
                return const LinearGradient(colors: <Color>[
                  Colors.green,
                  Colors.orange,
                  Colors.red
                ], stops: <double>[
                  0.1,
                  0.4,
                  0.9,
                ]).createShader(bounds);
              }),
        ],
        markerPointers: <LinearMarkerPointer>[
          LinearWidgetPointer(
              value: widget.valueAtemprature,
              offset: 26,
              position: LinearElementPosition.outside,
              child: SizedBox(
                  width: 50,
                  height: 45,
                  child: Center(
                      child: Text(
                    widget.valueAtemprature.toStringAsFixed(3) + '°C',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: widget.valueAtemprature < 20
                            ? Colors.green
                            : widget.valueAtemprature < 60
                                ? Colors.orange
                                : Colors.red),
                  )))),
          LinearShapePointer(
            offset: 25,
            onChanged: (dynamic value) {
              setState(() {
                widget.valueAtemprature = value as double;
              });
            },
            value: widget.valueAtemprature,
            color: widget.valueAtemprature < 20
                ? Colors.green
                : widget.valueAtemprature < 60
                    ? Colors.orange
                    : Colors.red,
          ),
        ]);
  }
}
