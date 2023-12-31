
import 'package:http/http.dart' as http;
class Station { 
  String id;
  String name;
  String ville;
  String localisation;
  double longitude;
  double latitude;

  Station({
    required this.id,
    required this.name,
    required this.ville,
    required this.localisation,
    required this.longitude, 
    required this.latitude
  });


  factory Station.fromJson(Map<String, dynamic> json) { 
    return Station(
      id : json['id'] as String, 
      name: json['name'] as String, 
      ville: json['ville'] as String,
      localisation: json['localisation'] as String,
      longitude: json['longitude'] as double,
      latitude: json['latitude'] as double,
    );
  }

static Future<void> createStation(String name, String city) async {
try {
  final response = await http.get(Uri.parse('http://127.0.0.1:8084/stations') );
  if (response.statusCode == 200) {
    // Handle a successful response here
    // Parse the data, update the UI, etc.
  } else {
    // Handle different HTTP status codes here
    print('HTTP Error: ${response.statusCode}');
  }
} catch (e) {
  // Handle other exceptions, like connection errors
  print('Error: $e');
}

  
}
}
