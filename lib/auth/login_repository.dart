abstract class LoginRepository {
  Future<void> login(String email, String password);

  Future<void> signup(String number, String password);
}

class AuthRepository extends LoginRepository {
  @override
  Future<void> login(email, password) async {
    await Future.delayed(Duration(seconds: 3));
    if (email == "admin@admin.com" && password == "Qwertyu1") {
      print('logged in');
    } else {
      throw Exception('failed log in');
    }
  }

  @override
  Future<void> signup(number, password) async {
    await Future.delayed(Duration(seconds: 3));
    print('signed up');
  }
}
