
// abstract class bnyenge
import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable{

  const ImagePickerEvent();
  @override
  List<Object> get props => [];
}

// instance class bnyenge , camera capture k liye
class CameraCapture extends ImagePickerEvent{}

// instance class bnyenge , gallery se image lene k liye

class GalleryImagePicker extends ImagePickerEvent{}


