import 'package:butler_app/src/resources/utilities/constants.dart';
import 'package:flutter/material.dart';

class RoundedRectangleButton extends StatelessWidget {
  const RoundedRectangleButton({
    Key key,
    @required this.onPressed,
    @required this.buttonText,
    this.buttonTextColour,
    this.buttonColour = Colors.white,
    this.buttonBorderRadius = 44.0,
    this.child,
  }) : super(key: key);

  final String buttonText;
  final Color buttonTextColour;
  final Color buttonColour;
  final double buttonBorderRadius;
  final Function onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: this.onPressed,
        child: child ??
            Text(
              this.buttonText,
              style: kButtonTextStyle.copyWith(
                color: this.buttonTextColour,
              ),
            ),
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: Colors.black,
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(this.buttonColour),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(this.buttonBorderRadius),
            ),
          ),
        ),
      ),
    );
  }
}
