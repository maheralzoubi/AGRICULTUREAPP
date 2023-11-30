import 'package:agricultureapp/constants/color.dart';
import 'package:agricultureapp/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 5,
        title: Row(
          children: [
            Image.asset(
              "assets/logo/logo.png",
              width: 60,
              height: 60,
            ),
            Text(
              "AGRICULTURE",
              style: TextStyle(
                  color: AppColors().primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: AppColors().primaryColor,
                ),
              ],
            ),
          )
        ],
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController controller) {
          return GridView.builder(
            itemCount: controller.listNodes.length,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1.6 / 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed("details_nodes-view");
                    },
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors().primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      controller.listNodes[index].image.toString(),
                      width: 150,
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          controller.listNodes[index].title.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
