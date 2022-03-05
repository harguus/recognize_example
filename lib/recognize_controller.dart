import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';
import 'package:get/get.dart';

class RecognizeController extends GetxController {
  final int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  final bool _autoFocusOcr = true;
  final bool _torchOcr = false;
  final bool _multipleOcr = false;
  final bool _waitTapOcr = true;
  final bool _showTextOcr = true;
  late Size _previewOcr;
  List<OcrText> textsOcr = [];

  @override
  void onInit() {
    FlutterMobileVision.start().then((previewSizes) {
      _previewOcr = previewSizes[_cameraOcr]!.first;
      update();
    });
    super.onInit();
  }

  Future<void> read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        flash: _torchOcr,
        autoFocus: _autoFocusOcr,
        multiple: _multipleOcr,
        waitTap: _waitTapOcr,
        showText: _showTextOcr,
        preview: _previewOcr,
        camera: _cameraOcr,
        fps: 2.0,
      );
    } on Exception {
      texts.add(OcrText('Failed to recognize text.'));
    }
    textsOcr = texts;
    update();
  }
}
