abstract class LoginRepository{
  Future<void>  login(String email, String password);
  Future<void> signup(String email, String password);
}


class AuthRepository extends LoginRepository {
  @override
  Future<void> login(email,password) async {
    print('try to login');
    await Future.delayed(Duration(seconds: 3));
    if(email == "admin@admin.com" && password == "Qwertyu1"){
      print('logged in');
    }else{
      throw Exception('failed log in');
    }


  }

  @override
  Future<void> signup(String email, String password) async {
   print("");
  }
}