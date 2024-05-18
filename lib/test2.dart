// // ignore_for_file: library_private_types_in_public_api, prefer_interpolation_to_compose_strings

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:file_picker/file_picker.dart';
// // ignore: use_key_in_widget_constructors
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String _filePath = 'No file selected';
//   String _fileContent = '';

//   Future<void> _pickFile() async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles();
//       if (result != null) {
//         File file = File(result.files.single.path!);
//         String content = await file.readAsString();
//         setState(() {
//           _filePath = result.files.single.path!;
//           _fileContent = content;
//         });
//       }
//     } on PlatformException catch (e) {
//       // ignore: avoid_print
//       print("Unsupported operation" + e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('File Picker Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'Selected File:',
//             ),
//             const SizedBox(height: 20),
//             InkWell(
//               onTap: () {
//                 // Afficher le contenu du fichier sélectionné
//                 showDialog(
//                   context: context,
//                   builder: (_) => AlertDialog(
//                     title: const Text('File Content'),
//                     content: SingleChildScrollView(
//                       child: Text(_fileContent),
//                     ),
//                     actions: <Widget>[
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text('Close'),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               child: Text(
//                 _filePath,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                   decoration: TextDecoration.underline,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _pickFile,
//               child: const Text('Select File'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
