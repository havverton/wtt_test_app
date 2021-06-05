import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginButtonColumn extends StatelessWidget {
  final String actionType;
  LoginButtonColumn(this.actionType);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 6.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                color: Colors.black,
              ),
              child: InkWell(
                  onTap: () => {print('lolKek')},
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(left: 12.0),
                        child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image(
                              image: AssetImage('res/FacebookIcon.png'),
                            )),
                      ),
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              "$actionType with Facebook",
                              style:
                              TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            Container(
              height: 6.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                color: Colors.black,
              ),
              child: InkWell(
                  onTap: () => {print('lolKek')},
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(left: 12.0),
                        child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image(
                              image: AssetImage('res/GoogleIcon.png'),
                            )),
                      ),
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              "$actionType with Google",
                              style:
                              TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            Container(
              height: 6.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                color: Colors.black,
              ),
              child: InkWell(
                  onTap: () => {print('lolKek')},
                  child: Row(
                    children: [
                      Container(
                        width: 4.h,
                        height: 4.h,
                        margin: EdgeInsets.only(left: 12.0),
                        child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image(
                              image: AssetImage('res/InstagramIcon.png'),
                            )),
                      ),
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              "$actionType with Instagram",
                              style:
                              TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
