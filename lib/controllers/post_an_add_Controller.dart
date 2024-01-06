// Define GetX controller for managing state
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostAnAddController extends GetxController {
  final RxList<String> images = <String>[].obs;

  void addImage(String imagePath) {
    images.add(imagePath);
  }

  void removeImage(int index) {
    images.removeAt(index);
  }

  Future<void> uploadImages() async {
    List<XFile>? pickedImages = await ImagePicker().pickMultiImage();
    if (pickedImages != null) {
      for (var pickedImage in pickedImages) {
        addImage(pickedImage.path);
      }
    }
  }
}
