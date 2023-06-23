import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileStorageManager {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> writeJsonFile(String jsonString,String fileName) async {
    try {
      final path = await _localPath;
      final file = File('$path/$fileName.txt');
      // Write the file
      return file.writeAsString(jsonString);
    } on Exception catch(e) {
      return File('');
    }
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
