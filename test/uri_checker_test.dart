import 'package:uri_checker/uri_checker.dart' as uri_checker;
import 'package:test/test.dart';

void main() {
  test('URI Checker test | Empty Host URL | Null value return', () {
    // INPUT DATA STUB
    List<List<dynamic>> content = [
      ['Page'], ['/'], ['/basket.php'],
      ['/checkout/delivery-details'], ['/c/Wardrobes.htm'],
      ['/c/Wartrobes.htm'], ['/c/Bedroom.htm'], ['/c/Bedroooooom.htm'],
      ['/c/Corner_Sofas.htm'], ['/c/Cornel_Sofaz.htm']
    ];
    var host = '';

    // TMP TEST VARS
    var actual;
    var expected = null;

    // The call to the method under test that returns Future
    var csv = uri_checker.check(host, content);
    csv.then((result) => actual = result);

    // Test results
    expect(actual, expected);
  });

  test('URI Checker test | Empty Host URL | String return', () {
    // INPUT DATA STUB
    List<List<dynamic>> content = [
      ['Page'], ['/'], ['/basket.php'],
      ['/checkout/delivery-details'], ['/c/Wardrobes.htm'],
      ['/c/Wartrobes.htm'], ['/c/Bedroom.htm'], ['/c/Bedroooooom.htm'],
      ['/c/Corner_Sofas.htm'], ['/c/Cornel_Sofaz.htm']
    ];
    var host = '';

    // TMP TEST VARS
    var actual;
    var match = 'null';

    // The call to the method under test that returns Future
    var csv = uri_checker.check(host, content);
    csv.then((result) => actual = result);

    // Test results
    expect(actual.toString(), match);
  });

  test('URI Checker test | Empty CSV content | Null value return', () {
    // INPUT DATA STUB
    List<List<dynamic>> content = [];
    var host = 'https://stackoverflow.com';

    // TMP TEST VARS
    var actual;
    var match = null;

    // The call to the method under test that returns Future
    var csv = uri_checker.check(host, content);
    csv.then((result) => actual = result);

    // Test results
    expect(actual, match);
  });

  test('URI Checker test | Empty CSV content | String return', () {
    // INPUT DATA STUB
    List<List<dynamic>> content = [];
    var host = 'https://stackoverflow.com';

    // TMP TEST VARS
    var actual;
    var match = 'null';

    // The call to the method under test that returns Future
    var csv = uri_checker.check(host, content);
    csv.then((result) => actual = result);

    // Test results
    expect(actual.toString(), match);
  });

  test('URI Checker test | Empty Host URL and CSV content | Null value return', () {
    // INPUT DATA STUB
    List<List<dynamic>> content = [];
    var host = '';

    // TMP TEST VARS
    var actual;
    var match = null;

    // The call to the method under test that returns Future
    var csv = uri_checker.check(host, content);
    csv.then((result) => actual = result);

    // Test results
    expect(actual, match);
  });

  test('URI Checker test | Empty Host URL and CSV content | String return', () {
    // INPUT DATA STUB
    List<List<dynamic>> content = [];
    var host = 'https://stackoverflow.com';

    // TMP TEST VARS
    var actual;
    var match = 'null';

    // The call to the method under test that returns Future
    var csv = uri_checker.check(host, content);
    csv.then((result) => actual = result);

    // Test results
    expect(actual.toString(), match);
  });

  // TODO: figure out how make the test work
//  test('URI Checker test | Positive test | Filterred List in return', () {
//    // INPUT DATA STUB
//    List<List<dynamic>> content = [
//      ['Page'], ['/'], ['/doodles'], ['/boobles'],
//      ['/intl/en_uk/policies/privacy'], ['/intl/en_uk/policies/terms/regional.html'],
//      ['/intl/en_uk/ads/'], ['/intl/en_uk/abs/'], ['/intl/en_uk/about/']
//    ];
//    var host = 'http://www.google.co.uk';
//
//    // TMP TEST VARS
//    List<List<dynamic>> actual = [];
//    List<List<dynamic>> match = [
//      ['Page'], ['/'], ['/doodles'], ['/intl/en_uk/policies/privacy'],
//      ['/intl/en_uk/policies/terms/regional.html'],
//      ['/intl/en_uk/ads/'], ['/intl/en_uk/about/']
//    ];
//
//    // The call to the method under test that returns Future
//    var csv = uri_checker.check(host, content);
//    csv.then((result) => actual.addAll(result[0]));
//
//    print(actual);
//
//    // Test results
//    expect(actual, match);
//  });
}
