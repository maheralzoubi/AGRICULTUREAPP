import 'package:get/get_state_manager/get_state_manager.dart';

import '../repository/all_average_repository.dart';

class DefaultController extends GetxController {
  Defaulrrepository _defaulrrepository = Defaulrrepository();

  bool _loading = false;

  bool get loading => _loading;

  var dataApi = {};

  getData() async {
    _loading = true;

    update();
    var data = await _defaulrrepository.DefaultData();

    dataApi = data;

    print(dataApi["message"]["ATemprature"]);

    _loading = false;

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
