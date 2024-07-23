import 'package:native_ar_viewer/native_ar_viewer.dart';
import 'dart:io' as io;

final model = io.Platform.isAndroid;
String documentDirectoryPath = "";

launchARButton({required dynamic arUrl}) async {
  try {
    if (model) {
      await NativeArViewer.launchAR(arUrl);
    } else if (io.Platform.isIOS) {
      await NativeArViewer.launchAR("$documentDirectoryPath/Astronaut.usdz");
    } else {
      print('not supported');
    }
  } catch (e) {
    print("Error launching AR: $e");
  }
}
