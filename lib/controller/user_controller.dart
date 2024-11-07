
import 'package:get/get.dart';
import 'package:learn_getx/models/user_model.dart';


class UserController extends GetxController {
  RxList<UserModel> listUser = <UserModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  void addUser (String name, String image, String age, String job) async {
    listUser.add(UserModel(name: name, image: image, age: age, job: job));
  }

  void deleteUser (int index) {
    listUser.removeAt(index);
  }
}