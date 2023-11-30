import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DirectionChart extends StatelessWidget {
  final dynamic value;
  const DirectionChart({Key? key, this.value = "W"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildRadialCompass();
  }

  SfRadialGauge _buildRadialCompass() {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
            showAxisLine: false,
            ticksPosition: ElementsPosition.outside,
            labelsPosition: ElementsPosition.outside,
            startAngle: 320,
            endAngle: 320,
            minorTicksPerInterval: 10,
            minimum: 0,
            showFirstLabel: false,
            maximum: 360,
            showLastLabel: false,
            interval: 30,
            labelOffset: 20,
            majorTickStyle: const MajorTickStyle(
                length: 0.16, lengthUnit: GaugeSizeUnit.factor),
            minorTickStyle: const MinorTickStyle(
                length: 0.16, lengthUnit: GaugeSizeUnit.factor, thickness: 1),
            axisLabelStyle: const GaugeTextStyle(fontSize: 10),
            pointers: <GaugePointer>[
              value == "W ↑"
                  ? MarkerPointer(value: 270, markerType: MarkerType.triangle)
                  : MarkerPointer(value: 90, markerType: MarkerType.triangle),
              const NeedlePointer(
                  value: 310,
                  needleLength: 0.5,
                  lengthUnit: GaugeSizeUnit.factor,
                  needleColor: Color(0xFFC4C4C4),
                  needleStartWidth: 1,
                  needleEndWidth: 1,
                  knobStyle: KnobStyle(knobRadius: 0),
                  tailStyle: TailStyle(
                      color: Color(0xFFC4C4C4),
                      width: 1,
                      lengthUnit: GaugeSizeUnit.factor,
                      length: 0.5)),
              const NeedlePointer(
                value: 221,
                needleLength: 0.5,
                lengthUnit: GaugeSizeUnit.factor,
                needleColor: Color(0xFFC4C4C4),
                needleStartWidth: 1,
                needleEndWidth: 1,
                knobStyle:
                    KnobStyle(knobRadius: 0, sizeUnit: GaugeSizeUnit.factor),
              ),
              const NeedlePointer(
                value: 40,
                needleLength: 0.5,
                lengthUnit: GaugeSizeUnit.factor,
                needleColor: Color(0xFFC4C4C4),
                needleStartWidth: 1,
                needleEndWidth: 1,
                knobStyle: KnobStyle(knobRadius: 0),
              )
            ],
            annotations: const <GaugeAnnotation>[
              GaugeAnnotation(
                angle: 230,
                positionFactor: 0.38,
                widget: Text('W',
                    style: TextStyle(
                        fontFamily: 'Times',
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              GaugeAnnotation(
                angle: 310,
                positionFactor: 0.38,
                widget: Text('N',
                    style: TextStyle(
                        fontFamily: 'Times',
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              GaugeAnnotation(
                angle: 129,
                positionFactor: 0.38,
                widget: Text('S',
                    style: TextStyle(
                        fontFamily: 'Times',
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              GaugeAnnotation(
                angle: 50,
                positionFactor: 0.38,
                widget: Text('E',
                    style: TextStyle(
                        fontFamily: 'Times',
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              )
            ])
      ],
    );
  }
}
