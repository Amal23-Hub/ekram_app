// ignore_for_file: non_constant_identifier_names, use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'decede.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InformationsDecesForm extends StatefulWidget {
  const InformationsDecesForm({Key? key}) : super(key: key);

  @override
  _InformationsDecesFormState createState() => _InformationsDecesFormState();
}

class _InformationsDecesFormState extends State<InformationsDecesForm> {
  final TextEditingController date_deces_controller = TextEditingController();
  final TextEditingController time_deces_controller = TextEditingController();
  final TextEditingController Adresse_deces_controller =
      TextEditingController();

  bool isHovered = false;
  bool isPressed = false;
  bool _AdresselValid = true;

  final List<String> _province = [
    'RABAT',
    'SKHIRATE-TEMARA',
    'MOHAMMADIA',
    'AGADIR IDA OU TANANE',
    'INEZGANE-AIT MELLOUL',
    'OUJDA-ANGAD',
    'TANGER-ASSILAH',
    'SALE',
    'FES',
    'MARRAKECH',
    'MEKNES',
    'MDIQ-FNIDEQ',
    'CASABLANCA',
    'KHEMISSET',
    'CHTOUKA-AIT BAHA',
    'TAROUDANNT',
    'TIZNIT',
    'OUARZAZATE',
    'ZAGORA',
    'AL HOCEIMA',
    'TAZA',
    'BENI MELLAL',
    'AZILAL',
    'MOULAY-YACOUB',
  ];

  final List<String> _idTypeOptions = [
    'Domicile',
    'Hopital publique',
    'Hopital privé',
  ];
  final List<String> _Cimetierdenterrement = [
    'Al-shouhada',
    'Lalou',
    'Allal Ibn Abdullah',
    'AS-sadiq',
    'La grande Cimetière',
  ];
  String? _selectedIdType;
  String? _SelectedCimetierdenterrement;

  String? _selectedProvince;
  String? _selectedCommune;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
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
                              items: _idTypeOptions,
                              value: _selectedIdType,
                              onChanged: (value) {
                                setState(() {
                                  _selectedIdType = value;
                                });
                              },
                            ),
                            _buildDropdownButtonFormField(
                              label: 'Préfecture/Province',
                              items: _province,
                              value: _selectedProvince,
                              onChanged: (value) {
                                setState(() {
                                  _selectedProvince = value;
                                });
                              },
                            ),
                            _buildDropdownButtonFormField(
                              label: 'Commune/Arrondissement',
                              items: _province,
                              value: _selectedCommune,
                              onChanged: (value) {
                                setState(() {
                                  _selectedCommune = value;
                                });
                              },
                            ),
                            _buildTextField(
                              label: 'Adresse Habituelle',
                              controller: Adresse_deces_controller,
                              isValid: _AdresselValid,
                            ),
                            _buildDropdownButtonFormField(
                              label: 'Cimetière d\'enterrement',
                              items: _Cimetierdenterrement,
                              value: _SelectedCimetierdenterrement,
                              onChanged: (value) {
                                setState(() {
                                  _SelectedCimetierdenterrement = value;
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const InformationsDecedeForm(),
                                      ),
                                    );
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

  // Vos méthodes de création de widgets
  // ...

  Future<void> _selectedDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        date_deces_controller.text = picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectedTime(BuildContext context) async {
    TimeOfDay time = TimeOfDay.now();
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: time,
      initialEntryMode: TimePickerEntryMode.dial,
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
  }) {
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
    required List<String> items,
    required String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.only(right: 22, left: 22),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
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
}

Widget _buildTabs() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
     children: [
        _buildCircleButton2(const Icon(Icons.verified,size: 27,)), 
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

Widget _buildCircleButton2( Icon icon) {
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
    color: const Color.fromARGB(255, 52, 29, 16),
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
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6InJhYmF0X2NvbnN0YXRldXIiLCJmaXJzdE5hbWUiOiJDb25zdGF0ZXVyIiwibGFzdE5hbWUiOiJSYWJhdCIsInVzZXJJZCI6ImQzYjc1MjhjLWQwNjMtNDMyNC04NWI0LTgxMGM5NjcyN2JhZSIsImFzc2lnbm1lbnRCQ0giOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiT2JzZXJ2ZXIiLCJleHAiOjE3MTU5NTY3OTAsImlzcyI6InlvdXJfaXNzdWVyIiwiYXVkIjoieW91cl9hdWRpZW5jZSJ9.hxQTTTcJdSBgiTqOg8XOt9iDMKWkci_syQJaI-nS_jc',
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