// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Flutter GPS Demo',
//       home: GPSActivationPage(),
//     );
//   }
// }

// class GPSActivationPage extends StatefulWidget {
//   const GPSActivationPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _GPSActivationPageState createState() => _GPSActivationPageState();
// }

// class _GPSActivationPageState extends State<GPSActivationPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter GPS Demo'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _askPermissionAndActivateGPS();
//           },
//           child: const Text('Activer le GPS'),
//         ),
//       ),
//     );
//   }

//   void _askPermissionAndActivateGPS() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // L'utilisateur a refusé l'accès à la localisation
//         return;
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       // L'utilisateur a définitivement refusé l'accès à la localisation
//       return;
//     }
//     // L'utilisateur a donné l'autorisation d'accéder à la localisation
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Le service de localisation n'est pas activé, demander à l'utilisateur de l'activer
//       bool serviceRequested = await Geolocator.openLocationSettings();
//       if (!serviceRequested) {
//         // L'utilisateur a annulé la demande d'activation du service de localisation
//         return;
//       }
//     }
//     // Le GPS est activé et l'autorisation est accordée
//     // Afficher un message à l'utilisateur
//     // ignore: use_build_context_synchronously
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Le GPS est activé !'),
//       ),
//     );
//   }
// }
