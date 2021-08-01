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
  final List<Tab> loginTabNames = <Tab>[
    Tab(child: Text(kSignUpTabText)),
    Tab(child: Text(kLoginTabText)),
  ];
  final List<Widget> loginTabs = <Widget>[
    Center(child: SignUpTab()),
    Center(child: LoginTab()),
  ];

  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => AuthRepository(),
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: kPlaceholderHeightFull,
                decoration: kMainPlaceholderDecoration,
                child: Stack(children: [
                  Center(
                    child: Container(
                      child: (_tabController.index == 0)
                    ? _placeholderText(kPlaceHolderLoginText)
                    : _placeholderText(kPlaceHolderSignUpText),
                    ),
                    ),

                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: kTabBarFading,
                      child: TabBar(
                        controller: _tabController,
                        tabs: loginTabNames,
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
                    children: loginTabs,
                  ),
                ),
              )
            ],
          ),
        ));
  }

  @override
  void initState() {
    _tabController = TabController(length: loginTabNames.length, vsync: this);
    _tabController.addListener(() {
      FocusScope.of(context).unfocus();
      setState(() { });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _placeholderText(String text)=>
    Text(text,style: Theme.of(context).textTheme.headline2);
}
