import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Color bgcolor;

List getdetails()
  {
    var dt = DateTime.now();
    

    Color c1,c2,c3,c4;
    if(dt.hour >=17 && dt.hour < 19)
        { 
          
          c1 = Color(0xFF185ADB);
          c2 = Color(0xFFCD113B);
          c3 = Color(0xFFFF7600);
          c4 = Color(0xFFFFA900);
          bgcolor = Colors.cyan[700];
          
        }
    
    else if(dt.hour >= 19 || dt.hour < 6)
        { 
          c1 = Color(0xFF232323);
          c2 = Color(0xFF2940D3);
          c3 = Color(0xFF39A9CB);
          c4 = Color(0xFFCAE8D5);
          bgcolor = Color(0xFF0A1931);
          
        }
    else if((dt.hour == 6)||(dt.hour == 7))
    {
      
      c1 = Color(0xFF185ADB);
      c2 = Color(0xFFF98404);
      c3 = Color(0xFFF9B208);
      c4 = Color(0xFFF7FD04);
      bgcolor = Colors.deepOrange[500];
      
    }
    
    else if(dt.hour >= 12 && dt.hour <= 16)
        { 
          c1 = Color(0xFF185ADB);
          c2 = Color(0xFF96BAFF);
          c3 = Color(0xFF1EAE98);
          c4 = Color(0xFFC68B59);
          bgcolor = Colors.lightBlue[300];
         
        }
    
    else
          { 
          c1 = Color(0xFF206A5D);
          c2 = Color(0xFF81B214);
          c3 = Color(0xFFFFCC29);
          c4 = Color(0xFF865439);
          bgcolor = Colors.blue[200];
          
        }
    

    return [c1,c2,c3,c4];
  }








class Waiting extends StatelessWidget {
  const Waiting({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70.0,left: 80.0),
            child: Text(
              'Weather NOW',
              style: TextStyle(
                
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            ),

            ),
          ),
          
          Padding(
            padding: EdgeInsets.only(top:250,left: 90),
            
            child: SpinKitCubeGrid(
                color: Colors.white,
                size: 70.0,
                
              ),
          ),
        ],
      ),
    );
      
    
  }
}

