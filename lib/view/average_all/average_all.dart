import 'package:agricultureapp/widgets/custom_vertical_conatiner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/average_all_nodes_controller.dart';
import '../../controller/default_controller.dart';
import '../../widgets/chart_widget/anemometer_view.dart';

import '../../widgets/chart_widget/atemprature_circlue.dart';
import '../../widgets/chart_widget/battery_chart.dart';
import '../../widgets/chart_widget/bytlength_chart.dart';
import '../../widgets/chart_widget/direction_chart.dart';
import '../../widgets/chart_widget/rhumidity.dart';
import '../../widgets/chart_widget/soilMoisture.dart';

class AverageAllNodes extends StatelessWidget {
  AverageAllNodes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Average All Nodes",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: GetBuilder<AverageAllNodesController>(
          init: AverageAllNodesController(),
          builder: (AverageAllNodesController controller) {
            return controller.loading == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.dataApi["message"]["Items"].isEmpty
                    ? Center(
                        child: Container(
                          child: Text("Empty"),
                        ),
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
                                                    .dataApi["message"]["Items"]
                                                [0]["reading"]["ATemprature"])
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
                                                    .dataApi["message"]["Items"]
                                                [0]["reading"]["Bettery"])
                                            .toStringAsFixed(2))),
                                  ),

                                  // Anemometer chart
                                  CustomVerticalContainer(
                                    text: "Anemometer",
                                    chart: AnemometerChart(
                                        value: double.parse((controller
                                                    .dataApi["message"]["Items"]
                                                [0]["reading"]["Anemometer"])
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
                                        pointerValue: double.parse((controller
                                                    .dataApi["message"]["Items"]
                                                [0]["reading"]["Luxes"])
                                            .toStringAsFixed(2))),
                                  ),
                                  CustomVerticalContainer(
                                    text: "Bytlength",
                                    chart: BytLengthChart(
                                        pointerValue: double.parse((controller
                                                    .dataApi["message"]["Items"]
                                                [0]["reading"]["Bytlength"])
                                            .toStringAsFixed(2))),
                                  )
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomVerticalContainer(
                                      text: "SoilMoisture",
                                      chart: SoilMoistureChart(
                                          value: double.parse((controller
                                                          .dataApi["message"]
                                                      ["Items"][0]["reading"]
                                                  ["SoilMoisture"])
                                              .toStringAsFixed(2)))),
                                  CustomVerticalContainer(
                                    text: "WindDirection",
                                    chart: DirectionChart(
                                      value: controller.dataApi["message"]
                                              ["Items"][0]["reading"]
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
                                                    .dataApi["message"]["Items"]
                                                [0]["reading"]["Pressure"])
                                            .toStringAsFixed(2)),
                                      )),
                                  CustomVerticalContainer(
                                    text: "RHumidity",
                                    chart: RhumidityChart(
                                        value: double.parse((controller
                                                    .dataApi["message"]["Items"]
                                                [0]["reading"]["RHumidity"])
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
