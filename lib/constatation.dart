// ignore_for_file: unused_field, unused_element, use_super_parameters

import 'package:flutter/material.dart';
// import 'confirmation.dart';

class RapportDeDeces extends StatefulWidget {
  const RapportDeDeces({Key? key}) : super(key: key);

  @override
  State<RapportDeDeces> createState() => _RapportDeDecesState();
}

class _RapportDeDecesState extends State<RapportDeDeces> {
  bool isHovered = false;
  bool isPressed = false;
  final List<Map<String, String>> _valuesSaisies = [];

  bool _erreurCause = false;
  bool _erreurIntervalle = false;
  bool _erreurTypeIntervalle = false;

  String choice = '';
  String? _cause;
  String? _intervalle;

  String _nouveauNeValue = 'Non';
  final TextEditingController _causeController = TextEditingController();
  final TextEditingController _intervalleController = TextEditingController();
  final TextEditingController _dateOperationController =
      TextEditingController();
  final TextEditingController _motifOperationController =
      TextEditingController();
  final TextEditingController dateSurvenueController = TextEditingController();

  String? _selectedTypeIntervalle;
  String? _selectedCirconstanceDeces;

  final List<String> _typeIntervalle = ['Années', 'Mois', 'Jours', 'Heures'];
  final List<String> _lieuSurvenue = [
    'Domicile',
    'Etablissement collectif',
    'Ecole/administration public',
    'Lieu de sport',
    'Voie publique',
    'Zone de commerce / service',
    'Local industriel /chantier',
    'Exploitation agricole',
    'Autre'
  ];
  String? _selectedLieuSurvenue;

  final List<String> _circonstanceDeces = [
    'Maladie',
    'Suicide',
    'Accident',
    'Homicide',
    'Intention indéterminée'
  ];
  // Définir une méthode pour vérifier si tous les champs sont remplis
  bool _tousChampsRemplis() {
    return _causeController.text.isNotEmpty &&
        _intervalleController.text.isNotEmpty &&
        _selectedTypeIntervalle != null;
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
                            "Compléter la constatation",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 82, 53, 43),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: const Text(
                              'Y a-t-il un obstacle médico-légal (OML) dans cette situation?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 54, 54, 54),
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 37),
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: 'Oui',
                                  groupValue: _nouveauNeValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _nouveauNeValue = value ?? '';
                                    });
                                  },
                                  activeColor: const Color(0xFFc9b079),
                                ),
                                const Text('Oui',
                                    style: TextStyle(fontSize: 16)),
                                Radio<String>(
                                  value: 'Non',
                                  groupValue: _nouveauNeValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _nouveauNeValue = value ?? '';
                                    });
                                  },
                                  activeColor: const Color(0xFFc9b079),
                                ),
                                const Text('Non',
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Container(height: 2, color: Colors.black12),
                          const SizedBox(height: 20),
                          const Text(
                            '+Causes de décès',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF014a71),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                _buildTextField(
                                  label: 'La cause',
                                  controller: _causeController,
                                  onChanged: (value) {
                                    setState(() {
                                      _cause = value;
                                    });
                                  },
                                ),
                                if (_erreurCause)
                                  const Text(
                                    'Ce champ est obligatoire',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                _buildTextField(
                                  label: 'L\'intervalle',
                                  controller: _intervalleController,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(),
                                  onChanged: (value) {
                                    setState(() {
                                      _intervalle = value;
                                    });
                                  },
                                ),
                                if (_erreurIntervalle)
                                  const Text(
                                    'Ce champ est obligatoire',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                _buildDropdownButtonFormField(
                                  label: 'Type de l\'intervalle',
                                  items: _typeIntervalle,
                                  value: _selectedTypeIntervalle,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedTypeIntervalle = value;
                                    });
                                  },
                                ),
                                if (_erreurTypeIntervalle)
                                  const Text(
                                    'Ce champ est obligatoire',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                // Ajoutez ici d'autres champs avec leurs messages d'erreur
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isPressed
                                        ? const Color(0xFFc9b079)
                                        : (isHovered
                                            ? const Color(0xFFc9b079)
                                            : const Color(0xFFc9b079)),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      // Réinitialisez les états des erreurs à false
                                      _erreurCause = false;
                                      _erreurIntervalle = false;
                                      _erreurTypeIntervalle = false;

                                      // Vérifiez chaque champ et définissez l'état d'erreur approprié s'il est vide
                                      if (_causeController.text.isEmpty) {
                                        _erreurCause = true;
                                      }

                                      if (_intervalleController.text.isEmpty) {
                                        _erreurIntervalle = true;
                                      }

                                      if (_selectedTypeIntervalle == null) {
                                        _erreurTypeIntervalle = true;
                                      }

                                      // Si au moins un champ est vide, ne faites rien
                                      if (_erreurCause ||
                                          _erreurIntervalle ||
                                          _erreurTypeIntervalle) {
                                        return;
                                      }

                                      // Sinon, ajoutez les données comme avant
                                      _valuesSaisies.add({
                                        'Cause': _causeController.text,
                                        'Intervalle':
                                            _intervalleController.text,
                                        'Type d\'intervalle':
                                            _selectedTypeIntervalle ?? '',
                                      });

                                      _causeController.clear();
                                      _intervalleController.clear();
                                      _selectedTypeIntervalle = null;
                                    });
                                  },
                                  child: const Center(
                                    child: Text(
                                      'Ajouter',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                if (_valuesSaisies.isNotEmpty) ...[
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _valuesSaisies.length,
                                    itemBuilder: (context, index) {
                                      final row = _valuesSaisies[index];
                                      return _buildTableRow(
                                          row['Cause'],
                                          row['Intervalle'],
                                          row['Type d\'intervalle']);
                                    },
                                  ),
                                ],
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Container(height: 2, color: Colors.black12),
                          const SizedBox(height: 20),
                          const Text(
                            '+Informations complémentaires',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF014a71),
                            ),
                          ),
                          _buildDropdownButtonFormField(
                            label: 'Circonstance du décès',
                            items: _circonstanceDeces,
                            value: _selectedCirconstanceDeces,
                            onChanged: (value) {
                              setState(() {
                                _selectedCirconstanceDeces = value;
                              });
                            },
                          ),
                          const SizedBox(height: 25),
                          Container(height: 2, color: Colors.black12),
                          const SizedBox(height: 20),
                          const Text(
                            '+En cas de cause externe',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF014a71),
                            ),
                          ),
                          _buildDateTextField(
                            label: 'Date du décès',
                            controller: dateSurvenueController,
                            onTap: () => _selectedDate(context),
                          ),
                          _buildDropdownButtonFormField(
                            label: 'Lieu de survenue',
                            items: _lieuSurvenue,
                            value: _selectedLieuSurvenue,
                            onChanged: (value) {
                              setState(() {
                                _selectedLieuSurvenue = value;
                              });
                            },
                          ),
                          const SizedBox(height: 25),
                          Container(height: 2, color: Colors.black12),
                          const SizedBox(height: 20),
                          const Text(
                            '+Intervention chirurgicale récente',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF014a71),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 15),
                            child: const Text(
                              'Une opération a-t-elle été effectuée au cours des 4 dernières semaines?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 54, 54, 54),
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                value: 'oui',
                                groupValue: choice,
                                onChanged: (value) {
                                  setState(() {
                                    choice = value!;
                                  });
                                },
                                activeColor: const Color(0xFFc9b079),
                              ),
                              const Text(
                                'Oui',
                                style: TextStyle(fontSize: 16),
                              ),
                              Radio<String>(
                                value: 'non',
                                groupValue: choice,
                                onChanged: (value) {
                                  setState(() {
                                    choice = value!;
                                  });
                                },
                                activeColor: const Color(0xFFc9b079),
                              ),
                              const Text(
                                'Non',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          if (choice == 'oui') ...[
                            _buildDateTextField(
                              label: 'Date de l\'opération',
                              controller: _dateOperationController,
                              onTap: () => _selectedDate(context),
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              label: 'Motif de l\'opération',
                              controller: _motifOperationController,
                            ),
                          ],
                          Container(
                            margin: const EdgeInsets.only(
                                left: 70, right: 70, top: 20),
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF014a71),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                              onPressed: () {
                            //  Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //             builder: (context) =>
                            //                 const NextPage(),
                            //           ),
                            //         );
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
    );
  }

  Widget _buildCircleButton(String text, Color color) {
    return Container(
      width: 40,
      height: 35,
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
          _buildCircleButton2(const Icon(
            Icons.verified,
            size: 27,
          )),
          _buildDivider(),
          _buildCircleButton('4', const Color.fromARGB(255, 82, 53, 43)),
          _buildDivider(),
          _buildCircleButton('5', const Color.fromARGB(255, 189, 184, 182)),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
    void Function(String)? onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: TextField(
        controller: controller,
        keyboardType:
            keyboardType ?? TextInputType.text, // Ajout de la valeur par défaut
        onChanged: onChanged != null
            ? (value) => onChanged(value)
            : null, // Vérification pour onChanged
        decoration: InputDecoration(
          labelText: '$label *',
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
    );
  }

  Widget _buildDateTextField(
      {required String label,
      required TextEditingController controller,
      required VoidCallback onTap}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
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
            child: Text(item),
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
      ),
    );
  }

  Future<void> _selectedDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        dateSurvenueController.text = picked.toString().split(" ")[0];
        _dateOperationController.text = picked.toString().split(" ")[0];
      });
    }
  }
}

Widget _buildTableRow(
    String? cause, String? intervalle, String? typeIntervalle) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          title: Text('Cause: ${cause ?? ''}'),
        ),
        ListTile(
          title: Text('Intervalle: ${intervalle ?? ''}'),
        ),
        ListTile(
          title: Text('Type d\'intervalle: ${typeIntervalle ?? ''}'),
        ),
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