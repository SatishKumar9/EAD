import 'package:flutter/material.dart';
import 'functions.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'drawer.dart';

class LoginPage extends StatefulWidget {
	@override
	_LoginPageState createState() => _LoginPageState();
}

Future<void> logoutEmployee() async {
	String _user = await storage.read(key: "emp_user");
	String _token = await storage.read(key: "emp_token");
	print(_user);
	print(_token);
	// final uri = 'https://48ekbg86b8.execute-api.us-east-1.amazonaws.com/prod';
	// final headers = {'Content-Type': 'application/json'};
	// Map<String, dynamic> body = {
	// 	"user_name": _username,
	// 	"token": _token
	// };
	// Response response = await post(
	// 	uri,
	// 	headers: headers,
	// 	body: jsonEncode(body),
	// );

	localDelete("emp_user");
	localDelete("emp_name");
	localDelete("emp_token");
}


Future<void> _LoginEmployee(String _username, String _passwsord) async {

	// final uri = 'https://fx2bhh6m4g.execute-api.us-east-1.amazonaws.com/prod';
	// final headers = {'Content-Type': 'application/json'};
	// Map<String, dynamic> body = {
	// 	"user_name": _username,
	// 	"password": _password
	// };
	// Response response = await post(
	// 	uri,
	// 	headers: headers,
	// 	body: jsonEncode(body),
	// );

	// var resp = jsonDecode(response.body);
	// int statusCode = resp["statusCode"];
	// int responseBody = resp["status"];
	int responseBody = 1;
	if(responseBody == 1){
		// String token = resp["token"];
		String _name = _username;
		print("login successful");
		String _token = "WeLc4qHz3xZtoHggl_P9zzM7cv6osGk2cTrjz3gUTrU";
		localWrite("emp_name", _name);
		localWrite("emp_user", _username);
		localWrite("emp_token", _token);
	}
	// print(statusCode);
	// print(responseBody);
}

class _LoginPageState extends State<LoginPage> {
	// bool _obscureText = true;

	// void togglePassword(){
	// 	setState(() {
	// 	  _obscureText = !_obscureText;
	// 	});
	// }

	String user_name = "";
	String password = "";
	TextEditingController _userNameChannge = TextEditingController();
	TextEditingController _passWordChannge = TextEditingController();

	void _submit(){
		setState(() {
			user_name = _userNameChannge.text;
			password = _passWordChannge.text;
		});
	}

	@override 
	Widget build(BuildContext context){
		return Scaffold(
			appBar: AppBar(
				title: Text("WellBE"),
			),
			drawer: AppDrawer(),
			body: SafeArea(
				child: ListView(
					padding: EdgeInsets.symmetric(horizontal: 24.0),
					children: <Widget>[
						SizedBox(height: 80.0),
						Column(
							children: <Widget>[
								Image.asset("assets/images/logo.png", height: 120.0, width: 180.0,),
								SizedBox(height: 20.0),
							],
						),
						SizedBox(height: 40.0),
						Text("Login"),
						SizedBox(height: 40.0),
						TextFormField(
							controller: _userNameChannge,
							validator: (value){
								if (value.isEmpty){
									return "Empty user name";
								}
								return null;
							},
							decoration: InputDecoration(
								border: InputBorder.none,
								labelText: "User Name",
								filled: true,
							),
						),
						SizedBox(height: 12.0),
						TextFormField(
							controller: _passWordChannge,
							validator: (value){
								if (value.isEmpty){
									return "Empty password";
								}
								return null;
							},
							decoration: InputDecoration(
								border: InputBorder.none,
								labelText: "Password",
								filled: true,
							),
							obscureText: true,
						),
						ButtonBar(
							children: <Widget>[
								RaisedButton(
									child: Text("Login"),
									onPressed: () {
										setState(() {
											user_name = _userNameChannge.text;
											password = _passWordChannge.text;
										});
										_LoginEmployee(user_name, password);
									},
								)
							],
						)
					],
				),
			),
		);
	}
}