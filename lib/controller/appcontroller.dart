import 'dart:developer';

import 'package:get/get.dart';
import 'package:getxflutterapicall/model/postmodel.dart';
import 'package:getxflutterapicall/services/services.dart';

class AppController extends GetxController {
  var getposts = List<Postmodel>().obs;
  Services services = Services();
  var postloading = true.obs;

  @override
  void onInit() {
    callpostmethod();
    super.onInit();
  }

  callpostmethod() async {
    try {
      postloading.value = true;
      var result = await services.getallposts();
      if (result != null) {
        getposts.assignAll(result);
      } else {
        print("null");
      }
    } finally {
      postloading.value = false;
    }
    update();
  }
}
