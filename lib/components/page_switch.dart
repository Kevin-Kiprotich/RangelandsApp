import 'package:flutter/material.dart';

class PageSwitch extends StatelessWidget {
  const PageSwitch(
      {super.key,
      this.activePage = "kollecta",
      required this.onDashboardClicked,
      required this.onDataCollectionClicked});

  final String activePage;
  final void Function()? onDashboardClicked;
  final void Function()? onDataCollectionClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 264,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: const Color(0xFFC6CCD6),
          strokeAlign: BorderSide.strokeAlignInside,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onDashboardClicked,
              child: Container(
                decoration: BoxDecoration(
                  color: activePage == "dashboard"
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Dashboard",
                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                          color: activePage == "dashboard"
                              ? Colors.white
                              : const Color(0xFF4D525A),
                        ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onDataCollectionClicked,
              child: Container(
                decoration: BoxDecoration(
                  color: activePage == "kollecta"
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Data Collection",
                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                          color: activePage == "kollecta"
                              ? Colors.white
                              : const Color(0xFF4D525A),
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
