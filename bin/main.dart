import 'dart:io';
import 'package:uri_checker/uri_checker.dart' as uri_checker;
import 'package:uri_checker/csv_processor.dart' as csv_processor;

main(List<String> arguments) {

  String host, input_file, output_file = '';
  bool host_pass, input_pass, output_pass = false;

  if (arguments.length > 0) {
    // Parsing the arguments
    for (String arg in arguments) {
      if (arg.startsWith('-h=')) {
        host = arg.substring(3);
      }
      else if (arg.startsWith('-i=')) {
        input_file = arg.substring(3);
      }
      else if (arg.startsWith('-o=')) {
        output_file = arg.substring(3);
      }
      else if (arg.startsWith('--help')) {
        help();
      }
      else {
        help();
      }
    }

    // Checking arguments consistency (HOST)
    if (host == '' || !host.contains(new RegExp(r'^(http|https)://*.*\b')) ||
        host.endsWith('/')) {
      throw new Exception(
          'Host is not specified or has wrong format: [$host]. Format \"http://www.domain.something\". No ending forward slash (\"/\").');
    }
    else {
      host_pass = true;
    }

    // Checking arguments consistency (INPUT FILE)
    if (input_file == '' || !input_file.contains(new RegExp(r'.*/*.(csv)'))) {
      throw new Exception(
          'Source file name is not specified or not a CSV file: [$input_file].');
    }
    else {
      input_pass = true;
    }

    // Checking arguments consistency (OUTPUT FILE)
    if (output_file == '' || !output_file.contains(new RegExp(r'.*/*.(csv)'))
        && !output_file.contains(new RegExp(r'^.*/*'))) {
      throw new Exception(
          'Output is neither a CSV file name or a dirctory, or is not specified all: [$output_file].');
    }
    else {
      output_pass = true;
    }

    // CSV parsing and URIs verifications
    if (host_pass && input_pass && output_pass) {
      // Parse given CSV into $content
      var content = csv_processor.load(input_file);

      // Verify all URIs provided with $content against $host
      // and return results into $csv for further processing
      var csv = uri_checker.check(host, content);
      // Since check() method is Future CSV dump() will be processed
      // when $csv gets its value at some point in the the future
      csv.then((result) => csv_processor.dump(output_file, result));
    }
    else {
      help();
    }
  }
  else {
    help();
  }
}

// Provides help on --help argument call or
// when something is wrong with other arguments
void help(){
  print("###############\n"
      "URI Checker Help\n"
  "The application goes through a CSV file provided with URIs to check whether they are accessible (200) and creates\ "
  "a new CSV file that does not contain any unaccessible URIs (404).\n"
  "Parameters allowed:\n"
  "\t -h      - defines HOST to check the URIs against. \n"
        "\t [-h=http://domain.com]\n"
      "\n"
  "\t -i      - defines PATH to input CSV file with URIs to check.\n"
        "\t [-i=path/to/csv/file.csv]\n"
      "\n"
  "\t -o      - defines output DIRECTORY or CSV FILE to write the results into.\n "
        "\t [-o=path/to/dir/] or [-o=path/to/new/csv_file.csv]\n"
      "\n"
  "\t --help  - this help\n"
  "\n"
  "Full comman line call would look like: \$ dart bin/main.dart -h=http://domain.com -i=path/to/csv/file.csv -o=path/to/new/csv_file.csv \n"
  "###############");
  exit(2);
}