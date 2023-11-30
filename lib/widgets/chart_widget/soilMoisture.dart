import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SoilMoistureChart extends StatelessWidget {
  final dynamic value;
  const SoilMoistureChart({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildDefaultRadialGauge();
  }

  SfRadialGauge _buildDefaultRadialGauge() {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
            interval: 10,
            axisLineStyle: const AxisLineStyle(
              thickness: 0.03,
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            showTicks: false,
            axisLabelStyle: const GaugeTextStyle(
              fontSize: 11,
            ),
            labelOffset: 25,
            radiusFactor: 0.80,
            pointers: <GaugePointer>[
              NeedlePointer(
                  needleLength: 0.7,
                  value: value,
                  lengthUnit: GaugeSizeUnit.factor,
                  needleColor: _needleColor,
                  needleStartWidth: 0,
                  needleEndWidth: 4,
                  knobStyle: KnobStyle(
                      sizeUnit: GaugeSizeUnit.factor,
                      color: _needleColor,
                      knobRadius: 0.05)),
            ])
      ],
    );
  }

  final Color _needleColor = const Color(0xFFC06C84);
}
