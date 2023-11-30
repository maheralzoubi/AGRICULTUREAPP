import 'package:agricultureapp/model/home_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  List<HomeModel> listNodes = [
    HomeModel(
      title: "section1",
      image: "assets/lora-sensor-node-500x500-removebg-preview.png",
    ),
    HomeModel(
      title: "section2",
      image: "assets/lora-sensor-node-500x500-removebg-preview.png",
    ),
    HomeModel(
      title: "section3",
      image: "assets/lora-sensor-node-500x500-removebg-preview.png",
    ),
    HomeModel(
      title: "section4",
      image: "assets/lora-sensor-node-500x500-removebg-preview.png",
    ),
  ];
}
