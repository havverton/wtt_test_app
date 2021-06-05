import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmailButtonWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        color: Color(0xFFB6B6B6),
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
                    child: Icon(Icons.alternate_email),
                    )),

              Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                      "Sign up with email",
                      style:
                      TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
