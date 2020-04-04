import 'package:flutter/material.dart';
import 'functions.dart';
import 'drawer.dart';

void main() => runApp(App());

class App extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'WellBE',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: TutorialHome()
			);
	}
}

// class _appBar extends StatelessWidget(){
// 	Widget build(BuildContext context) {
// 		return Scaffold(

// 		)
// 	}
// }

class TutorialHome extends StatelessWidget {

	// final mobile_no = fillMobileNumber();
	// var mobile_no = fillMobileNumber();
	// var a = trylocalwrite();
	String user;
	var b = localRead("try");

	@override
	Widget build(BuildContext context) {

		return Scaffold(
			appBar: AppBar(
				title: Text("WellBE"),
			),
			drawer: AppDrawer(),
			body: Center(
			child: Text("Hello "),
			),
			floatingActionButton: FloatingActionButton(
			tooltip: 'Add', // used by assistive technologies
			child: Icon(Icons.add),
			onPressed: (){
			},
			),
		);
	}
}

