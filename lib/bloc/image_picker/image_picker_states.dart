import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerStates extends Equatable {
  // image pick krenge to Xfile se se hoga , imagepicker pacakge se aaya h
  final XFile? file;

  // constructor create kiye h
  const ImagePickerStates({this.file});

  // copywith methods
  ImagePickerStates copyWith({XFile? file}) {
    return ImagePickerStates(file: file ?? this.file);
  }

  @override
  List<Object?> get props => [file];
}
