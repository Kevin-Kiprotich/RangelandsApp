import 'package:flutter/material.dart';
import 'package:rangelandsapp/components/buttons.dart';
import 'package:rangelandsapp/components/dropdowns.dart';

class IndicatorsModal extends StatefulWidget {
  const IndicatorsModal({super.key});

  @override
  State<IndicatorsModal> createState() => _IndicatorsModalState();
}

class _IndicatorsModalState extends State<IndicatorsModal> {
  final _formkey = GlobalKey<FormState>();
  String? _indicator;
  String? _duration;
  String? _dataSet;
  String? _year;
  List<dynamic> _indicators = [];
  List<dynamic> _dataSets = [];
  List<dynamic> _durations = [];
  List<dynamic> _years = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double sidePading = 16;
    const double topPadding = 24;
    const double spacing = 16;
    return SafeArea(
      child: DraggableScrollableSheet(
          initialChildSize: 0.75,
          minChildSize: 0.75,
          maxChildSize: 1.0,
          expand: false,
          builder: (context, scrollController) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.only(
                    left: sidePading,
                    right: sidePading,
                    top: topPadding,
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.close_outlined,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Data Visualization',
                        style: Theme.of(context).textTheme.titleLarge?.apply(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Discover and analyze the Rangeland changes using the indices below',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.apply(color: const Color.fromRGBO(46, 46, 46, 1)),
                      ),
                      const SizedBox(height: 16),
                      Form(
                        key: _formkey,
                        child: ListView(
                          shrinkWrap: true,
                          controller: scrollController,
                          children: [
                            const Text(
                              'Indicator',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(37, 40, 43, 1),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 48,
                              child: OutlinedDropDownButton(
                                value: _indicator,
                                items: _indicators,
                                onChanged: (value) {
                                  setState(() {
                                    _indicator = value as String;
                                    // fetchRegion(_countiesValue.toString());
                                  });
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return "Please select a county";
                                  }

                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Dataset',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(37, 40, 43, 1),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 48,
                              child: OutlinedDropDownButton(
                                value: _dataSet,
                                items: _dataSets,
                                onChanged: (value) {
                                  setState(() {
                                    _dataSet = value as String;
                                    // fetchRegion(_countiesValue.toString());
                                  });
                                },
                                // validator: (value) {
                                //   if (value == null) {
                                //     return "Please select a dataset";
                                //   }

                                //   return null;
                                // },
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Duration',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(37, 40, 43, 1),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 48,
                              child: OutlinedDropDownButton(
                                value: _duration,
                                items: _durations,
                                onChanged: (value) {
                                  setState(() {
                                    _duration = value as String;
                                    // fetchRegion(_countiesValue.toString());
                                  });
                                },
                                // validator: (value) {
                                //   if (value == null) {
                                //     return "Please select a county";
                                //   }

                                //   return null;
                                // },
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Time',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(37, 40, 43, 1),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 48,
                              child: OutlinedDropDownButton(
                                value: _year,
                                items: _years,
                                onChanged: (value) {
                                  setState(() {
                                    _year = value as String;
                                    // fetchRegion(_countiesValue.toString());
                                  });
                                },
                                // validator: (value) {
                                //   if (value == null) {
                                //     return "Please select a county";
                                //   }

                                //   return null;
                                // },
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 48,
                              child: PrimaryButton(
                                onPressed: () {},
                                buttonText: "Request",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
