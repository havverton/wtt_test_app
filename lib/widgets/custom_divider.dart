import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDividerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Divider(
                  thickness: 5,
                  color: Color(0xFFE7E7E7),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Center(child: Text("Or",style: TextStyle(color: Color(0xFFE7E7E7),fontSize: 17.sp),),),
            ),
            Expanded(
              child: Container(child: Divider(
                thickness: 5,
                color: Color(0xFFE7E7E7),
              ),),
            ),

          ],
        ),
      ),
    );
  }
}
