import 'package:flutter/material.dart';
import 'constants.dart';
class ReusableCardChild extends StatelessWidget {
  ReusableCardChild({@required this.content, @required this.iconValue});
  final String content;
  final IconData iconValue;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconValue,
            size: 80.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
              content,
              style: kContentTextStyle,
          ),
        ]

    );
  }
}