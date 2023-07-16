import 'package:exfai/controller/homescreen_controller.dart';

import '../../all_export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              title: const Text("Orders"),
            ),
            //drawer: Drawer(),
            bottomNavigationBar: const CustomBottomAppBarHome(),
            body: WillPopScope(
              child: controller.listPage.elementAt(controller.currentpage),
              onWillPop: () async => false,
            )));
  }
}
