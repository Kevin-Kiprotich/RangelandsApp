import 'package:flutter/material.dart';
import 'package:rangelandsapp/components/buttons.dart';
import 'package:rangelandsapp/components/dropdowns.dart';
class LocationModal extends StatefulWidget {
  const LocationModal({super.key});
  @override
  State<LocationModal> createState() => _LocationModalState();
}

class _LocationModalState extends State<LocationModal> {
  final _formkey = GlobalKey<FormState>();
  String? _county;
  String? _subCounty;
  String? _ward;
  List<dynamic> _countiesData = [];
  List<dynamic> _subCountiesData = [];
  List<dynamic> _wardsData = [];
  List<String> _counties = [''];
  List<String> _subCounties = [''];
  List<String> _wards = [''];
  int? admin0;

  

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
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width < 500 ? 16 : 32,
            right: MediaQuery.of(context).size.width < 500 ? 16 : 32,
            top: 24,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                'Area of Interest (AOI)',
                style: Theme.of(context).textTheme.titleLarge?.apply(color:Theme.of(context).colorScheme.secondary),
              ),
              // const SizedBox(height: 16),
              // Text(
              //   'Discover and analyze the Rangeland changes using the indices below',
              //   style: Theme.of(context).textTheme.bodySmall?.apply(color:const Color.fromRGBO(46, 46, 46, 1)),
              // ),
              const SizedBox(height:16),
              Form(
                key: _formkey,
                child: Expanded(
                  child: ListView(
                    children: [
                      const Text(
                        'County',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(37,40,43,1),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 48,
                        child: OutlinedDropDownButton(
                          value: _county,
                          items: _counties,
                          onChanged: (value) {
                            setState(() {
                              _county = value as String;
                              _subCounty = null;
                              // fetchRegion(_county.toString());
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
                        'Sub-County',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(37,40,43,1),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 48,
                        child: OutlinedDropDownButton(
                          value: _subCounty,
                          items: _subCounties,
                          onChanged: (value) {
                            setState(() {
                              _subCounty = value as String;
                              _ward = null;
                              // fetchSubRegion(value);
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Ward',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(37,40,43,1),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 48,
                        child: OutlinedDropDownButton(
                          value: _ward,
                          items: _wards,
                          onChanged: (value) {
                            setState(() {
                              _ward = value as String;
                            });
                          },
                        ),
                      ),
                      
                    ],
                  ),
                ),
                
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    // fetchAOI();
                  }
                },
                buttonText: 'Submit',
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}