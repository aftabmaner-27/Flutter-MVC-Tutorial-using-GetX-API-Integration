import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/LoginController.dart';


class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.person,color: Colors.lightBlue,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  prefixIcon: Icon(Icons.password,color: Colors.lightBlue),
                ),
              ),
            ),

            const SizedBox(height: 20.0),
            Container(
              width: 130,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  controller.loginUser(username, password);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 25.0,color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
         /*   Obx(() => controller.isLoading.value
                ? CircularProgressIndicator()
                : Text(
              controller.message.value,
              style: TextStyle(
                color: Colors.red,
              ),
            )),*/
          ],
        ),
      ),
    );
  }
}
