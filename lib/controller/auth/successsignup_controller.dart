import '../../all_export.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
