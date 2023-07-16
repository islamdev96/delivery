import '../all_export.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Start
    Get.put(Crud());
  }
}
