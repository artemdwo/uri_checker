import 'dart:async';
import 'package:http/http.dart' as http;

Future check([String url = '', List<List<dynamic>> content]) async{

  if (url != '' && content.length > 0) {

    List<List> result = [[]];

    // Copy over the header ONCE
    if (!content[0][0].toString().startsWith('/')) {
      result[0].add(new List(1));
      result[0] = [content[0][0].toString()];
      content.removeAt(0);
    }

    // Check the rest of URIs
    var res = send_get(url, content);
    await(res.then((value) => result.addAll(value[0])));

    return result;
  }
  return null;
}

Future send_get([String url = '',  List<List<dynamic>> content]) async{
  if (url != '' && content.length > 0) {

    List<List> result = [[]];
    var rc200 = 0;
    var rc404 = 0;

    for (List x in content) {

      if (x[0].toString().startsWith('/') && !x[0].toString().contains(r'[')
          || !x[0].toString().contains(r']')) {
        String check_url = url + x[0].toString();
        await(http.get(check_url).then((response) {
          if (response.statusCode == 200){
            result[0].add(new List(1));
            result[0][rc200] = [x[0].toString()];
            rc200++;
          } else if (response.statusCode == 404) {
            rc404++;
          }

        }));
      }
      // Print progress
      print(result[0].length);
    }
    print("Checker results:");
    print("\t 200 response count: $rc200");
    print("\t 404 response count: $rc404");

    return result;
  }
  return null;
}