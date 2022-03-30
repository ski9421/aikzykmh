import 'package:intl/intl.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

Future<dynamic> getToken(dynamic content) async {
  var dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  String formattedDate = dateFormat.format(content);
  String _time = formattedDate + ".00000";

  var _strtimes = DateTime.parse(_time);
  var _intendtime = _strtimes.millisecondsSinceEpoch;

  String a = _intendtime.toString();
  String b = a.substring(0, 10);
  String c = md5.convert(utf8.encode('appkey123' + b)).toString();

  return c;
}

Future<dynamic> getTime(dynamic content) async {
  var dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  String formattedDate = dateFormat.format(content);
  String _time = formattedDate + ".00000";

  var _strtimes = DateTime.parse(_time);
  var _intendtime = _strtimes.millisecondsSinceEpoch;

  String a = _intendtime.toString();
  String b = a.substring(0, 10);

  return b;
}
