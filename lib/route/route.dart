import 'package:agricultureapp/view/auth/login_view.dart';
import 'package:agricultureapp/view/bottom_bar/bottom_bar_view.dart';
import 'package:agricultureapp/view/details_node/details_node_view.dart';
import 'package:agricultureapp/view/home/home_view.dart';
import 'package:get/get.dart';

import '../binding/binding_app.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = '/login-view';

  static final routes = [
    GetPage(
      name: '/home-view',
      page: () => const HomeView(),
      binding: BindingApp(),
    ),
    GetPage(
      name: '/login-view',
      page: () => const LoginView(),
      binding: BindingApp(),
    ),
    GetPage(
      name: '/details_nodes-view',
      page: () => DetailsNodesView(),
      binding: BindingApp(),
    ),
    GetPage(
      name: '/bottom_bar_view',
      page: () => const BottomBarView(),
      binding: BindingApp(),
    ),
  ];
}
