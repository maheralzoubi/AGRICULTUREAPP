import 'package:agricultureapp/widgets/custom_vertical_conatiner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/default_controller.dart';
import '../../widgets/chart_widget/anemometer_view.dart';

import '../../widgets/chart_widget/atemprature_circlue.dart';
import '../../widgets/chart_widget/battery_chart.dart';
import '../../widgets/chart_widget/bytlength_chart.dart';
import '../../widgets/chart_widget/direction_chart.dart';
import '../../widgets/chart_widget/rhumidity.dart';
import '../../widgets/chart_widget/soilMoisture.dart';

class DefaultView extends StatelessWidget {
  DefaultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<DefaultController>(
          init: DefaultController(),
          builder: (DefaultController controller) {
            return controller.loading == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      child: Column(
                        children: [
                          // ATemprature chart

                          Row(
                            children: [
                              CustomVerticalContainer(
                                text: "ATemprature",
                                chart: AtempreatureCirclue(
                                    value: double.parse((controller
                                            .dataApi["message"]["ATemprature"])
                                        .toStringAsFixed(2))),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Bettery chart
                              CustomVerticalContainer(
                                text: "Bettery",
                                chart: BatteryChart(
                                    bettery: double.parse((controller
                                            .dataApi["message"]["Bettery"])
                                        .toStringAsFixed(2))),
                              ),

                              // Anemometer chart
                              CustomVerticalContainer(
                                text: "Anemometer",
                                chart: AnemometerChart(
                                    value: double.parse((controller
                                            .dataApi["message"]["Anemometer"])
                                        .toStringAsFixed(2))),
                              )
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomVerticalContainer(
                                text: "Luxes",
                                chart: BytLengthChart(
                                    pointerValue: double.parse(
                                        (controller.dataApi["message"]["Luxes"])
                                            .toStringAsFixed(2))),
                              ),
                              CustomVerticalContainer(
                                text: "Bytlength",
                                chart: BytLengthChart(pointerValue: 102.0),
                              )
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomVerticalContainer(
                                  text: "SoilMoisture",
                                  chart: SoilMoistureChart(
                                      value: double.parse(
                                          (controller.dataApi["message"]
                                                  ["SoilMoisture"])
                                              .toStringAsFixed(2)))),
                              CustomVerticalContainer(
                                text: "WindDirection",
                                chart: DirectionChart(
                                  value: controller.dataApi["message"]
                                      ["WindDirection"],
                                ),
                              )
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomVerticalContainer(
                                  text: "Pressure",
                                  chart: SoilMoistureChart(
                                    value: double.parse((controller
                                            .dataApi["message"]["Pressure"])
                                        .toStringAsFixed(2)),
                                  )),
                              CustomVerticalContainer(
                                text: "RHumidity",
                                chart: RhumidityChart(
                                    value: double.parse((controller
                                            .dataApi["message"]["RHumidity"])
                                        .toStringAsFixed(2))),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}
