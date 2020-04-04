import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

final storage = FlutterSecureStorage();


Future<String> fillMobileNumber() async {
	final String mobileNumber = await MobileNumber.mobileNumber;
	print(mobileNumber);
	return mobileNumber.toString();
}

Future<void> localWrite(String _key, String _value) async{
	await storage.write(key: _key, value: _value);
}


Future<String> localRead(String _key) async{
	String value = await storage.read(key: _key);
	// print(value);
	return value;
}

Future<void> localDelete(String _key) async{
	await storage.delete(key: _key);
}

Future<void> validateEmpLogin() async{
	String _user = await storage.read(key: "emp_user");
	String _token = await storage.read(key: "emp_token");
	// final uri = 'https://9h3f0xzrg5.execute-api.us-east-1.amazonaws.com/prod;
	// final headers = {'Content-Type': 'application/json'};
	// Map<String, dynamic> body = {
	// 	"user_name": _user,
	// 	"token": _token
	// };
	// Response response = await post(
	// 	uri,
	// 	headers: headers,
	// 	body: jsonEncode(body),
	// );
}
