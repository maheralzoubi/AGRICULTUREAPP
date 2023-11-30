import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BatteryChart extends StatelessWidget {
  final double bettery;
  const BatteryChart({Key? key, required this.bettery}) : super(key: key);

  final double _minimum = 0;
  final double _maximum = 100;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 145,
        child: SfLinearGauge(
          minimum: _minimum,
          maximum: _maximum,
          showLabels: false,
          showTicks: false,
          tickPosition: LinearElementPosition.cross,
          majorTickStyle:
              const LinearTickStyle(color: Colors.green, length: 20),
          minorTickStyle: const LinearTickStyle(color: Colors.red, length: 10),
          axisTrackStyle: const LinearAxisTrackStyle(
              thickness: 1, color: Colors.transparent),
          ranges: <LinearGaugeRange>[
            LinearGaugeRange(
                startValue: _minimum,
                startWidth: 70,
                endWidth: 70,
                color: Colors.transparent,
                endValue: _maximum - 2,
                position: LinearElementPosition.cross,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.rectangle,
                        border: Border.all(
                            color: const Color(0xffAAAAAA), width: 4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))))),
            LinearGaugeRange(
                startValue: _minimum + 5,
                startWidth: 55,
                endWidth: 55,
                endValue: bettery < _maximum / 4 ? bettery : _maximum / 4,
                position: LinearElementPosition.cross,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4)))),
            LinearGaugeRange(
                startValue: bettery >= (_maximum / 4 + 2)
                    ? (_maximum / 4 + 2)
                    : _minimum + 5,
                endValue: bettery < (_maximum / 4 + 2)
                    ? _minimum + 5
                    : bettery <= _maximum / 2
                        ? bettery
                        : _maximum / 2,
                startWidth: 55,
                endWidth: 55,
                position: LinearElementPosition.cross,
                edgeStyle: LinearEdgeStyle.bothFlat,
                rangeShapeType: LinearRangeShapeType.flat,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4)))),
            LinearGaugeRange(
                startValue: bettery >= (_maximum / 2 + 2)
                    ? (_maximum / 2 + 2)
                    : _minimum + 5,
                endValue: bettery < (_maximum / 2 + 2)
                    ? _minimum + 5
                    : bettery <= (_maximum * 3 / 4)
                        ? bettery
                        : (_maximum * 3 / 4),
                startWidth: 55,
                endWidth: 55,
                position: LinearElementPosition.cross,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4)))),
            LinearGaugeRange(
                startValue: bettery >= (_maximum * 3 / 4 + 2)
                    ? (_maximum * 3 / 4 + 2)
                    : _minimum + 5,
                endValue: bettery < (_maximum * 3 / 4 + 2)
                    ? _minimum + 5
                    : bettery < _maximum
                        ? bettery
                        : _maximum - 7,
                startWidth: 55,
                endWidth: 55,
                position: LinearElementPosition.cross,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4)))),
          ],
          markerPointers: <LinearMarkerPointer>[
            LinearWidgetPointer(
                value: _maximum,
                enableAnimation: false,
                markerAlignment: LinearMarkerAlignment.start,
                child: Container(
                    height: 38,
                    width: 16,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.rectangle,
                        border: Border.all(
                            color: const Color(0xff4D4D4D), width: 4),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(6),
                            bottomRight: Radius.circular(6)))))
          ],
          barPointers: <LinearBarPointer>[
            LinearBarPointer(
              value: 100,
              thickness: 30,
              position: LinearElementPosition.outside,
              offset: 50,
              enableAnimation: false,
              color: Colors.transparent,
              child: Center(
                child: Text(bettery.toStringAsFixed(0) + '%',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ));
  }
}
