import 'package:get/get.dart';

class UserDataController extends GetxController {
  var loggedInUserId = 0.obs;

  void setLoggedInUser(int userId) {
    loggedInUserId.value = userId;
  }

  int getLoggedInUser() {
    return loggedInUserId.value;
  }

}
