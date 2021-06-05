import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/login_tab.dart';
import 'package:wtt_test_app/sign_up_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        home: LoginPage(),
      );
    });
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  var _placeholderText = ["See you there", "Create account"];
  late TabController _tabController;

  static const List<Tab> loginTabs = <Tab>[
    Tab(text: 'Sign up'),
    Tab(text: 'Log in'),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: MediaQuery.of(context).viewInsets.bottom == 0 ? 4 : 1,
            child: Container(
              height: 39.h,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x40000000),
                      spreadRadius: 0,
                      blurRadius: 15,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFFF820F), Color(0xFFFB31FF)])),
              child: Center(
                child: Stack(children: [
                  Center(
                      child: Text(_tabController.index == 0 ? _placeholderText[1] : _placeholderText[0], style: TextStyle(color: Colors.white, fontSize: 34.sp),)),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: DefaultTabController(
                      length: loginTabs.length,
                      child: TabBar(
                        //TODO черный фон на вкладках
                        labelColor: const Color(0xFFFFFFFF),
                        unselectedLabelColor: const Color(0x77FFFFFF),
                        indicatorColor: Colors.white,
                        controller: _tabController,
                        tabs: [
                          Tab(
                            child: Text("Sign up"),
                          ),
                          Tab(
                            child: Text("Log in"),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              color: Color(0xFFFFFFFF),
              child: DefaultTabController(
                length: loginTabs.length,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Center(
                      child: SignUpTab(),
                    ),
                    Center(
                      child: LoginTab(),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  @override
  void initState(){
     _tabController = TabController(length: loginTabs.length, vsync: this);
     _tabController.addListener(() {
       setState(() {

       });
     });
  }

  @override
  void dispose(){
    _tabController.dispose();
        super.dispose();
  }

}
