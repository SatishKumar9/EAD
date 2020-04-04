import 'package:flutter/material.dart';
import 'main.dart';
import 'login.dart';
import 'functions.dart';
import 'user_login.dart';

class AppDrawer extends StatefulWidget{
	@override
	_drawer createState() => _drawer();

}

class _drawer extends State<AppDrawer>{
	var user;// = localRead("user");
	var name;
	Widget show;
	get_user() {
		localRead("emp_user").then((usr) => {
			setState(() {
				user = usr;
			})
		});
		localRead("emp_name").then((nam) => {
			setState(() {
				name = nam;
			})
		});
	}

	void resolve_user() {
		if(user != null){
			show = Row(
				children: <Widget>[
					Text(
						"Hello ",
						style: TextStyle(
							fontSize: 14,
							color: Colors.white,
						),
					),
					Text(
						name,
						style: TextStyle(
							fontSize: 18,
							color: Colors.white,
						),
					),
					FlatButton(
						child: Text("Log Out"),
						onPressed: (){
							logoutEmployee();
						}
					)

				],
			);
		}
		else{
			show = FlatButton(
				child: Text("Employee Login"),
				onPressed: (){
					Navigator.push(
						context, 
						new MaterialPageRoute(builder: (context) => LoginPage())
					);
				},	
			);
		}
	}
	

	@override
	Widget build(BuildContext context){
		get_user();
		resolve_user();
		return	Drawer(
			child: Column(
				children: <Widget>[
					Container(
						height: 40.0, 
						color: Colors.blue,
					),
					SizedBox(
						child: Container(
							child: Row(
								children: <Widget>[
									Icon(
										Icons.person,
										color: Colors.white,
										size: 60.0,
									),
									SizedBox(width: 40),
									show,
								],
							),
							color: Colors.blue,
						),
						// height: 25.0,
					),
					FlatButton(
						child: Text("Home"),
						onPressed: (){
							Navigator.push(
								context, 
								new MaterialPageRoute(builder: (context) => TutorialHome())
							);
						},	
					),
					FlatButton(
						child: Text("User Login"),
						onPressed: (){
							Navigator.push(
								context, 
								new MaterialPageRoute(builder: (context) => UserLoginPage())
							);
						},	
					),
					SizedBox(height: 10.0),
				],
			),
		);
	}
}