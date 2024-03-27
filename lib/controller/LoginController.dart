import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Services/api_services.dart';
import '../view/DashBoardPage.dart';


class LoginController extends GetxController {
  bool _isLoading = false;
  API_SERVICES apiServices = API_SERVICES();

  // Method to login user
  Future<dynamic> loginUser(String username, String password) async {
    try {
      // Set loading state to true
      setLoading(true);

      // Prepare the request body
      var requestBody = jsonEncode({
        'username': username,
        'password': password,
      });

      // Make the HTTP POST request
      var response = await http.post(
        Uri.parse(
            apiServices.apiServiceUrl + 'loginpage/GetLogin'),


        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      // Check the response status code and handle accordingly
      if (response.statusCode == 200) {
        // Parse the response body
        var responseBody = jsonDecode(response.body);

        try {
          String mstatus = responseBody['Status'];
          String mstatuscode = responseBody['StatusCode'];
          Map<String, dynamic> responsemsg = responseBody['Result'];
          if (mstatuscode == "Success") {

            Map<String, dynamic> jsonobject = responsemsg['Table'][0];
            String getUserID = jsonobject["UserID"].toString();
            String getmUserName = jsonobject["UserName"];

            Get.off(DashBordPage());

          } else {
            return 'Authentication failed';
          }

        } catch (e) {
          print(e);
        }

      } else {
        // If the request was not successful, return an error message
        return 'Failed to connect to server';
      }
    } catch (e) {
      // If an error occurs during the HTTP request, return an error message
      print('Error: $e');
      return 'Error occurred';
    } finally {
      // Set loading state to false after request completes
      setLoading(false);
    }
  }

  // Getter method for isLoading
  bool get isLoading => _isLoading;

  // Setter method for isLoading
  void setLoading(bool value) {
    _isLoading = value;
    update(); // Trigger a UI update
  }
}
