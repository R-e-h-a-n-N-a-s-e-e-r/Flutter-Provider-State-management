import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    try {
      setLoading(true);
      var response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        headers: {'x-api-key': 'reqres-free-v1'},
        body: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        setLoading(false);
        print('Successful');
      } else {
        print('Failed');
      }
      setLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
