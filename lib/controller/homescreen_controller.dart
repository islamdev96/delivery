// ignore_for_file: avoid_renaming_method_parameters

import 'package:exfai/view/screen/orders/accepted.dart';

import '../../all_export.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const Text(""),
  ];

  List bottomappbar = [
    {"title": "Pending", "icon": Icons.home},
    {"title": "Accepted", "icon": Icons.add_shopping_cart_outlined},
    {"title": "settings", "icon": Icons.settings}
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
