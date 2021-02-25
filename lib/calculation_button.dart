import 'package:flutter/material.dart';
import 'constants.dart';
class CalculateButton extends StatelessWidget {
  CalculateButton({@required this.buttonTitle, @required this.onTap});
  final String buttonTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(
          buttonTitle,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20.0,
          ),
        ),
        ),
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}