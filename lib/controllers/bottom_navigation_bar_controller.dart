import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  RxInt tabIndex = 0.obs;
  RxBool reverse = false.obs;

  void changeTabIndex(int index) {
    if (index < tabIndex.value) {
      reverse.value = true;
    } else {
      reverse.value = false;
    }

    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
