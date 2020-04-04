import 'dart:convert';
import 'package:flutter/material.dart';
import 'functions.dart';
import 'package:http/http.dart';
import 'main.dart';
import 'drawer.dart';

class UserLoginPage extends StatefulWidget {
	@override
	_UserLoginPageState createState() => _UserLoginPageState();
}

Future<void> logoutUser() async {
	String _user = await storage.read(key: "user");
	String _token = await storage.read(key: "token");
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

	localDelete("user");
	localDelete("name");
	localDelete("token");
}

Future<void> sendOtpUser(String phone_no) async {
	// final uri = 'https://bkd5t1qp5f.execute-api.us-east-1.amazonaws.com/prod';
	// final headers = {'Content-Type': 'application/json'};
	// Map<String, dynamic> body = {
	// 	"phone_no": phone_no,
	// };
	// Response response = await post(
	// 	uri,
	// 	headers: headers,
	// 	body: jsonEncode(body),
	// );

}


Future<int> _VerifyOtp(String _phone_no, String _otp) async {

	// final uri = 'https://6ijpjhiff8.execute-api.us-east-1.amazonaws.com/prod';
	// final headers = {'Content-Type': 'application/json'};
	// Map<String, dynamic> body = {
	// 	"phone_no": _phone_no,
	// 	"otp": _otp
	// };
	// Response response = await post(
	// 	uri,
	// 	headers: headers,
	// 	body: jsonEncode(body),
	// );

	// var resp = jsonDecode(response.body);
	// // int statusCode = resp["statusCode"];
	// int responseBody = resp["result"];
	// print(responseBody);
	int responseBody = 1;
	if(responseBody == 1){
		// String token = resp["token"];
		String _name = "Raja";
		print("login successful");
		String _token = "WeLc4qHz3xZtoHggl_P9zzM7cv6osGk2cTrjz3gUTrU";
		localWrite("name", _name);
		localWrite("phone_no", _phone_no);
		localWrite("token", _token);
	}
	// print(resp);
	return responseBody;
}

class _UserLoginPageState extends State<UserLoginPage> {

	String phone_no = "";
	String otp = "";
	int otp_status;
	bool error = false;
	String error_msg = "";
	TextEditingController _phoneNoChannge = TextEditingController();
	TextEditingController _otpChannge = TextEditingController();
	bool en_otp = false;

	void _submit(){
		setState(() {
			phone_no = _phoneNoChannge.text;
			otp = _otpChannge.text;
		});
	}

	get_status_otp(){
		_VerifyOtp(phone_no, otp).then((value) => {
			setState(() {
				otp_status = value;
			})
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
						error ? 
							SizedBox(
								height: 40.0,
								child: Text(error_msg)
							) : 
							SizedBox(height: 1.0),
						TextFormField(
							controller: _phoneNoChannge,
							validator: (value){
								if (value.isEmpty){
									return "Empty Phone Number";
								}
								return null;
							},
							decoration: InputDecoration(
								border: InputBorder.none,
								labelText: "Phone Number",
								filled: true,
							),
						),
						SizedBox(height: 12.0),
						RaisedButton(
							child: Text("Send OTP"),
							padding: EdgeInsets.symmetric(
								horizontal: 8.0,
								vertical: 5.0
							),
							color: Colors.blue,
							colorBrightness: Brightness.dark,
							highlightColor: Colors.blueGrey,
							onPressed: (){
								phone_no = _phoneNoChannge.text;
								sendOtpUser(phone_no);
								setState(() {
									en_otp = true;
								});
							}
						),
						en_otp ? 
							TextFormField(
								controller: _otpChannge,
								validator: (value){
									if (value.isEmpty){
										return "Empty password";
									}
									return null;
								},
								decoration: InputDecoration(
									border: InputBorder.none,
									labelText: "OTP",
									filled: true,
								),
								obscureText: true,
							) : 
							TextFormField(
								enabled: en_otp,
								controller: _otpChannge,
								validator: (value){
									if (value.isEmpty){
										return "Empty password";
									}
									return null;
								},
								decoration: InputDecoration(
									border: InputBorder.none,
									labelText: "OTP",
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
											otp = _otpChannge.text;
										});
										get_status_otp();
										if(otp_status == -1){

										}
										else if(otp_status == 0){
											error = true;
											error_msg = "Incorrect OTP";
										}
										else if(otp_status == 1){
											Navigator.push(
												context, 
												new MaterialPageRoute(builder: (context) => TutorialHome())
											);
										}
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