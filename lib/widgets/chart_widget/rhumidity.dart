import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RhumidityChart extends StatelessWidget {
  final dynamic value;
  const RhumidityChart({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildRadialLabelCustomization();
  }

  SfRadialGauge _buildRadialLabelCustomization() {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
            startAngle: 180,
            endAngle: 360,
            canScaleToFit: true,
            interval: 10,
            radiusFactor: 1,
            labelFormat: '{value}%',
            labelsPosition: ElementsPosition.outside,
            ticksPosition: ElementsPosition.inside,
            labelOffset: 15,
            minorTickStyle: const MinorTickStyle(
                length: 0.05, lengthUnit: GaugeSizeUnit.factor, thickness: 1.5),
            majorTickStyle: const MajorTickStyle(
                length: 0.1, lengthUnit: GaugeSizeUnit.factor, thickness: 1.5),
            minorTicksPerInterval: 5,
            pointers: <GaugePointer>[
              NeedlePointer(
                  value: value,
                  needleStartWidth: 1,
                  needleEndWidth: 3,
                  needleLength: 0.8,
                  lengthUnit: GaugeSizeUnit.factor,
                  knobStyle: KnobStyle(
                    knobRadius: 8,
                    sizeUnit: GaugeSizeUnit.logicalPixel,
                  ),
                  tailStyle: TailStyle(
                      width: 3,
                      lengthUnit: GaugeSizeUnit.logicalPixel,
                      length: 20))
            ],
            axisLabelStyle:
                const GaugeTextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            axisLineStyle:
                const AxisLineStyle(thickness: 3, color: Color(0xFF00A8B5))),
      ],
    );
  }
}
