import 'package:get/get.dart';

import 'package:s_seer_final/network_controller.dart';

class DependencyInjection {
  
  static void init() {
    Get.put<NetworkController>(NetworkController(),permanent:true);
  }
}