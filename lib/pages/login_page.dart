import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtt_test_app/auth/login_repository.dart';
import 'package:wtt_test_app/pages/tabs/login_tab.dart';
import 'package:wtt_test_app/pages/tabs/sign_up_tab.dart';
import 'package:wtt_test_app/utils/colors.dart';
import 'package:wtt_test_app/utils/strings.dart';
import 'package:wtt_test_app/utils/styles.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _placeholderText = kPlaceHolderSignUpText;

  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return RepositoryProvider(
        create: (context) => AuthRepository(),
        child: Scaffold(
          body: Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 150),
                height: (MediaQuery.of(context).viewInsets.bottom != 0)
                    ? kPlaceholderHeightShort
                    : kPlaceholderHeightFull,
                decoration: kMainPlaceholderDecoration,
                child: Stack(children: [
                  if (!isKeyboardOpen)
                    Center(
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 200),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return SlideTransition(
                            child: child,
                            position: Tween<Offset>(
                                    begin: Offset(-1.0, 0.0),
                                    end: Offset(0.0, 0.0))
                                .animate(animation),
                          );
                        },
                        child: Text(
                          _placeholderText,
                          style: Theme.of(context).textTheme.headline2,
                          key: ValueKey<String>(_placeholderText),
                        ),
                      ),
                    ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: kTabBarFading,
                      child: TabBar(
                        controller: _tabController,
                        tabs: [
                          Tab(
                              child: Text(
                            kSignUpTabText,
                            style: Theme.of(context).textTheme.headline4,
                          )),
                          Tab(
                              child: Text(
                            kLoginTabText,
                            style: Theme.of(context).textTheme.headline4,
                          )),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Center(child: SignUpTab()),
                      Center(child: LoginTab(isKeyboardOpen)),
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
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      FocusScope.of(context).unfocus();
      setState(() {
        if (_tabController.index == 0) {
          _placeholderText = kPlaceHolderSignUpText;
        } else {
          _placeholderText = kPlaceHolderLoginText;
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
