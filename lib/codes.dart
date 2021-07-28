import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';
String apikey = "AI42DHJnuEZmCYWcGAKfB3NKdYCdAX9j";



  
Future<List>fetchjson()async
{
  Position p = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  var lat = p.latitude;
  var lng = p.longitude;
  

  var location_url = Uri.parse(
      "https://dataservice.accuweather.com/locations/v1/cities/geoposition/search?apikey=$apikey&q=$lat%2C$lng&details=false");
  
  
  Response response = await get(location_url);
  

  if(response.statusCode == 200) {
    
    

    var l_decoded = await jsonDecode(response.body);
    

    
    var tempurl = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lng&appid=24ad4427ef83e4f360eacb7c52caf32e');
    
    Response temp_response = await get(tempurl);
    var t_decoded = await jsonDecode(temp_response.body);
    
    
    return [l_decoded,t_decoded];
  }
  return [{},{}];
}
  


