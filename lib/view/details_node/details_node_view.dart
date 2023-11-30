import 'dart:convert';
import 'dart:ui';

import 'package:agricultureapp/controller/socket_controller.dart';

import 'package:agricultureapp/widgets/custom_vertical_conatiner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/chart_widget/anemometer_view.dart';
import '../../widgets/chart_widget/atemprature_circlue.dart';
import '../../widgets/chart_widget/battery_chart.dart';
import '../../widgets/chart_widget/bytlength_chart.dart';
import '../../widgets/chart_widget/direction_chart.dart';
import '../../widgets/chart_widget/rhumidity.dart';
import '../../widgets/chart_widget/soilMoisture.dart';
import '../defualt_view/default_view.dart';
import '../details_single_node/details_atemp_chart.dart';

class DetailsNodesView extends StatelessWidget {
  DetailsNodesView({Key? key}) : super(key: key);

  final SocketController _socketController = Get.put(SocketController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Chart",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: StreamBuilder(
            stream: _socketController.socket.stream,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return DefaultView();
              } else {
                dynamic data = jsonDecode(snapshot.data!);
                dynamic data2 = jsonDecode(data);
                print(data2);
                return SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    child: Column(
                      children: [
                        // ATemprature chart

                        Row(
                          children: [
                            Container(
                              child: CustomVerticalContainer(
                                text: "ATemprature",
                                chart: AtempreatureCirclue(
                                  value: double.parse(data2['ATemprature']
                                      .replaceAll(RegExp(r'[^0-9.]'), '')),
                                ),
                              ),
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
                                  bettery: double.parse(data2['Bettery']
                                      .replaceAll(RegExp(r'[^0-9]'), '')),
                                )),

                            // Anemometer chart
                            CustomVerticalContainer(
                              text: "Anemometer",
                              chart: AnemometerChart(
                                value: double.parse(data2['Anemometer']
                                    .replaceAll(RegExp(r'[^0-9]'), '')),
                              ),
                            )
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomVerticalContainer(
                              text: "Luxes",
                              chart: BytLengthChart(
                                  pointerValue: double.parse(data2['Luxes']
                                      .replaceAll(RegExp(r'[^0-9]'), ''))),
                            ),
                            CustomVerticalContainer(
                              text: "Bytlength",
                              chart: BytLengthChart(
                                  pointerValue: data2['Bytlength'].toDouble()),
                            )
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomVerticalContainer(
                                text: "SoilMoisture",
                                chart: SoilMoistureChart(
                                  value: double.parse(data2['SoilMoisture']),
                                )),
                            CustomVerticalContainer(
                              text: "WindDirection",
                              chart: DirectionChart(
                                value: data2['WindDirection'],
                              ),
                            )
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 210,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(0)),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: const Text(
                                          "Pressure",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: Text(
                                          data2["Pressure"].toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            CustomVerticalContainer(
                              text: "RHumidity",
                              chart: RhumidityChart(
                                value: double.parse(
                                  data2['RHumidity']
                                      .replaceAll(RegExp(r'[^0-9.]'), ''),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            }));
  }
}
