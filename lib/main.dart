import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/styles.dart';
import 'package:wtt_test_app/tabs/login_tab.dart';
import 'package:wtt_test_app/tabs/sign_up_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: kMainMaterialTheme,
        home: LoginPage(),
      );
    });
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  var _placeholderText = ["See You There", "Create account"];
  late TabController _tabController;

  static const List<Text> loginTabs = <Text>[
    Text('Sign up'),
    Text('Log in'),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: MediaQuery.of(context).viewInsets.bottom == 0 ? 4 : 1,
            child: Container(
              height: kLoginPagePlaceholderHeight,
              decoration: kMainPlaceholderDecoration,
              child: Stack(children: [
                Center(
                    child: Text(
                  _tabController.index == 0
                      ? _placeholderText[1]
                      : _placeholderText[0],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).viewInsets.bottom == 0
                          ? 25.sp
                          : 0),
                )),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: const Color(0x14000000),
                    child: TabBar(
                      labelColor: kSelectedLabelColor,
                      unselectedLabelColor: kUnselectedLabelColor,
                      indicatorColor: Colors.white,
                      controller: _tabController,
                      tabs: [
                        Tab(
                          child: Text(
                            'Sign up',
                            style: kTabsTextStyle,
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Log in',
                            style: kTabsTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: Colors.transparent,
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
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    _tabController = TabController(length: loginTabs.length, vsync: this);
    _tabController.addListener(() {
      FocusScope.of(context).unfocus();
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
