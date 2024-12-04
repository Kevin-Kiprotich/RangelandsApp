import 'package:flutter/material.dart';

class QuickAction extends StatelessWidget {
  const QuickAction({super.key, required this.icon, required this.label});
  final Widget icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Container(
          height: 80,
          width: 80,
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.62),
            border: Border.all(
              width: 0.5,
              color: const Color(0xFFB9b9b9),
            ),
          ),
          child: SizedBox(
            height: 26,
            width: 26,
            child: icon,
          ),
        ),
        const SizedBox(height: 6),
        Container(
            alignment: Alignment.center,
            width: 80,
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ))
      ],
    );
  }
}