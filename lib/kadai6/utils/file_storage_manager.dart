import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileStorageManager {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } on Exception catch(e) {
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }

  Future<File> get _localJsonFile async {
    final path = await _localPath;
    return File('$path/jsonFile.txt');
  }

  Future<File> writeJsonFile(String jsonString,String fileName) async {
    final path = await _localPath;
    final file = File('$path/$fileName.txt');

    // Write the file
    return file.writeAsString(jsonString);
  }

  Future<String> readJsonFile(String fileName) async {
    try {
      final path = await _localPath;
      final file = File('$path/$fileName.txt');
      // Read the file
      final contents = await file.readAsString();
      return contents;
    } on Exception catch(e) {
      return '';
    }
  }

  Future<Object> deleteJsonFile(String fileName) async {
    try {
      final path = await _localPath;
      final file = File('$path/$fileName.txt');
      // delete the file
      final contents = await file.delete();
      return contents;
    } on Exception catch (e) {
      return e;
    }
  }

  Future<String> readFile(String fileName) async {
    try {
      final path = await _localPath;
      final file = File('$path/$fileName.txt');

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } on Exception catch(e) {
      return '';
    }
  }
}
