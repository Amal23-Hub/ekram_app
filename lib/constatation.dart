// ignore_for_file: use_super_parameters, unused_element

import 'package:flutter/material.dart';

class RapportDeDeces extends StatefulWidget {
  const RapportDeDeces({Key? key}) : super(key: key);

  @override
  State<RapportDeDeces> createState() => _RapportDeDecesState();
}

class _RapportDeDecesState extends State<RapportDeDeces> {
  bool isHovered = false;
  bool isPressed = false;

  String _nouveauNeValue = 'Non';
  final TextEditingController _causeController = TextEditingController();
  final TextEditingController _intervalleController = TextEditingController();

  String choice = ''; 
  TextEditingController textField1Controller = TextEditingController();
  TextEditingController textField2Controller = TextEditingController();

  String? _selectedTypeIntervalle;
  String? _selectedCirconstanceDeces;

  final List<String> _typeIntervalle = ['Années', 'Mois', 'Jours', 'Heures'];

  final List<String> _circonstanceDeces = ['Maladie', 'Autre'];

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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _buildCircleButtons(),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: _buildFormFields(context),
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

  Widget _buildCircleButtons() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          _buildCircleButton('1', const Color.fromARGB(255, 136, 194, 201)),
          _buildDivider(),
          _buildCircleButton('2', const Color.fromARGB(255, 136, 194, 201)),
          _buildDivider(),
          _buildCircleButton('3', const Color.fromARGB(255, 136, 194, 201)),
          _buildDivider(),
          _buildCircleButton('4', const Color(0xFF014a71)),
          _buildDivider(),
          _buildCircleButton('5', const Color.fromARGB(255, 136, 194, 201)),
        ],
      ),
    );
  }

  Widget _buildCircleButton(String text, Color color) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 5),
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
      width: 2,
      height: 50,
      color: const Color(0xFFc9b079),
    );
  }

  List<Widget> _buildFormFields(BuildContext context) {
    return [
      const SizedBox(height: 70),
      const Text(
        "Compléter la constatation",
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: Color(0xFFc9b079),
        ),
      ),
      const SizedBox(height: 10),
      Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 10,),
            child: Column(
              children: [
               
                Text(
                  'Y a-t-il un obstacle médico-légal (OML) dans cette situation?',
                  style: TextStyle(
                      color: Color.fromARGB(255, 112, 109, 109),
                      fontSize: 15,
                      // fontWeight: FontWeight.bold
                      ),
                ),
              ],
            ),
          ),
          Row(
            children: [
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
              const Text('Oui', style: TextStyle(fontSize: 16),),
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
              const Text('Non', style: TextStyle(fontSize: 16),),
            ],
          ),
        ],
      ),
     
      Padding(
        padding: const EdgeInsets.only(right: 30, left: 10),
        child: TextField(
          controller: _causeController,
          decoration: const InputDecoration(
            hintText: 'Causes de décès',
            hintStyle: TextStyle(
            color: Color.fromARGB(255, 54, 54, 54),
            fontSize: 17,
          ),
              border: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xFF014a71)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xFF014a71)),
          ),
          ),
        ),
      ),
      const SizedBox(height: 5),
      Padding(
        padding: const EdgeInsets.only(right: 30, left: 10),
        child: TextField(
          controller: _intervalleController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'L\'intervalle',
            hintStyle: TextStyle(
            color: Color.fromARGB(255, 54, 54, 54),
            fontSize: 17,
          ),
              border: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xFF014a71)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xFF014a71)),
          ),
          ),
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
      const SizedBox(height: 10),
      Padding(
          padding: const EdgeInsets.only(left: 200, right: 10),
          child: IconButton(
            onPressed: () {
              setState(() {
                isPressed = !isPressed;
              });
            },
            icon: Icon(
              isPressed ? Icons.add_circle : Icons.add_circle_outline,
              size: 40,
              color: const Color(0xFF014a71),
            ),
          ),
        ),

  
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text('John Doe'),
        subtitle: const Text('com'),
        trailing: const Icon(Icons.delete),
        onTap: () {},
      ),
      const SizedBox(height: 20),
      const Text(
        '+Informations complémentaires',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF014a71),
        ),
      ),
      const SizedBox(height: 16),
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
      const SizedBox(height: 20),
      const Row(
        children: [
          Text(
            'Intervention chirurgicale récente',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
         
        ],
      ),
      const  SizedBox(height: 5),
      const Text(
        'Une opération a-t-elle été effectuée au cours des 4 dernières semaines?',
        // textAlign: TextAlign.center,
         style: TextStyle(
                      color: Color.fromARGB(255, 112, 109, 109),
                      fontSize: 15,
                      // fontWeight: FontWeight.bold
                      ),
      ),
      RadioListTile(
        title: const Text('Oui',style: TextStyle(fontSize: 16),),
        value: 'oui',
        activeColor: const Color(0xFFc9b079),
        groupValue: choice,
        onChanged: (value) {
          setState(() {
            choice = value as String;
          });
        },
      ),
      RadioListTile(
        title: const Text('Non',style: TextStyle(fontSize: 16),),
        value: 'non',
        activeColor: const Color(0xFFc9b079),
        groupValue: choice,
        onChanged: (value) {
          setState(() {
            choice = value as String;
          });
        },
      ),
      RadioListTile(
        title: const Text('Inconnu',style: TextStyle(fontSize: 16),),
        value: 'inconnu',
        groupValue: choice,
        activeColor: const Color(0xFFc9b079),
        onChanged: (value) {
          setState(() {
            choice = value as String;
          });
        },
      ),
      if (choice == 'oui') ...[
       
         _buildDateTextField(label:'Date de l\'opération' ),
         const SizedBox(height: 10),
         _buildTextField(label:'Motif de l\'opération'),
     
      ],
      const SizedBox(height: 20),
    ];
  }

  Widget _buildTextField({required String label}) {
    return Container(
      padding: const EdgeInsets.only(right: 40, left: 10),
      child: TextField(
        
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
      ),
    );
  }

  Widget _buildDateTextField({required String label}) {
    return Container(
      padding: const EdgeInsets.only(right: 40, left: 10),
      child: TextField(
        controller: textField1Controller,
        decoration: InputDecoration(
          // ignore: unnecessary_string_interpolations
          hintText: '$label',
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              showDatePicker(
                context: context,
              
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              ).then((selectedDate) {
                if (selectedDate != null) {
                  setState(() {
                   
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
     
      padding: const EdgeInsets.only(right: 20, left: 5),
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
}