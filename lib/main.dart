import 'package:flutter/material.dart';
import 'package:recentweather/location.dart';
import 'package:recentweather/time.dart';
import 'codes.dart';
import 'wait.dart';
import 'time.dart';

Color c1,c2,c3,c4;
var temp,temp_min,temp_max;
var city,country,region,state,lat,lng,type,weather_text,humidity,windspeed,vis,pressure,description;




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var fetched_data,textclr,clrs;
  

  
  





  @override
  void initState()
  {
    // TODO: implement initState

    
    
    textclr = Colors.white;
    clrs = getdetails();
    c1 = clrs[0];
    c2 = clrs[1];
    c3 = clrs[2];
    c4 = clrs[3];
    
    super.initState();
  }


  
  String getdate()
  {
      
      DateTime date = DateTime.now();
      
      var days = {1:'Mon',2:'Tue',3:'Wed',4:'Thur',5:'Fri',6:'Sat',7:'Sun'};
      var month = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'Jun',
    7: 'Jul',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec'
  };
      return days[date.weekday].toUpperCase() + ' | ' + month[date.month].toUpperCase() + ' ' + date.day.toString() + ', ' + date.year.toString();

  }
  String getdesc()
  {
    String val = description[0].toString().toUpperCase() + description.toString().substring(1);;
    if(description.toString().toLowerCase() == weather_text.toString().toLowerCase())
      val = 'Mild ' + val;
    return val;
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
      return Scaffold(
        // backgroundColor: Color(0xFF0A1931),
        body: FutureBuilder(
                future: fetchjson(),
                builder:(context,snapshot)
                {
                 if(snapshot.connectionState == ConnectionState.done)
                 {
                   fetched_data = snapshot.data;
                   var location = fetched_data[0];
                   var temperature = fetched_data[1];
                   humidity = temperature["main"]["humidity"].toString() + '%';
                   windspeed = temperature["wind"]["speed"].toString() + ' m/s';
                   pressure = temperature["main"]["pressure"].toString() + ' hPa';
                   type = location['Type'];
                   lat = temperature['coord']['lat'];
                   lng = temperature['coord']['lon'];
                   city = location["EnglishName"];
                   country = location["Country"]["EnglishName"];
                   temp = temperature["main"]["feels_like"] - 273.15;
                   state = location["AdministrativeArea"]['EnglishName'];
                   region = location["Region"]["EnglishName"];
                   weather_text = temperature["weather"][0]["main"];
                   description = temperature["weather"][0]["description"];
                   vis = (temperature["visibility"] / 1000).toString() + 'km';
                   var iconimg = temperature["weather"][0]["icon"];
                   var iconlink = "https://openweathermap.org/img/wn/${iconimg}@2x.png";
                   

                   
                   return Stack(
                     children:
                     [




                       Container(

                         decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end:
                                        Alignment(2.0, 0.0), // 10% of the width, so there are ten blinds.
                                    colors: <Color>[
                                      c1,c2,c3,c4
                                    ],
                                    
                                  ),
                                ),
                              ),
                     
                    
                     
                     
                     Column(
                                    
                        children: [
                                      
                                       Padding(
                                         padding: EdgeInsets.only(top:50,left: 20),
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                           children: [
                                             TimeInHourAndMinute(),
                                             Text(
                                          getdate(),
                                          style: TextStyle(

                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Dosis',
                                            color: textclr,
                                          ),
                                          
                                        ),
                                           ],
                                         ),
                                       ),
                                      Padding(
                                          padding:EdgeInsets.only(top:50,left:70),
                                          child: TextButton(
                                            
                                            
                                            onPressed: () {
                                             Navigator.push(context,MaterialPageRoute(builder: (context) => Location()));
                                            },
                                            
                                            child: ListTile(
                                                leading: Icon(Icons.location_on,size:35,color: textclr),
                                                
                                                title: Text(
                                                      city.toString().toUpperCase(),
                                                      style: TextStyle(
                                                        fontSize: 30,
                                                        color: textclr,
                                                        fontFamily: 'Noticia',
                                                      ),
                                                    ),
                                                subtitle: Text(
                                                      state.toString().toUpperCase(),
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        color: textclr,
                                                        fontFamily: 'Noticia',
                                                      ),
                                                    ),
                                              ),
                                            ),
                                          ),
                                      
                                      
                                      Padding(
                                        padding: EdgeInsets.only(top:20.0,bottom: 30.0),
                                        
                                        child:Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: 
                                          [
                                        

                                        Center(
                                          child: Image(
                                            image: NetworkImage(iconlink),
                                          ),
                                        ),
                                        Text(
                                              weather_text.toString(),
                                              style: TextStyle(
                                                fontSize: 30,
                                                color: textclr,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Noticia',
                                              ),
                                            ),
                                            Text(
                                              getdesc(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: textclr,
                                                // fontWeight: FontWeight.bold,
                                                fontFamily: 'Noticia',
                                                )
                                                ),
                                            ]
                                            ),
                                          ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(50, 30, 50, 10),
                                          child: ListTile(

                                              leading: CircleAvatar(
                                                backgroundImage: AssetImage('assets/thermo.png'),
                                              ),
                                              title: Text(temp.toStringAsPrecision(4) + '°C',
                                                          style: TextStyle(
                                                          fontSize: 23,
                                                          fontFamily: 'Dosis',
                                                          fontWeight: FontWeight.bold,
                                                          letterSpacing: 1.5,
                                                          color: textclr,
                                                          
                                                  ),
                                                  
                                                  ),
                                            ),
                                        ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                                            child: ListTile(

                                              leading: CircleAvatar(
                                                backgroundImage: AssetImage('assets/humidity.jpg'),
                                              ),
                                              title: Text(humidity,
                                                            style: TextStyle(
                                                            fontSize: 23,
                                                            fontFamily: 'Noticia',
                                                            
                                                            letterSpacing: 1.5,
                                                            color: textclr,
                                                            
                                                    ),
                                                    
                                                    ),
                                            ),
                                          ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                                          child: ListTile(

                                                leading: CircleAvatar(
                                                  backgroundImage: AssetImage('assets/wind.jpg'),
                                                ),
                                                title: Text(windspeed,
                                                            style: TextStyle(
                                                            fontSize: 23,
                                                            fontFamily: 'Noticia',
                                                           
                                                            letterSpacing: 1.5,
                                                            color: textclr,
                                                            
                                                    ),
                                                    
                                                    ),
                                              ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                                          child: ListTile(

                                            leading: CircleAvatar(
                                              backgroundImage: AssetImage('assets/pressure.jpg'),
                                            ),
                                            title: Text(pressure,
                                                          style: TextStyle(
                                                          fontSize: 20,
                                                          fontFamily: 'Noticia',
                                                          
                                                          letterSpacing: 1.5,
                                                          color: textclr,
                                                          
                                                  ),
                                                  
                                                  ),
                                          ),
                                        ),
                                        
                         ] ),
                                  
                                  
                                  
                       
                     ]);
                 }
                 else{
                   return Waiting();
                 }
                }),
      );
  
  }
}


