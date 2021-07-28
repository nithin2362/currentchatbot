import 'wait.dart';
import 'package:flutter/material.dart';


class ColorScreen extends StatefulWidget {
  const ColorScreen({Key key }) : super(key: key);

  @override
  _ColorScreenState createState() => _ColorScreenState();
}
Color c1,c2,c3,c4;
var clrs;
void initState()
{
  clrs = getdetails();
  c1 = clrs[0];
  c2 = clrs[1];
  c3 = clrs[2];
  c4 = clrs[3];
  
}






class _ColorScreenState extends State<ColorScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}