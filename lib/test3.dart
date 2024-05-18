// // ignore_for_file: library_private_types_in_public_api, avoid_print

// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(const IkramApp());
// }

// class IkramApp extends StatelessWidget {
//   const IkramApp({super.key});
  
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DropdownButtonExample(),
//     );
//   }
// }

// class DropdownButtonExample extends StatefulWidget {
//   const DropdownButtonExample({super.key});

//   @override
//   _DropdownButtonExampleState createState() => _DropdownButtonExampleState();
// }

// class _DropdownButtonExampleState extends State<DropdownButtonExample> {
//   String? _selectedOption1; // Aucune option sélectionnée par défaut pour le premier champ
//   String? _selectedOption2; // Aucune option sélectionnée par défaut pour le deuxième champ
//   String? _selectedOption3; // Aucune option sélectionnée par défaut pour le troisième champ
//   String? _selectedOption4; // Aucune option sélectionnée par défaut pour le quatrième champ
//   String? _selectedOption5; // Aucune option sélectionnée par défaut pour le cinquième champ
//   List<dynamic> _options1 = []; // Liste pour stocker les options du premier champ
//   List<dynamic> _options2 = []; // Liste pour stocker les options du deuxième champ
//   List<dynamic> _options3 = []; // Liste pour stocker les options du troisième champ
//   List<dynamic> _options4 = []; // Liste pour stocker les options du quatrième champ
//   List<dynamic> _options5 = []; // Liste pour stocker les options du cinquième champ

//   @override
//   void initState() {
//     super.initState();
//     _fetchOptions(); // Appeler la fonction pour récupérer les options du premier champ dès que le widget est créé
//     _fetchOptions2(); // Appeler la fonction pour récupérer les options du deuxième champ dès que le widget est créé
//     _fetchOptions3(); // Appeler la fonction pour récupérer les options du troisième champ dès que le widget est créé
//     _fetchOptions4(); // Appeler la fonction pour récupérer les options du quatrième champ dès que le widget est créé
//     _fetchOptions5(); // Appeler la fonction pour récupérer les options du cinquième champ dès que le widget est créé
//   }

//   Future<void> _fetchOptions() async {
//     try {
//       final response = await http.get(Uri.parse('http://98.71.95.115/referential-api/status?roles=Observer'));
//       if (response.statusCode == 200) {
//         setState(() {
//           _options1 = json.decode(response.body);
//         });
//       } else {
//         throw Exception('Failed to load options');
//       }
//     } catch (error) {
//       print(error);
//     }
//   }

//   Future<void> _fetchOptions2() async {
//     try {
//       final response = await http.get(Uri.parse('http://98.71.95.115/referential-api/death_place'));
//       if (response.statusCode == 200) {
//         setState(() {
//           _options2 = json.decode(response.body);
//         });
//       } else {
//         throw Exception('Failed to load options');
//       }
//     } catch (error) {
//       print(error);
//     }
//   }

//   Future<void> _fetchOptions3() async {
//     try {
//       final response = await http.get(Uri.parse('http://98.71.95.115/referential-api/administrative-hierarchies/1'));
//       if (response.statusCode == 200) {
//         setState(() {
//           _options3 = json.decode(response.body);
//         });
//       } else {
//         throw Exception('Failed to load options');
//       }
//     } catch (error) {
//       print(error);
//     }
//   }

//   Future<void> _fetchOptions4() async {
//     try {
//       final response = await http.get(Uri.parse('http://98.71.95.115/referential-api/affiliations'));
//       if (response.statusCode == 200) {
//         setState(() {
//           _options4 = json.decode(response.body);
//         });
//       } else {
//         throw Exception('Failed to load options');
//       }
//     } catch (error) {
//       print(error);
//     }
//   }

//   Future<void> _fetchOptions5() async {
//     try {
//       final response = await http.get(Uri.parse('http://98.71.95.115/referential-api/death-causes/by-type?isExternal=false'));
//       if (response.statusCode == 200) {
//         setState(() {
//           _options5 = json.decode(response.body);
//         });
//       } else {
//         throw Exception('Failed to load options');
//       }
//     } catch (error) {
//       print(error);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dropdown Button Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               margin: const EdgeInsets.only(bottom: 20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.grey),
//               ),
//               child: DropdownButtonFormField<String>(
//                 value: _selectedOption1,
//                 decoration: const InputDecoration(
//                   hintText: 'Sélectionner une option',
//                   border: InputBorder.none,
//                 ),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedOption1 = newValue;
//                   });
//                 },
//                 items: _options1.map<DropdownMenuItem<String>>((dynamic option) {
//                   return DropdownMenuItem<String>(
//                     value: option['nameFr'],
//                     child: Text(option['nameFr']),
//                   );
//                 }).toList(),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               margin: const EdgeInsets.only(bottom: 20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.grey),
//               ),
//               child: DropdownButtonFormField<String>(
//                 value: _selectedOption2,
//                 decoration: const InputDecoration(
//                   hintText: 'Sélectionner une option',
//                   border: InputBorder.none,
//                 ),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedOption2 = newValue;
//                   });
//                 },
//                 items: _options2.map<DropdownMenuItem<String>>((dynamic option) {
//                   return DropdownMenuItem<String>(
//                     value: option['nameFr'],
//                     child: Text(option['nameFr']),
//                   );
//                 }).toList(),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               margin: const EdgeInsets.only(bottom: 20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.grey),
//               ),
//               child: DropdownButtonFormField<String>(
//                 value: _selectedOption3,
//                 decoration: const InputDecoration(
//                   hintText: 'Sélectionner une optio',
//                   border: InputBorder.none,
//                 ),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedOption3 = newValue;
//                   });
//                 },
//                 items: _options3.map<DropdownMenuItem<String>>((dynamic option) {
//                   return DropdownMenuItem<String>(
//                     value: option['nameFr'],
//                     child: Text(option['nameFr']),
//                   );
//                 }).toList(),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               margin: const EdgeInsets.only(bottom: 20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.grey),
//               ),
//               child: DropdownButtonFormField<String>(
//                 value: _selectedOption4,
//                 decoration: const InputDecoration(
//                   hintText: 'Sélectionner une option',
//                   border: InputBorder.none,
//                 ),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedOption4 = newValue;
//                   });
//                 },
//                 items: _options4.map<DropdownMenuItem<String>>((dynamic option) {
//                   return DropdownMenuItem<String>(
//                     value: option['nameFr'],
//                     child: Text(option['nameFr']),
//                   );
//                 }).toList(),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.grey),
//               ),
//               child: DropdownButtonFormField<String>(
//                 value: _selectedOption5,
//                 decoration: const InputDecoration(
//                   hintText: 'Sélectionner une option',
//                   border: InputBorder.none,
//                 ),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedOption5 = newValue;
//                   });
//                 },
//                 items: _options5.map<DropdownMenuItem<String>>((dynamic option) {
//                   return DropdownMenuItem<String>(
//                     value: option['nameFr'],
//                     child: Text(option['nameFr']),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
