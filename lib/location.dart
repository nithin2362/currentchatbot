import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:recentweather/codes.dart';
import 'main.dart';
import 'wait.dart';


class Coordinate
{
  var l1;
  Coordinate(var l)
  {
    this.l1 = l;
  }
  int getdegrees()
  {
    return l1.toInt();
  }
  int getminutes()
  {
    var temp = l1 - l1.toInt();
    temp = temp * 60;
    return temp.toInt();
  }
  double getseconds()
  {
    var v1 = (l1 - l1.toInt()) * 60;
    v1 = v1 - v1.toInt();
    return v1 * 60;
  }


}




class Location extends StatelessWidget {
  const Location({ Key key }) : super(key: key);

  List getCoordinates()
  {
    var latdir = lat < 0 ? 'S':'N';
    var lngdir = lng < 0 ? 'W':'E';
    // final latdeg = lat.toInt();
    // final lngdeg = lng.toInt();
    // lat = lat - latdeg;
    // lng = lng - lngdeg;
    // var latmin = (lat * 60).toInt();
    // var latsec = (latmin - latmin.toInt())*60;
    // var lngmin = (lng * 60).toInt();
    // var lngsec = (lngmin - lngmin.toInt())*60;
    // print(lngdeg);

    var latitude = Coordinate(lat);
    var longitude = Coordinate(lng);
    var latdeg = latitude.getdegrees();
    var latmin = latitude.getminutes();
    var latsec = latitude.getseconds();
    var lngdeg = longitude.getdegrees();
    var lngmin = longitude.getminutes();
    var lngsec = longitude.getseconds();
    return [latdeg.toString() +'°' + latmin.toString() + '\'' + latsec.toStringAsPrecision(4) + '\'\'' + latdir,lngdeg.toString() +'°' + lngmin.toString() + '\'' + lngsec.toStringAsPrecision(4) + '\'\'' + lngdir];

  }

  final font = 'Noticia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
Container(

    decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end:
                  Alignment(2.0, 0.0),
              colors: <Color>[
                getdetails()[0],getdetails()[1],getdetails()[2],getdetails()[3],
              ],
              
            ),
          ),
        ),

        Column(
          
          children: [
            
          Padding(
            padding: EdgeInsets.only(top: 50,left: 20,bottom: 50),
          child: Text(
          'Location Info',
          style: TextStyle(fontFamily: font,color: Colors.white,fontSize: 40),
          
          ),
          ),
          

        
        ListTile(
            title: Text(
                'Location Type',
                  style: TextStyle(
                    
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: font,
                  
                  
                  
                  )

              ),
          subtitle: Text(
                type.toString().toUpperCase(),
                  style: TextStyle(
                    
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: font,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  
                  )

              ),
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/type.png'),
          ),
          ),
        
          ListTile(
              title: Text(
                'Coordinates',
                  style: TextStyle(
                    
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: font,
                  
                  
                  
                  ),

              ),
            
            subtitle: Text(
                getCoordinates()[0] + ', ' + getCoordinates()[1],
                  style: TextStyle(
                    
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: font,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  
                  
                  ),

              ),
            leading: CircleAvatar(
            backgroundImage: AssetImage('assets/coordinates.png'),
          ),
            
            ),
          
          ListTile(
              title: Text(
                type.toString() + ' Name',
                  style: TextStyle(
                    
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: font,
                  
                  
                  
                  ),

              ),
            subtitle: Text(
                city.toString().toUpperCase(),
                  style: TextStyle(
                    
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: font,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  
                  
                  ),

              ) ,
            leading: CircleAvatar(
            backgroundImage: AssetImage('assets/city.jpg'),
              ),
            ),
         
          ListTile(
              title: Text(
                'Area',
                  style: TextStyle(
                    
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: font,
                  
                  
                  
                  ),

              ),
            
            subtitle: Text(
                state.toString().toUpperCase(),
                  style: TextStyle(
                    
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: font,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  
                  
                  ),

              ) ,
            leading: CircleAvatar(
            backgroundImage: AssetImage('assets/state.png'),
          ),
            ),
          
          ListTile(
              title: Text(
                'Country',
                  style: TextStyle(
                    
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: font,
                  
                  
                  
                  ),

              ),
            
            subtitle: Text(
                country.toString().toUpperCase(),
                  style: TextStyle(
                    
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: font,
                  
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  
                  ),

              ),
            leading: CircleAvatar(
            backgroundImage: AssetImage('assets/country.jpg'),
          ),
            ),
          
          ListTile(
              title: Text(
                'Region',
                  style: TextStyle(
                    
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: font,
                  
                  
                  
                  ),

              ),
            subtitle: Text(
                region.toString().toUpperCase(),
                  style: TextStyle(
                    
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: font,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  
                  
                  ),

              ),
            leading: CircleAvatar(
            backgroundImage: AssetImage('assets/region.jpg'),
          ),
            
            ),
          
          Padding(
            padding: EdgeInsets.only(left: 230),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              
              child: Text(
                    
                    'Back',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: font,
                    ),
                  ),
            ),
          )
          
          
          
          ]

        ),
      ],
    ),


    );
    
    
    
    
    
  }
}




