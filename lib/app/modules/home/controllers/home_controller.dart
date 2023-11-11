import 'package:get/get.dart';
import 'package:time_to_tap/app/data/local_storage.dart';

class HomeController extends GetxController {
  final successCount = 0.obs;
  final isSuccess = false.obs;

  final randomNumber = 0.obs;

  @override
  Future<void> onInit() async {
    successCount.value = await LocalStorage.readSuccessCount() ?? 0;
    super.onInit();
  }

  Future<void> tapMeBtnOnTap() async {
    if (randomNumber.value == 59) {
      randomNumber.value = 0;
    }
    randomNumber.value += 1;
    final currentSeconds = DateTime.now().second;
    print('home controller ~ success count ~ ${randomNumber.value}');
    print('home controller ~ current time ~ $currentSeconds');
    if (randomNumber.value == currentSeconds) {
      isSuccess.value = true;
      successCount.value += 1;
      await LocalStorage.saveSuccessCount(successCount.value);
    } else {
      isSuccess.value = false;
    }
  }
}
