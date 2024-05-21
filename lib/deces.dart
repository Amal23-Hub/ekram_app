// ignore_for_file: non_constant_identifier_names, use_super_parameters, library_private_types_in_public_api, avoid_print, unused_field

import 'package:flutter/material.dart';
import 'decede.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class InformationsDeceForm extends StatefulWidget {
  const InformationsDeceForm({Key? key}) : super(key: key);

  @override
  _InformationsDeceFormState createState() => _InformationsDeceFormState();
}

class _InformationsDeceFormState extends State<InformationsDeceForm> {
  final TextEditingController date_deces_controller = TextEditingController();
  final TextEditingController time_deces_controller = TextEditingController();
  final TextEditingController Adresse_deces_controller = TextEditingController();
  bool isHovered = false;
  bool isPressed = false;
  bool _AdresselValid = true;
  String? _selectedOption2;
  String? _selectedOption3;
  String? _selectedOption6;
  String? _selectedOptionprovince;
  List<dynamic> _optionscountries = [];
  List<dynamic> _optionsArrondissement = [];
  List<dynamic> _options2 = [];
  List<dynamic> _options3 = [];
  List<dynamic> _options6 = [];
  List<dynamic> _optionsprovince = [];
  // ignore: prefer_typing_uninitialized_variables

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _fetchOptions();
    fetchData().then((data) {
      if (data != null) {
        date_deces_controller.text =
            data['declaration']?['death']?['dateOfDeath'] ?? '';
        time_deces_controller.text =
            data['declaration']?['death']?['addressOfDeath'] ?? '';
        Adresse_deces_controller.text =
            data['declaration']?['death']?['addressOfDeath'] ?? '';
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  @override
  void dispose() {
    Adresse_deces_controller.dispose();
    time_deces_controller.dispose();
    date_deces_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(
                      'images/ekram_logo2.png',
                      width: 150,
                      height: 70,
                      alignment: Alignment.topLeft,
                    ),
                    _buildTabs(),
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              "Les informations sur le décès",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 82, 53, 43),
                              ),
                            ),
                            const SizedBox(height: 10),
                            _buildDateTextField(
                              label: 'Date du décès',
                              controller: date_deces_controller,
                              onTap: () => _selectedDate(context),
                            ),
                            _buildDateTextField(
                              label: 'Heure du décès',
                              controller: time_deces_controller,
                              onTap: () => _selectedTime(context),
                            ),
                            _buildDropdownButtonFormField(
                              label: 'Lieu du décès',
                              options: _options2,
                              value: _selectedOption2,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedOption2 = newValue;
                                });
                              },
                            ),
                             buildDropdown(
                                'Préfecture/Province', _optionsprovince),
                            buildDropdown(
                                'Commune/Arrondissement', _optionsArrondissement),
                            // _buildDropdownButtonFormField(
                            //   label: 'Commune/Arrondissement',
                            //   options: _options3,
                            //   value: _selectedOption3,
                            //   onChanged: (newValue) {
                            //     setState(() {
                            //       _selectedOption3 = newValue;
                            //     });
                            //   },
                            // ),
                            //Commune/Arrondissement

                            // _buildDropdownButtonFormField(
                            //   label: 'Cause de deces',
                            //   options: _options5,
                            //   value: _selectedOption5,
                            //   onChanged: (newValue) {
                            //     setState(() {
                            //       _selectedOption5 = newValue;
                            //     });
                            //   },
                            // ),

                            _buildTextField(
                              label: 'Adresse Habituelle',
                              controller: Adresse_deces_controller,
                              isValid: _AdresselValid,
                            ),
                            _buildDropdownButtonFormField(
                              label: 'Cimetière d\'enterrement',
                              options: _options6,
                              value: _selectedOption6,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedOption6 = newValue;
                                });
                              },
                            ),
                            const SizedBox(height: 30),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 70),
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isPressed
                                      ? const Color(0xFF014a71)
                                      : (isHovered
                                          ? const Color.fromARGB(
                                              255, 82, 53, 43)
                                          : const Color.fromARGB(
                                              255, 82, 53, 43)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _AdresselValid = Adresse_deces_controller
                                        .text.isNotEmpty;
                                  });

                                  if (_formKey.currentState!.validate() &&
                                      _AdresselValid) {
                                    // Navigator.push(
                                    //   context
                                    //   // MaterialPageRoute(
                                    //   //   builder: (context) =>
                                    //   //       const  InformationsDeclarantForm(),
                                    //   // ),
                                    // );
                                  }
                                },
                                child: const Center(
                                  child: Text(
                                    'Continuer',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

Future<void> _selectedDate(BuildContext context) async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
    // locale: const Locale('fr', 'FR'), 
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(primary: Color.fromARGB(255, 82, 53, 43)),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 82, 53, 43),
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  if (picked != null) {
    // Formater la date en français
    String formattedDate = DateFormat.yMd('fr_FR').format(picked);
    
    setState(() {
      date_deces_controller.text = formattedDate;
    });
  }
}

Future<void> _selectedTime(BuildContext context) async {
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: time,
    initialEntryMode: TimePickerEntryMode.dial,
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color.fromARGB(255, 82, 53, 43),
            onPrimary: Colors.white,
          ),
          textTheme: const TextTheme(
            displayMedium: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
            titleLarge: TextStyle(
              color: Color.fromARGB(255, 82, 53, 43), // Couleur personnalisée pour AM et PM
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  if (selectedTime != null) {
    setState(() {
      time_deces_controller.text = selectedTime.format(context);
    });
  }
}

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    bool isValid = true,
    TextInputType? keyboardType,
    void Function(String)? onChanged,
  }) 
  {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            onChanged: onChanged,
            decoration: InputDecoration(
              labelText: '$label ${isValid ? '*' : ''}',
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 69, 67, 67),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xFF014a71)),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xFF014a71)),
              ),
            ),
          ),
          if (!isValid)
            const Padding(
              padding: EdgeInsets.only(top: 4, left: 4),
              child: Text(
                'Ce champ est obligatoire',
                style: TextStyle(
                  color: Color.fromARGB(255, 199, 49, 39),
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDropdownButtonFormField({
    required String label,
    required List<dynamic> options,
    required String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.only(right: 22, left: 22),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        items: options.map<DropdownMenuItem<String>>((dynamic option) {
          return DropdownMenuItem<String>(
            value: option['nameFr'],
            child: Text(option['nameFr']),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: '$label *',
          labelStyle: const TextStyle(
              color: Color.fromARGB(255, 69, 67, 67),
              fontSize: 16,
              fontWeight: FontWeight.w800),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF014a71))),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF014a71))),
        ),
        iconSize: 30,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez sélectionner une option';
          }
          return null;
        },
      ),
    );
  }
  Widget _buildTabs() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCircleButton2(const Icon(
            Icons.verified,
            size: 27,
          )),
          _buildDivider(),
          _buildCircleButton('2', const Color.fromARGB(255, 82, 53, 43)),
          _buildDivider(),
          _buildCircleButton('3', const Color.fromARGB(255, 189, 184, 182)),
          _buildDivider(),
          _buildCircleButton('4', const Color.fromARGB(255, 189, 184, 182)),
          _buildDivider(),
          _buildCircleButton('5', const Color.fromARGB(255, 189, 184, 182)),
        ],
      ),
    );
  }

  Widget _buildCircleButton2(Icon icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 189, 184, 182),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(String text, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 29,
      height: 2,
      color: const Color(0xFFc9b079),
    );
  }

  Widget _buildDateTextField(
      {required String label,
      required TextEditingController controller,
      required VoidCallback onTap}) {
    return Container(
      padding: const EdgeInsets.only(right: 22, left: 16),
      child: TextField(
        controller: controller,
        readOnly: true,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: '$label *',
          filled: true,
          fillColor: Colors.transparent,
          labelStyle: const TextStyle(
              color: Color.fromARGB(255, 69, 67, 67),
              fontSize: 16,
              fontWeight: FontWeight.w700),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: Color(0xFF014a71))),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: Color(0xFF014a71))),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>?> fetchData() async {
    final response = await http.get(
      Uri.parse(
          'http://98.71.95.115/orchestrator-api/processings/declaration-details/84c245cc-bc4c-4595-8057-fbc80746cf50?assignmentBCH=1'),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6InJhYmF0X2NvbnN0YXRldXIiLCJmaXJzdE5hbWUiOiJDb25zdGF0ZXVyIiwibGFzdE5hbWUiOiJSYWJhdCIsInVzZXJJZCI6ImQzYjc1MjhjLWQwNjMtNDMyNC04NWI0LTgxMGM5NjcyN2JhZSIsImFzc2lnbm1lbnRCQ0giOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiT2JzZXJ2ZXIiLCJleHAiOjE3MTYyODg1ODAsImlzcyI6InlvdXJfaXNzdWVyIiwiYXVkIjoieW91cl9hdWRpZW5jZSJ9.i8Rr5d7sxX3GHRP4Mtg58sya1tJSniyDYEeVCY65Wuk',
      },
    );
    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return json.decode(response.body);
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load data');
    }
  }

  Future<void> _fetchOptions() async {
    try {
      final response1 = await http.get(Uri.parse(
          'http://98.71.95.115/referential-api/status?roles=Observer'));
      final response2 = await http
          .get(Uri.parse('http://98.71.95.115/referential-api/death_place'));
      final response3 = await http.get(Uri.parse(
          'http://98.71.95.115/referential-api/administrative-hierarchies'));
      final response4 = await http
          .get(Uri.parse('http://98.71.95.115/referential-api/affiliations'));
      final response5 = await http.get(Uri.parse(
          'http://98.71.95.115/referential-api/death-causes/by-type?isExternal=false'));
      final response6 = await http.get(
          Uri.parse('http://98.71.95.115/referential-api/cemeteries/by-bch/1'));
      final response7 = await http
          .get(Uri.parse('http://98.71.95.115/referential-api/countries'));
      final response8 = await http.get(Uri.parse(
          'http://98.71.95.115/referential-api/administrative-hierarchies/1'));

      final response9 = await http.get(Uri.parse(
          'http://98.71.95.115/referential-api/administrative-hierarchies/by-parent/14'));
      if (response1.statusCode == 200) {
        // Traiter la réponse si nécessaire
      }
      if (response2.statusCode == 200) {
        setState(() {
          _options2 = json.decode(response2.body);
        });
      }
      if (response3.statusCode == 200) {
        setState(() {
          _options3 = json.decode(response3.body);
        });
      }
      if (response4.statusCode == 200) {
        // Traiter la réponse si nécessaire
      }
      if (response5.statusCode == 200) {
        // Traiter la réponse si nécessaire
      }
      if (response6.statusCode == 200) {
        setState(() {
          _options6 = json.decode(response6.body);
        });
      }
      if (response7.statusCode == 200) {
        _optionscountries = json.decode(response7.body);
      }
      if (response9.statusCode == 200) {
        _optionsArrondissement = json.decode(response9.body);
      }
      if (response8.statusCode == 200) {
        setState(() {
          _optionsprovince = json.decode(response8.body);
        });
      }
    } catch (error) {
      print(error);
    }
  }
}


Widget buildDropdown(String label, List<dynamic> options) {
  return Container(
    padding: const EdgeInsets.only(right: 22, left: 22),
    child: DropdownButtonFormField<String>(
      value: null,
      onChanged: (value) {},
      items: options.map<DropdownMenuItem<String>>((dynamic option) {
        return DropdownMenuItem<String>(
          value: option['nameFr'],
          child: Text(option['nameFr']),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: '$label *',
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 69, 67, 67),
          fontSize: 16,
          fontWeight: FontWeight.w800,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF014a71)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF014a71)),
        ),
      ),
      iconSize: 30,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Veuillez sélectionner une option';
        }
        return null;
      },
    ),
  );
}