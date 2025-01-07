
import 'package:flutter/material.dart';
import 'package:to_do_list_app/home_page.dart';

void main(){

runApp(const MyApp());

}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'ToDo list',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}