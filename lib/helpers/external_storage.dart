import 'dart:io';
import 'package:mind_peace/examples/dataset.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> initAudioFolder() async {
  final dir = await getExternalStorageDirectory();
  final audioDir = Directory("${dir!.path}/audios");

  if (!await audioDir.exists()) {
    await audioDir.create(recursive: true);
  }

  return audioDir.path;
}

Future<void> copyAssetToLocal(String assetPath, String targetPath) async {
  final data = await rootBundle.load(assetPath);
  final bytes = data.buffer.asUint8List();

  final file = File(targetPath);
  if (!await file.exists()) {
    await file.writeAsBytes(bytes);
  }
}

Future<void> prepareAudioFiles() async {
  final audioFolder = await initAudioFolder();
  // final assetName = "89b46b59-e650-45ff-a986-4c5d3ec831b9.ogg";
  for (var assetName in examples) {
    await copyAssetToLocal(
      "assets/audios/${assetName["audioPath"]}",
      "$audioFolder/${assetName["audioPath"]}",
    );
  }
}
