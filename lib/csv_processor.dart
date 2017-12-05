import 'package:csv/csv.dart';
import 'dart:io';

List< List< dynamic>> load([String path = '']){
  if (path != '') {
    var content = new File(path).readAsStringSync();
    return new CsvToListConverter().convert(content);
  }
  return null;
}

bool dump([String path = '', List<List<dynamic>> content]){
  if (path != '' && content.length > 0) {
    var file = new File(path);
    try {
      file.writeAsStringSync(new ListToCsvConverter().convert(content));
    } catch (e) {
      throw new Exception("Something went wrong: $e");
    }
    return true;
  }
  return false;
}
