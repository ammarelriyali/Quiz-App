import 'package:flutter/cupertino.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key,required this.switchScreen});
  final void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    return Text("data") ;
  }

}