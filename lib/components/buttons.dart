import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.foregroundColor = Colors.white,
      this.backgroundColor = const Color.fromRGBO(207, 16, 45, 1)});
  final void Function()? onPressed;
  final String buttonText;
  final Color backgroundColor;
  final Color foregroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        disabledBackgroundColor: const Color.fromRGBO(230, 230, 230, 1),
        disabledForegroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 42),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class MapButton extends StatelessWidget {
  const MapButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.foregroundColor = const Color.fromRGBO(15, 23, 42, 1),
    this.backgroundColor = Colors.white,
  });

  final Widget icon;
  final Color foregroundColor;
  final Color backgroundColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Container(
        height: 40,
        width: 40,
        // height: MediaQuery.of(context).size.width < 500 ? 40 : 48,
        // width: MediaQuery.of(context).size.width < 500 ? 40 : 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1E000000),
                blurRadius: 2,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ]),
        clipBehavior: Clip.antiAlias,
        child: Center(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor,
              shape: const ContinuousRectangleBorder(
                  // borderRadius: BorderRadius.circular(30),
                  ),
              padding: const EdgeInsets.all(0),
            ),
            child: Center(child: icon),
          ),
        ),
      );
}
