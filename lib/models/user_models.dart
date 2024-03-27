// class AuthModel {
//   Future<bool> login(String username, String password) async {
//     if (username == 'example' && password == 'password') {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }

class User {
  String username;
  String password;

  User({required this.username, required this.password});
}

/*
class AuthService {
  Future<bool> login(User user) async {
    // Your API call goes here.
    // For now, let's just simulate an API call with a delay.
    await Future.delayed(Duration(seconds: 1));
    return true;
  }
}*/
