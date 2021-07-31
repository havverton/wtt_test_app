import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/auth/login_repository.dart';
import 'package:wtt_test_app/colors.dart';
import 'package:wtt_test_app/strings.dart';
import 'package:wtt_test_app/styles.dart';
import 'package:wtt_test_app/tabs/login_tab.dart';
import 'package:wtt_test_app/tabs/sign_up_tab.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  var _placeholderText = [kPlaceHolderLoginText, kPlaceHolderSignUpText];
  late TabController _tabController;

  final List<Text> loginTabs = <Text>[
    Text(
      kSignUpTabText,
      style: kTabsTextStyle,
    ),
    Text(
      kLoginTabText,
      style: kTabsTextStyle,
    ),
  ];

  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => AuthRepository(),
        child: Scaffold(
          body: Column(
            children: [
              Flexible(
                flex: MediaQuery.of(context).viewInsets.bottom == 0 ? 4 : 1,
                child: Container(
                  height: kLoginPagePlaceholderHeight,
                  decoration: kMainPlaceholderDecoration,
                  child: Stack(children: [
                    Center(
                        child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      child: Text(
                        _tabController.index == 0
                            ? _placeholderText[1]
                            : _placeholderText[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).viewInsets.bottom == 0
                                    ? 25.sp
                                    : 0),
                      ),
                    )),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: kTabBarFading,
                        child: TabBar(
                          labelColor: kSelectedLabelColor,
                          unselectedLabelColor: kUnselectedLabelColor,
                          indicatorColor: Colors.white,
                          controller: _tabController,
                          tabs: [
                            Tab(
                              child: loginTabs[0],
                            ),
                            Tab(
                              child: loginTabs[1],
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
        ));
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
