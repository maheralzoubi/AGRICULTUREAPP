import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BytLengthChart extends StatefulWidget {
  dynamic pointerValue;
  BytLengthChart({Key? key, this.pointerValue}) : super(key: key);

  @override
  State<BytLengthChart> createState() => _BytLengthChartState();
}

class _BytLengthChartState extends State<BytLengthChart> {
  @override
  Widget build(BuildContext context) {
    return _buildHorizontalGauges('Inversed axis', _buildInversedAxis(context));
  }

  Widget _buildInversedAxis(BuildContext context) {
    return SizedBox(
        height: 100,
        child: SfLinearGauge(
            isAxisInversed: true,
            animateAxis: false,
            maximum: 200,
            minimum: 10,
            orientation: LinearGaugeOrientation.vertical,
            barPointers: <LinearBarPointer>[
              LinearBarPointer(value: widget.pointerValue)
            ],
            markerPointers: <LinearMarkerPointer>[
              LinearShapePointer(
                  value: widget.pointerValue,
                  onChanged: (dynamic value) {
                    setState(() {
                      widget.pointerValue = value;
                    });
                  }),
            ]));
  }

  Widget _buildHorizontalGauges(String axisTrackName, Widget linearGauge) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        linearGauge,
      ],
    );
  }
}
