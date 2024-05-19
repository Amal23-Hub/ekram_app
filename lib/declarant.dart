import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// ignore: unused_import
import 'deces.dart';

class InformationsDeclarantForm extends StatefulWidget {
  const InformationsDeclarantForm({Key? key}) : super(key: key);

  @override
  State<InformationsDeclarantForm> createState() =>
      _InformationsDeclarantFormState();
}

class _InformationsDeclarantFormState extends State<InformationsDeclarantForm> {
  
  final _formKey = GlobalKey<FormState>();
  bool _nomValid = true;
  bool _nomArabeValid = true;
  bool _prenomValid = true;
  bool _prenomArabeValid = true;
  bool _numPieceValid = true;
  bool _telValid = true;
  bool isHovered = false;
  bool isPressed = false;

  final TextEditingController Nom_declarant = TextEditingController();
  final TextEditingController Nom_arabe_declarant = TextEditingController();
  final TextEditingController Prenom_declarant = TextEditingController();
  final TextEditingController Prenom_arabe_declarant = TextEditingController();
  final TextEditingController Telephone_declarant = TextEditingController();
  final TextEditingController Num_piece_identite_declarant = TextEditingController();

  final List<String> _idTypeOptions = [
    'Carte d\'identité nationale',
    'Passeport',
    'Carte de séjour',
  ];

  List<dynamic> _options4 = [];

  Future<void> _fetchOptions() async {
    try {
      final response4 = await http.get(
          Uri.parse('http://98.71.95.115/referential-api/affiliations'));

      if (response4.statusCode == 200) {
        setState(() {
          _options4 = json.decode(response4.body);
        });
      }
    } catch (error) {
      print(error);
    }
  }

  String? _selectedIdType;

  @override
  void initState() {
    super.initState();
    _fetchOptions(); // Fetch options when the widget initializes
    fetchData().then((data) {
      if (data != null) {
        Nom_declarant.text =
            data['declaration']?['declarant']?['name'] ?? '';
        Nom_arabe_declarant.text =
            data['declaration']?['declarant']?['nameAr'] ?? '';
        Prenom_declarant.text =
            data['declaration']?['declarant']?['firstName'] ?? '';
        Prenom_arabe_declarant.text =
            data['declaration']?['declarant']?['firstNameAr'] ?? '';
        Telephone_declarant.text =
            data['declaration']?['declarant']?['phoneNumber'] ?? '';
        Num_piece_identite_declarant.text =
            data['declaration']?['declarant']?['nationalID'] ?? '';
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  @override
  void dispose() {
    Nom_declarant.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Les informations sur le déclarant",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 82, 53, 43),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildTextField(
                              label: 'Nom',
                              controller: Nom_declarant,
                              isValid: _nomValid,
                            ),
                            _buildTextField(
                              label: 'Nom en Arabe',
                              controller: Nom_arabe_declarant,
                              isValid: _nomArabeValid,
                            ),
                            _buildTextField(
                              label: 'Prénom',
                              controller: Prenom_declarant,
                              isValid: _prenomValid,
                            ),
                            _buildTextField(
                              label: 'Prénom en Arabe',
                              controller: Prenom_arabe_declarant,
                              isValid: _prenomArabeValid,
                            ),
                            _buildDropdownButtonFormField(
                              label: 'Type de pièce d\'identité',
                              items: _idTypeOptions,
                              value: _selectedIdType,
                              onChanged: (value) {
                                setState(() {
                                  _selectedIdType = value;
                                });
                              },
                            ),
                            _buildTextField(
                              label: 'Numéro de pièce d\'identité',
                              controller: Num_piece_identite_declarant,
                              isValid: _numPieceValid,
                            ),
                            _buildTextField(
                              label: 'Téléphone',
                              controller: Telephone_declarant,
                              keyboardType: TextInputType.number,
                              isValid: _telValid,
                            ),
                            buildDropdown('Lien d\'affiliation', _options4),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 70, right: 70),
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
                                    _nomValid = Nom_declarant.text.isNotEmpty;
                                    _nomArabeValid = Nom_arabe_declarant.text.isNotEmpty;
                                    _prenomValid = Prenom_declarant.text.isNotEmpty;
                                    _prenomArabeValid = Prenom_arabe_declarant.text.isNotEmpty;
                                    _numPieceValid = Num_piece_identite_declarant.text.isNotEmpty;
                                    _telValid = Telephone_declarant.text.isNotEmpty;
                                  });

                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const InformationsDecesForm (),
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
                            const SizedBox(
                              height: 30,
                            ),
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

  Widget _buildTabs() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCircleButton('1', const Color.fromARGB(255, 82, 53, 43)),
          _buildDivider(),
          _buildCircleButton('2', const Color.fromARGB(255, 189, 184, 182)),
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
}

class InformationsDecesForm extends StatelessWidget {
  const InformationsDecesForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Future<Map<String, dynamic>?> fetchData() async {
  final response = await http.get(
    Uri.parse(
        'http://98.71.95.115/orchestrator-api/processings/declaration-details/84c245cc-bc4c-4595-8057-fbc80746cf50?assignmentBCH=1'),
    headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6InJhYmF0X2NvbnN0YXRldXIiLCJmaXJzdE5hbWUiOiJDb25zdGF0ZXVyIiwibGFzdE5hbWUiOiJSYWJhdCIsInVzZXJJZCI6ImQzYjc1MjhjLWQwNjMtNDMyNC04NWI0LTgxMGM5NjcyN2JhZSIsImFzc2lnbm1lbnRCQ0giOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiT2JzZXJ2ZXIiLCJleHAiOjE3MTYwNzk4NjEsImlzcyI6InlvdXJfaXNzdWVyIiwiYXVkIjoieW91cl9hdWRpZW5jZSJ9.qYdp-vhk0aSI9afkwCgVygYSSugivmanfVXcK-WEvjs',
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
