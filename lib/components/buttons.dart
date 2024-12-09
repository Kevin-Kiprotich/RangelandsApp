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
        disabledBackgroundColor: const Color.fromRGBO(151, 156, 168, 1),
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

class BasemapButton extends StatefulWidget {
  const BasemapButton({
    super.key,
    required this.activeColor,
    required this.isActive,
    required this.mapType,
    required this.onPressed,
    required this.image,
  });
  final Color activeColor;
  final bool isActive;
  final String mapType;
  final Widget image;
  final void Function() onPressed;
  @override
  State<BasemapButton> createState() => _BasemapButtonState();
}

class _BasemapButtonState extends State<BasemapButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: widget.isActive
                  ? Border.all(width: 1.5, color: widget.activeColor)
                  : const Border(
                      bottom: BorderSide.none,
                      top: BorderSide.none,
                      left: BorderSide.none,
                      right: BorderSide.none,
                    ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: widget.image,
            ),
          ),
          Text(
            widget.mapType,
            style: TextStyle(
              fontSize: 13,
              fontWeight: !widget.isActive ? FontWeight.w500 : FontWeight.w700,
              color: !widget.isActive ? Colors.grey[800] : widget.activeColor,
            ),
          ),
        ],
      ),
    );
  }
}
