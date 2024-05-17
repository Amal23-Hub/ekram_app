import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'constatation.dart';

class InformationsDecedeForm extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const InformationsDecedeForm({Key? key});

  @override
  State<InformationsDecedeForm> createState() => _InformationsDecedeFormState();
}

class _InformationsDecedeFormState extends State<InformationsDecedeForm> {
  late DateTime _selectedDate = DateTime.now();

  final TextEditingController dateNaissanceController = TextEditingController();

  bool isHovered = false;
  bool isPressed = false;

  final List<String> _situationFamiliale = [
    'Célibataire(e)',
    'Marié(e)',
    'Divorcé(e)',
    'Veuf(e)'
  ];

  final List<String> _province = [
    ' RABAT',
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

  final List<String> _nationalites = [
    'Maroc',
    'Canada',
    'America',
  ];

  String _nouveauNeValue = 'Non';
  String _nouveauValue = 'Non';

  String _selectedGender = '';

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
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20,right: 10),
            child: Row(
              children: [
                Column(
                  children: [
                    _buildCircleButton(
                        '1', const Color.fromARGB(255, 136, 194, 201)),
                    _buildDivider(),
                    _buildCircleButton(
                        '2', const Color.fromARGB(255, 136, 194, 201)),
                    _buildDivider(),
                    _buildCircleButton('3', const Color(0xFF014a71)),
                    _buildDivider(),
                    _buildCircleButton(
                        '4', const Color.fromARGB(255, 136, 194, 201)),
                    _buildDivider(),
                    _buildCircleButton(
                        '5', const Color.fromARGB(255, 136, 194, 201)),
                  ],
                ),
               
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Les informations sur le décédé",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFc9b079),
                        ),),
                      const SizedBox(height: 10),
                      const Text(
                            'Est-ce qu\'il s\'agit d\'un nouveau-né ?',
                             style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 54, 54, 54),
                              fontSize: 18,
                            ),
                          ),
                      const SizedBox(height: 13),
                           
                      Column(
                        children: [
                          
                      
                                // const Text(
                                //   'Est-ce qu\'il s\'agit d\'un nouveau-né ?',
                                //   style: TextStyle(
                                //     fontWeight: FontWeight.bold,
                                //     color: Color.fromARGB(255, 54, 54, 54),
                                //     fontSize: 18,
                                //   ),
                                // ),
                           
                          
                          Row(
                            children: [
                              
                              Radio<String>(
                                value: 'Non',
                                groupValue: _nouveauValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    _nouveauValue = value!;
                                  });
                                },
                                activeColor: const Color(0xFFc9b079),
                              ),
                              const Text(
                                'Non',
                              
                                style: TextStyle(fontSize: 16,),
                              ),
                              Radio<String>(
                                value: 'Oui',
                                groupValue: _nouveauValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    _nouveauValue = value!;
                                  });
                                },
                                activeColor: const Color(0xFFc9b079),
                              ),
                              const Text(
                                'Oui',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (_nouveauValue == "Non") ...{
                     
                       
        
                        _buildTextField(label: 'Nom'),
                        _buildTextField(label: 'Nom en Arabe'),
                        _buildTextField(label: 'Prénom'),
                        _buildTextField(label: 'Prénom en Arabe'),
                        _buildDateTextField(label: 'Date de naissance'),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Homme',
                              groupValue: _nouveauNeValue,
                              onChanged: (String? value) {
                                setState(() {
                                  _nouveauNeValue = value!;
                                });
                              },
                              activeColor: const Color(0xFFc9b079),
                            ),
                            const Text('Homme',style: TextStyle(fontSize: 16),),
                            Radio<String>(
                              value: 'Femme',
                              groupValue: _nouveauNeValue,
                              onChanged: (String? value) {
                                setState(() {
                                  _nouveauNeValue = value!;
                                });
                              },
                              activeColor: const Color(0xFFc9b079),
                            ),
                            const Text('Femme',style: TextStyle(fontSize: 16),),
                          ],
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
                        _buildTextField(label: 'Numéro de pièce d\'identité'),
        
                        _buildDropdownButtonFormField(
                          label: 'Nationalité',
                          items: _nationalites,
                          value: _selectedNationalite,
                          onChanged: (value) {
                            setState(() {
                              _selectedNationalite = value;
                            });
                          },
                        ),
                        _buildDropdownButtonFormField(
                          label: 'Pays de résidence',
                          items: _nationalites,
                          value: _selectedNationalite,
                          onChanged: (value) {
                            setState(() {
                              _selectedNationalite = value;
                            });
                          },
                        ),
        
                        _buildDropdownButtonFormField(
                          label: 'Commune/Arrondissement',
                          items: _province,
                          value: _selectedProvince,
                          onChanged: (value) {
                            setState(() {
                              _selectedProvince = value;
                            });
                          },
                        ),
                        _buildTextField(label: 'Adresse Habituelle'),
                        // ignore: equal_elements_in_set
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0, left: 0),
                          child: 
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RapportDeDeces(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_right,
                              size: 80,
                              color: isPressed
                                  ? const Color(0xFF014a71)
                                  : (isHovered
                                      ? const Color.fromARGB(255, 115, 93, 55)
                                      : const Color(0xFFc9b079)),
                            ),
                          ),
                        ),
                      } else ...{
                       const  SizedBox(height: 8,),
                         const Text(
                                '+Informations concernant le Mort-né/Nouveau-né',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF014a71),
                                ),
                              ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0, left: 0),
                          child: Column(
                            children: [
                             
                                  ListTile(
                                    title: const Text(
                                      'Nouveau_né',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    leading: Radio(
                                      value: 'Nouveau_né',
                                      activeColor: const Color(0xFFc9b079),
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value as String;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text(
                                      'Mort-né',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    leading: Radio(
                                      value: 'Mort-né',
                                      activeColor: const Color(0xFFc9b079),
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value as String;
                                        });
                                      },
                                    ),
                                  ),
                               
                              _buildTextField(
                                  label: 'Nombre de jours vécus',
                                  keyboardType:
                                      const TextInputType.numberWithOptions()),
                                         ]
                            ,)
                        ),
                              const SizedBox(height: 10),
                             const Padding(padding: EdgeInsets.only(left: 10),child:  Text(
                                'Grossesse multiple ?',
                               
                                style: TextStyle(fontSize: 17,fontWeight: FontWeight.w900),
                              ),),
                              ListTile(
                                title: const Text(
                                  'Oui',
                                  style: TextStyle(fontSize: 16),
                                ),
                                leading: Radio(
                                  value: 'Oui',
                                     activeColor: const Color(0xFFc9b079),
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value as String;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text(
                                  'Non',
                                  style: TextStyle(fontSize: 16),
                                ),
                                leading: Radio(
                                  value: 'Non',
                                    activeColor: const Color(0xFFc9b079),
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value as String;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text(
                                  'Inconnue',
                                  style: TextStyle(fontSize: 16),
                                ),
                                leading: Radio(
                                  value: 'Inconnue',
                                  activeColor: const Color(0xFFc9b079),
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value as String;
                                    });
                                  },
                                ),
                              ),
                              _buildTextField(
                                  label: 'Poids à la naissance)',
                                  keyboardType:
                                      const TextInputType.numberWithOptions()),
                         
                              const SizedBox(height: 15),
                             const Padding(padding: EdgeInsets.only(left: 10),child:  Text(
                                '+Données personnelles de la mère',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF014a71),
                                ),
                              ),),
                              _buildTextField(label: 'Nom complet'),
                              _buildTextField(
                                  label: 'Nom complet en Arabe'),
                              _buildTextField(
                                  label: 'Date de naissance'),
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
                                  label: 'Numéro de pièce d\'identité'),
                              const SizedBox(height: 14),
                             
                             const Padding(padding: EdgeInsets.only(left: 10),
                              child:  Text(
                                '+Données d\'adresse',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF014a71),
                                ),
                              ),
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
                              _buildTextField(label: 'Adresse du décès'),
                              // ignore: equal_elements_in_set
                              const SizedBox(height: 10),
                               IconButton(onPressed: (){
                                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RapportDeDeces(),
                                ),
                              );
                               },   icon: Icon(
                              Icons.arrow_right,
                             size: 80,
                           color: isPressed
                                ? const Color(0xFF014a71) : (isHovered
                                ? const Color.fromARGB(255, 115, 93, 55)
                                : const Color(0xFFc9b079)),
                         ), )
                            
                        
                      },
                     
                    ],
                    
                  ),
                
                ),
               
              ],
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

  Widget _buildTextField({
    required String label,
    TextInputType? keyboardType,
  }) {
    return Container(
      padding: const EdgeInsets.only(right: 40, left: 10),
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: '$label ',
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 54, 54, 54),
            fontSize: 17,
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xFF014a71)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xFF014a71)),
          ),
          // contentPadding:
          //     const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
      ),
    );
  }

  Widget _buildDateTextField({required String label}) {
    return Container(
      padding: const EdgeInsets.only(right: 40, left: 10),
      child: TextField(
        controller: dateNaissanceController,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 54, 54, 54),
            fontSize: 17,
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xFF014a71)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xFF014a71)),
          ),
          // contentPadding:
          //     const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: _selectedDate,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              ).then((selectedDate) {
                if (selectedDate != null) {
                  setState(() {
                    _selectedDate = selectedDate;
                    dateNaissanceController.text =
                        DateFormat('yyyy-MM-dd').format(selectedDate);
                  });
                }
              });
            },
          ),
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
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(right: 32),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
            hintText: label,
            hintStyle: const TextStyle(
                color: Color.fromARGB(255, 54, 54, 54), fontSize: 17),
            border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF014a71))),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF014a71))),
          ),
          iconSize: 30,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 2,
      height: 50,
      color: const Color(0xFFc9b079),
    );
  }
}