import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AnemometerChart extends StatelessWidget {
  final dynamic value;
  const AnemometerChart({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
            showLabels: false,
            showTicks: false,
            radiusFactor: 0.8,
            minimum: 0,
            maximum: 240,
            axisLineStyle: const AxisLineStyle(
                cornerStyle: CornerStyle.startCurve, thickness: 5),
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  angle: 90,
                  positionFactor: 0,
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(value.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 10)),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                        child: Text(
                          'km/h',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 14),
                        ),
                      )
                    ],
                  )),
              const GaugeAnnotation(
                angle: 124,
                positionFactor: 1.1,
                widget: Text('0', style: TextStyle(fontSize: 14)),
              ),
              const GaugeAnnotation(
                angle: 54,
                positionFactor: 1.1,
                widget: Text('240', style: TextStyle(fontSize: 14)),
              ),
            ],
            pointers: [
              RangePointer(
                value: value,
                width: 18,
                pointerOffset: -6,
                cornerStyle: CornerStyle.bothCurve,
                color: const Color(0xFFF67280),
                gradient: const SweepGradient(
                    colors: <Color>[Color(0xFFFF7676), Color(0xFFF54EA2)],
                    stops: <double>[0.25, 0.75]),
              ),
              const MarkerPointer(
                value: 100.0,
                color: Colors.white,
                markerType: MarkerType.circle,
              ),
            ]),
      ],
    );
  }
}
