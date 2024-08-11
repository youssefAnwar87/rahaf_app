// how to get the local host 
// On Windows:

//     Open Command Prompt by pressing Win + R, type cmd, and press Enter.
//     Type ipconfig and press Enter.
//     Look for the "IPv4 Address" under your active network connection. This is your local IP address (e.g., 192.168.173.182).


// IP addresses can change when you reconnect to the network, so verify it with ipconfig (on Windows) or ifconfig (on macOS/Linux) and update the ServerConfig.localhost if necessary.


//  Make sure that your mobile device (if you're running the Flutter app on a physical device) is connected to the same Wi-Fi network as your server.

abstract class ServerConfig {
  static const localhost = "192.168.225.182";
  // ignore: constant_identifier_names
  static const BASE_URL = "http://$localhost:8000/api/v1/"; // change this to your local host "http://YourLocalHost:8000/api/v1/"
  static String token = "";
  static const register = "auth/signup";
  static const login = "auth/login";
  static const buildings = "buildings/";
}
