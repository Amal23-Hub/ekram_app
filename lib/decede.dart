// ignore_for_file: duplicate_import, duplicate_ignore, prefer_final_fields, unused_field, non_constant_identifier_names, unused_element, avoid_print, depend_on_referenced_packages, prefer_const_constructors

// import 'package:intl/intl.dart';
import 'constatation.dart';
import 'test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class InformationsDecedeForm extends StatefulWidget {
  const InformationsDecedeForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InformationsDecedeFormState createState() => _InformationsDecedeFormState();
}

class _InformationsDecedeFormState extends State<InformationsDecedeForm> {
  final _formKey = GlobalKey<FormState>();
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



  bool isHovered = false;
  bool isPressed = false;

  bool _nomValid = true;
  bool _nomArabeValid = true;
  bool _prenomValid = true;
  bool _prenomArabeValid = true;
  bool _numPieceValid = true;
  bool _telValid = true;

  // String? _selectedOption2;
  // String? _selectedOption3;
  // String? _selectedOption6;
  // String? _selectedOption5;
  // String? _selectedOptionprovince;
  // String? _selectedOptioncountries;

  List<dynamic> _options2 = [];
  List<dynamic> _options3 = [];
  List<dynamic> _options6 = [];
  List<dynamic> _optionsprovince = [];
  List<dynamic> _optionscountries = [];
  List<dynamic> _optionsArrondissement = [];

  final List<String> _situationFamiliale = [
    'Célibataire(e)',
    'Marié(e)',
    'Divorcé(e)',
    'Veuf(e)'
  ];

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

  String? _selectedSituationFamiliale;
  String? _selectedIdType;
  String? _selectedNationalite;
  String? _selectedProvince;

  final List<String> _idTypeOptions = [
    'Carte d\'identité nationale',
    'Passeport',
    'Carte de séjour',
  ];

  String _nouveauNeValue = 'Non';
  String _nouveauValue = 'Non';
  String _selectedGender = '';

  final TextEditingController Nom_decede = TextEditingController();
  final TextEditingController Nom_arabe_decede = TextEditingController();
  final TextEditingController Prenom_decede = TextEditingController();
  final TextEditingController Prenom_arabe_decede = TextEditingController();
  final TextEditingController date_naissance_decede = TextEditingController();
  final TextEditingController date_Naissance_Controller =
      TextEditingController();
  final TextEditingController lieu_Naissance_Controller_decede =
      TextEditingController();
  final TextEditingController Num_piece_identite_decede =
      TextEditingController();
  final TextEditingController Type_piece_identite_decede =
      TextEditingController();
  final TextEditingController Copie_piece_identite_decede =
      TextEditingController();
  final TextEditingController Copie_piece_identite_recto_decede =
      TextEditingController();
  final TextEditingController Adresse_decede_controller =
      TextEditingController();
  final TextEditingController Nombre_Jours_vecu_decede_controller =
      TextEditingController();
  final TextEditingController Poids_Naissance_decede_controller =
      TextEditingController();
  final TextEditingController Nom_complet_Mom_controller =
      TextEditingController();
  final TextEditingController Nom_Complet_Mom_Arabe = TextEditingController();
  final TextEditingController date_Naissance_Mom_Controller =
      TextEditingController();
  final TextEditingController Num_piece_identite_Mom = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchOptions();
    fetchData().then((data) {
      if (data != null) {
        Nom_decede.text = data['declaration']?['deceased']?['name'] ?? '0000';
        Nom_arabe_decede.text =
            data['declaration']?['deceased']?['nameAr'] ?? '0000';
        Prenom_decede.text =
            data['declaration']?['deceased']?['firstName'] ?? '0000';
        Prenom_arabe_decede.text =
            data['declaration']?['deceased']?['firstNameAr'] ?? '0000';
        date_naissance_decede.text =
            data['declaration']?['deceased']?['dateOfBirth'] ?? ',,,';
        //   lieu_Naissance_Controller_decede.text =
        //       data['declaration']?['death']?['addressOfDeath'] ?? '';
        Adresse_decede_controller.text =
            data['declaration']?['deceased']?['homeAddress'] ?? '';
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  // @override
  // void dispose() {
  //   Adresse_decede_controller.dispose();
  //   date_naissance_decede.dispose();
  //   lieu_Naissance_Controller_decede.dispose();

  //    Prenom_arabe_decede.dispose();
  //    Prenom_decede.dispose();
  //    Nom_arabe_decede.dispose();
  //    Nom_decede.dispose();

  //   super.dispose();
  // }
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
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              "Les informations sur le décédé",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 82, 53, 43),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(padding: EdgeInsets.only(),
                            child: const Text(
                              'Est-ce qu\'il s\'agit d\'un nouveau-né ?',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 54, 54, 54),
                                fontSize: 15,
                              ),
                            ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 25),
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: 'Non',
                                  groupValue: _nouveauValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _nouveauValue = value!;
                                    });
                                  },
                                  activeColor: const Color.fromARGB(255, 82, 53, 43),
                                ),
                                const Text(
                                  'Non',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Radio<String>(
                                  value: 'Oui',
                                  groupValue: _nouveauValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _nouveauValue = value!;
                                    });
                                  },
                                  activeColor: const Color.fromARGB(255, 82, 53, 43),
                                ),
                                const Text(
                                  'Oui',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            ),
                            if (_nouveauValue == "Non") ...{
                              _buildTextField(
                                  label: 'Nom',
                                  controller: Nom_decede,
                                  isValid: _nomValid),
                              _buildTextField2(
                                  label: 'Nom en Arabe',
                                  controller: Nom_arabe_decede,
                                  isValid: _nomArabeValid,

                                  isArabicRequired: true,
                                  onChanged: (text) {
                                 setState(() {});
                              },
                            ),

                              _buildTextField(
                                  label: 'Prénom',
                                  controller: Prenom_decede,
                                  isValid: _prenomValid),
                              _buildTextField2(
                                  label: 'Prénom en Arabe',
                                  controller: Prenom_arabe_decede,
                                  isValid: _prenomArabeValid,
                                   isArabicRequired: true,
                                 onChanged: (text) {
                                 setState(() {});
                                },
                               ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 22),
                                child: TextFormField(
                                  controller: date_Naissance_Controller,
                                  decoration: const InputDecoration(
                                    labelText: 'Date de naissance *',
                                    labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 69, 67, 67),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFF014a71)),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFF014a71)),
                                    ),
                                  ),
                                  
                                  readOnly: true,
                                  onTap: () async {
                                    final DateTime? pickedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                    );
                                    if (pickedDate != null) {
                                      setState(() {
                                        date_Naissance_Controller.text =
                                            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                                      });
                                    }
                                  },
                                ),
                              ),
                              // _buildTextField(
                              //     label: 'Lieu de naissance',
                              //     controller: lieu_Naissance_Controller_decede),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Radio<String>(
                                      value: 'Non',
                                      groupValue: _nouveauNeValue,
                                      onChanged: (String? value) {
                                        setState(() {
                                          _nouveauNeValue = value!;
                                        });
                                      },
                                      activeColor: const Color.fromARGB(255, 82, 53, 43),
                                    ),
                                    const Text(
                                      'Homme',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Radio<String>(
                                      value: 'Oui',
                                      groupValue: _nouveauNeValue,
                                      onChanged: (String? value) {
                                        setState(() {
                                          _nouveauNeValue = value!;
                                        });
                                      },
                                      activeColor: const Color.fromARGB(255, 82, 53, 43),
                                    ),
                                    const Text(
                                      'Femme',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              _buildDropdownButtonFormField(
                                label: 'Situation familiale',
                                items: _situationFamiliale,
                                value: _selectedSituationFamiliale,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedSituationFamiliale = value;
                                  });
                                },
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
                                  controller: Num_piece_identite_decede,
                                  isValid: _numPieceValid),
                              // _buildDropdownButtonFormField1(
                              //   label: 'Nationalité',
                              //   options: _optionscountries,
                              //   value: _selectedOptioncountries,
                              //   onChanged: (newValue) {
                              //     setState(() {
                              //       _selectedOption5 = newValue;
                              //     });
                              //   },
                              // ),
                              // _buildDropdownButtonFormField1(
                              //   label: 'Pays de résidence',
                              //   options: _optionscountries,
                              //   value: _selectedOptioncountries,
                              //   onChanged: (newValue) {
                              //     setState(() {
                              //       _selectedOption5 = newValue;
                              //     });
                              //   },
                              // ),

                              //   _buildDropdownButtonFormField1(
                              //   label: 'Commune/Arrondissement',
                              //   options: _options3,
                              //   value: _selectedOption3,
                              //   onChanged: (newValue) {
                              //     setState(() {
                              //       _selectedOption3 = newValue;
                              //     });
                              //   },
                              // ),

                              buildDropdown('Nationalité', _optionscountries),

                              buildDropdown(
                                  'Pays de résidence', _optionscountries),
                              buildDropdown(
                                  'Préfecture/Province', _optionsprovince),
                              buildDropdown('Commune/Arrondissement',
                                  _optionsArrondissement),
                              _buildTextField(
                                  label: 'Adresse Habituelle',
                                  controller: Adresse_decede_controller,
                                  isValid: _telValid),
                              // ignore: equal_elements_in_set
                              const SizedBox(height: 20),
                            } else ...{
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 2,
                                color: Colors.black12,
                              ),
                              // ignore: equal_elements_in_set
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(padding: EdgeInsets.only(right: 39),
                              child: Text(
                                '+Concernant le Mort-né/Nouveau-né',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF014a71),
                                ),
                              ),
                              ),

                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 7),
                                child: Row(
                                  children: [
                                    Radio(
                                      value: 'Nouveau-né',
                                      activeColor: const Color.fromARGB(255, 82, 53, 43),
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value as String;
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Nouveau-né',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Radio(
                                      value: 'Mort-né',
                                      activeColor: const Color.fromARGB(255, 82, 53, 43),
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value as String;
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Mort-né',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              _buildTextField(
                                  label: 'Nombre de jours vécus',
                                  controller:
                                      Nombre_Jours_vecu_decede_controller,
                                  keyboardType:
                                      const TextInputType.numberWithOptions()),
                              const SizedBox(height: 14),
                              const Padding(
                                padding: EdgeInsets.only(right: 150),
                                child: Text(
                                  ' Grossesse multiple ?',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                               // ignore: prefer_const_constructors
                               Padding(padding: EdgeInsets.only(left: 5),
                               child:Row(
                                  children: [
                                    Radio(
                                      value: 'Oui',
                                      activeColor:  Color.fromARGB(255, 82, 53, 43),
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value as String;
                                        });
                                      },
                                    ),
                                     Text(
                                      'Oui',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Radio(
                                      value: 'Non',
                                      activeColor:  Color.fromARGB(255, 82, 53, 43),
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value as String;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Non',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Radio(
                                      value: 'Inconnue',
                                      activeColor:  Color.fromARGB(255, 82, 53, 43),
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value as String;
                                        });
                                      },
                                    ),
                                     Text(
                                      'Inconnue',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ), 
                                ),
                              
                              _buildTextField(
                                  label: 'Poids à la naissance)',
                                  controller: Poids_Naissance_decede_controller,
                                  keyboardType:
                                      const TextInputType.numberWithOptions()),
                              // ignore: equal_elements_in_set
                              const SizedBox(
                                height: 25,
                              ),
                              Container(
                                height: 2,
                                color: Colors.black12,
                              ),
                              // ignore: equal_elements_in_set
                              const SizedBox(height: 20),

                              // ignore: equal_elements_in_set
                              const Padding(padding: EdgeInsets.only(right: 55,),
                              child: Text(
                                '+Données personnelles de la mère',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF014a71),
                                ),
                              ),
                              ),
                              _buildTextField(
                                  label: 'Nom complet',
                                  controller: Nom_complet_Mom_controller),
                              _buildTextField2(
                                  label: 'Nom complet en Arabe',
                                  controller: Nom_Complet_Mom_Arabe, isArabicRequired: true,
                              onChanged: (text) {
                                setState(() {});
                              },
                            ),
                              _buildTextField(
                                  label: 'Date de naissance',
                                  controller: date_Naissance_Mom_Controller),
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
                                  controller: Num_piece_identite_Mom),
                              // ignore: equal_elements_in_set
                              const SizedBox(
                                height: 25,
                              ),
                              Container(
                                height: 2,
                                color: Colors.black12,
                              ),
                              // ignore: equal_elements_in_set
                              const SizedBox(height: 20),

                              // ignore: equal_elements_in_set
                              Padding(padding: EdgeInsets.only(right: 160 ),
                              child: Text(
                                '+Données d\'adresse',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF014a71),
                                ),
                              ),
                              ), 
                              // ignore: equal_elements_in_set
                              // const SizedBox(height: 10),
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
                                items: _idTypeOptions,
                                value: _selectedIdType,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedIdType = value;
                                  });
                                },
                              ),
                              _buildDropdownButtonFormField(
                                label: 'Commune/Arrondissement',
                                items: _idTypeOptions,
                                value: _selectedIdType,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedIdType = value;
                                  });
                                },
                              ),
                              _buildTextField(
                                  label: 'Adresse du décès',
                                  controller: Adresse_decede_controller),
                            },
                            const SizedBox(height: 20),
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
                                    _nomValid = Nom_decede.text.isNotEmpty;
                                    _nomArabeValid =
                                        Nom_arabe_decede.text.isNotEmpty;
                                    _prenomValid =
                                        Prenom_decede.text.isNotEmpty;
                                    _prenomArabeValid =
                                        Prenom_arabe_decede.text.isNotEmpty;
                                    _numPieceValid = Num_piece_identite_decede
                                        .text.isNotEmpty;
                                    _telValid = Adresse_decede_controller
                                        .text.isNotEmpty;
                                  });

                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RapportDeDeces(),
                                      ),
                                    );
                                  }
                                },
                                  child: const Text(
                                    'Continuer',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                              
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
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
      color: const Color.fromARGB(255, 82, 53, 43),
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
          _buildCircleButton2(const Icon(
            Icons.verified,
            size: 27,
          )),
          _buildDivider(),
          _buildCircleButton('3', const Color.fromARGB(255, 82, 53, 43)),
          _buildDivider(),
          _buildCircleButton('4', const Color.fromARGB(255, 189, 184, 182)),
          _buildDivider(),
          _buildCircleButton('5', const Color.fromARGB(255, 189, 184, 182)),
        ],
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

  Widget _buildDateTextField(
      {required String label,
      required TextEditingController controller,
      required VoidCallback onTap}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22),
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
            fontWeight: FontWeight.w700,
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xFF014a71)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xFF014a71)),
          ),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
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
            child: Text(
              item,
              style: const TextStyle(
               
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
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
            borderSide: BorderSide(color: Color(0xFF014a71),
           
            ),
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

  Future<Map<String, dynamic>?> fetchData() async {
    final response = await http.get(
      Uri.parse(
          'http://98.71.95.115/orchestrator-api/processings/declaration-details/84c245cc-bc4c-4595-8057-fbc80746cf50?assignmentBCH=1'),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6InJhYmF0X2NvbnN0YXRldXIiLCJmaXJzdE5hbWUiOiJDb25zdGF0ZXVyIiwibGFzdE5hbWUiOiJSYWJhdCIsInVzZXJJZCI6ImQzYjc1MjhjLWQwNjMtNDMyNC04NWI0LTgxMGM5NjcyN2JhZSIsImFzc2lnbm1lbnRCQ0giOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiT2JzZXJ2ZXIiLCJleHAiOjE3MTYyMjAzMjgsImlzcyI6InlvdXJfaXNzdWVyIiwiYXVkIjoieW91cl9hdWRpZW5jZSJ9.jlbVJDhm-ry8sfnVRaI7c1sNhSkWnKsbVNV1lEIikmQ',
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
}



Widget _buildTextField2({
  required String label,
  required TextEditingController controller,
  bool isValid = true,
  bool isArabicRequired = false,
  TextInputType? keyboardType,
  void Function(String)? onChanged,
}) {
  final isArabic = estArabe(texte: controller.text);

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
        if (!isArabic && controller.text.isNotEmpty)
          const Padding(
            padding: EdgeInsets.only(top: 4, left: 4),
            child: Text(
              'Ce champ doit être en arabe',
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

bool estArabe({required String texte}) {
  for (int i = 0; i < texte.length; i++) {
    int codePoint = texte.codeUnitAt(i);
    if ((codePoint >= 0x0600 && codePoint <= 0x06FF) ||
        (codePoint >= 0x0750 && codePoint <= 0x077F) ||
        (codePoint >= 0x08A0 && codePoint <= 0x08FF) ||
        (codePoint >= 0xFB50 && codePoint <= 0xFDFF) ||
        (codePoint >= 0xFE70 && codePoint <= 0xFEFF) ||
        (codePoint >= 0x10E60 && codePoint <= 0x10E7F) ||
        (codePoint >= 0x1EE00 && codePoint <= 0x1EEFF)) {
      return true;
    }
  }
  return false;
}