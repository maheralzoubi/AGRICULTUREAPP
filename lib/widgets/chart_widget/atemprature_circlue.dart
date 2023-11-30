import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AtempreatureCirclue extends StatelessWidget {
  final dynamic value;
  const AtempreatureCirclue({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildRadialImageAnnotation();
  }

  /// Returns the image annotation gauge
  SfRadialGauge _buildRadialImageAnnotation() {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
            interval: 10,
            radiusFactor: 0.95,
            startAngle: 0,
            endAngle: 360,
            showTicks: false,
            showLabels: false,
            axisLineStyle: const AxisLineStyle(thickness: 10),
            pointers: <GaugePointer>[
              RangePointer(
                  value: value,
                  width: 20,
                  color: Color(0xFFFFCD60),
                  enableAnimation: true,
                  gradient: SweepGradient(
                      colors: <Color>[Color(0xFFFCE38A), Color(0xFFF38181)],
                      stops: <double>[0.25, 0.75]),
                  cornerStyle: CornerStyle.bothCurve)
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Added image widget as an annotation
                      Container(
                          width: 50.00,
                          height: 50.00,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage('assets/sun.png'),
                              fit: BoxFit.fill,
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                        child: Text('$value °C',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                      ),
                    ],
                  ),
                  angle: 270,
                  positionFactor: 0.1)
            ])
      ],
    );
  }
}
