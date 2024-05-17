// // ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';

// class Test extends StatefulWidget {
//   const Test({Key? key});

//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   File? _file;
//   bool _isSelected = false;

//   void _openFileExplorer() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx'], // Extensions autorisées
//     );

//     if (result != null) {
//       setState(() {
//         _file = File(result.files.single.path!);
//         _isSelected = true; // Marquer comme sélectionné
//       });
//     }
//   }

//   void _showImageDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         content: _file != null && _file!.path.endsWith('.jpg') || _file!.path.endsWith('.jpeg') || _file!.path.endsWith('.png')
//             ? Image.file(_file!)
//             : const Text('Le fichier sélectionné n\'est pas une image.'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: const Text('Fermer'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('File Picker Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (_isSelected)
//               GestureDetector(
//                 onTap: _showImageDialog,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width * 0.8,
//                   height: 40,
//                   color: const Color.fromARGB(255, 219, 217, 202),
//                   child: Row(
//                     children: [
//                       const Icon(Icons.image,size: 35,color: Color(0xFF014a71)),
//                       const SizedBox(width: 5),
//                       Expanded(
//                         child: Text(
//                           'Fichier sélectionné :\n${_file!.path}',
//                           textAlign: TextAlign.center,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             const SizedBox(height: 20.0),
//             TextButton(
//               onPressed: _openFileExplorer,
//               child:const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:[
//                   Icon(Icons.file_upload),
//                   SizedBox(width: 5),
//                   Text('Sélectionner un fichier'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// ignore_for_file: depend_on_referenced_packages, avoid_unnecessary_containers
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class GPSStatusPage extends StatefulWidget {
//   const GPSStatusPage({Key? key}) : super(key: key);

//   @override
//   _GPSStatusPageState createState() => _GPSStatusPageState();
// }

// class _GPSStatusPageState extends State<GPSStatusPage> {
//   late bool isGPSEnabled;

//   @override
//   void initState() {
//     super.initState();
//     checkGPSStatus();
//   }

//   Future<void> checkGPSStatus() async {
//     bool isEnabled = await Geolocator.isLocationServiceEnabled();
//     setState(() {
//       isGPSEnabled = isEnabled;
//     });
//   }

//   Future<void> requestGPSEnabling() async {
//     await Geolocator.openLocationSettings();
//     // Attendre que l'utilisateur active le GPS
//     await Future.delayed(const Duration(seconds: 5));
//     // Vérifier à nouveau le statut du GPS après un délai de 5 secondes
//     await checkGPSStatus();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('GPS Status'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'GPS is ${isGPSEnabled ? 'enabled' : 'disabled'}.',
//               style: const TextStyle(fontSize: 20),
//             ),
//             const SizedBox(height: 20),
//             if (isGPSEnabled)
//               ElevatedButton(
//                 onPressed: () {
//                   // Code à exécuter lorsque le GPS est déjà activé
//                 },
//                 child: const Text('GPS is already enabled'),
//               ),
//             if (!isGPSEnabled)
//               ElevatedButton(
//                 onPressed: requestGPSEnabling,
//                 child: const Text('Activate GPS'),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: const Color.fromARGB(255, 162, 134, 72),
        color: const Color.fromARGB(255, 162, 134, 72),
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[
          Icon(Icons.message, size: 26, color: Color(0xFF014a71)),
          Icon(Icons.notifications, size: 26, color: Color(0xFF014a71)),
          Icon(Icons.person, size: 26, color: Color(0xFF014a71)),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Center(
        child: Text(
          _page.toString(),
          style: const TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}