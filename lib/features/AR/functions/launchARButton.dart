import 'package:flutter/cupertino.dart';
import 'package:native_ar_viewer/native_ar_viewer.dart';
import 'dart:io' as io;
import '../../../core/utils/functions/handleMessages.dart';

final model = io.Platform.isAndroid;
String documentDirectoryPath = "";

launchARButton(BuildContext context, {required dynamic arUrl}) async {
  try {
    if (model) {
      await NativeArViewer.launchAR(arUrl);
    } else if (io.Platform.isIOS) {
      await NativeArViewer.launchAR("$documentDirectoryPath/Astronaut.usdz");
    } else {
      handleUnsupportedFeature(
          context, 'This feature is not supported on your device.');
    }
  } catch (e) {
    throw Exception('Error launching AR: $e');
  }
}
