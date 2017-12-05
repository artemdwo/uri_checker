import 'package:uri_checker/csv_processor.dart' as csv_processor;
import 'package:test/test.dart';
import 'dart:io';

const test_csv_path_read = "test/.src/input.csv";
const test_csv_path_write = "test/.src/ref_input.csv";

void main() {
  test('CSV Processor - load existing CSV file', () {
    var match = "[[Page], [/], [/doodles], [/intl/en_uk/policies/privacy], [/intl/en_uk/policies/terms/regional.html], [/intl/en_uk/ads/], [/intl/en_uk/about/]]";
    expect(csv_processor.load(test_csv_path_read).toString(), match);
  });

  test('CSV Processor - load - no path - Null value return', () {
    var match = null;
    expect(csv_processor.load(''), match);
  });

  test('CSV Processor - load - no path - String return', () {
    var match = 'null';
    expect(csv_processor.load('').toString(), match);
  });

  test('CSV Processor - dump - no path - NULL value return', () {
    var match = false;
    expect(csv_processor.dump(''), match);
  });

  test('CSV Processor - dump - empty List - Bool return', () {
    var match = false;
    expect(csv_processor.dump(test_csv_path_write, new List.filled(0, [])), match);
  });

  test('CSV Processor - dump - with List content - Bool return', () {
    var match = true;
    var content = new List.filled(3, []);
    content[0].add('STUB');
    expect(csv_processor.dump(test_csv_path_write, content), match);
  });

  tearDown(() {
    if (new File(test_csv_path_write).existsSync()){
      new File(test_csv_path_write).deleteSync();
    }
  });
}
