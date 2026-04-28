import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {

  final ImagePicker _picker = ImagePicker();

  // camera se pic lene k liye
  Future<XFile?> cameraCapture() async {
final XFile? file = await _picker.pickImage(source: ImageSource.camera);
return file;

  }
  // gallery se pick krne k liye
  Future<XFile?> pickImageFromGallery() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file;

  }
}