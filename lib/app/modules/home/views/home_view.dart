import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Time to Tap'),
          centerTitle: true,
        ),
        body: _mainChild(context: context));
  }

  Widget _mainChild({required BuildContext context}) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _widget1(context: context),
            const SizedBox(
              height: 10,
            ),
            _widget2N3(context: context)
          ],
        ),
      );

  Widget _widget1({required BuildContext context}) => Container(
        height: Get.size.height / 2,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.black12),
            color: const Color.fromARGB(149, 247, 246, 245)),
        child: Obx(
          () => Text(
            controller.isSuccess.isTrue
                ? 'Success! Total Success Count: ${controller.successCount.value}'
                : controller.successCount.value == 0
                    ? 'Please Press Tap Me'
                    : 'Try Again!',
            textAlign: TextAlign.center,
          ),
        ),
      );

  Widget _widget2N3({required BuildContext context}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => controller.tapMeBtnOnTap(),
              child: Container(
                height: Get.size.height / 4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: Colors.black12),
                    color: const Color.fromARGB(149, 247, 246, 245)),
                child: const Text('Tap Me'),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Obx(
              () => Container(
                height: Get.size.height / 4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: Colors.black12),
                    color: const Color.fromARGB(149, 247, 246, 245)),
                child: Text('Current Number: ${controller.randomNumber.value}'),
              ),
            ),
          )
        ],
      );
}
