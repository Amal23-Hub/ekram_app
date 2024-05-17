import 'package:flutter/material.dart';
// ignore: unused_import
import 'change_passwd.dart';
// ignore: camel_case_types
class Recupere_pass extends StatefulWidget {
  const Recupere_pass({super.key});

  @override
  State<Recupere_pass> createState() => _Recupere_passState();
}

// ignore: camel_case_types
class _Recupere_passState extends State<Recupere_pass> {
  final TextEditingController resetpassword = TextEditingController();

  bool isHovered = false;
  bool isPressed = false;

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
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCircleButton('1', const Color(0xFFc9b079)),
                  const SizedBox(width: 3),
                  Container(
                    width: 75,
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 3),
                  _buildCircleButton('2', const Color(0xFF014a71)),
                  const SizedBox(width: 3),
                  Container(
                    width: 75,
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 3),
                  _buildCircleButton('3', const Color(0xFFc9b079)),
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                'Récupération de mot de passe',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: Center(
                  child: Text(
                    'Veuillez saisir le code :',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
  child: Row(
    children: List.generate(6, (index) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Bordure grise
            borderRadius: BorderRadius.circular(5.0), // Coins arrondis
          ),
          child: TextFormField(
            controller: TextEditingController(), // Contrôleur pour chaque champ
            maxLength: 1, // Longueur maximale de saisie d'un caractère
            textAlign: TextAlign.center, // Centrer le texte
            keyboardType: TextInputType.number, // Clavier numérique
            decoration: const InputDecoration(
              counterText: "", // Pas de texte de compteur
              border: InputBorder.none, // Pas de bordure
              hintText: "*", // Texte d'aide
              hintStyle: TextStyle(color: Colors.grey), // Couleur grise pour le texte d'aide
              contentPadding: EdgeInsets.zero, // Aucun rembourrage interne
            ),
            onChanged: (value) {
              if (value.length == 1) {
                // Focus sur le champ suivant
                FocusScope.of(context).nextFocus();
              }
                    },
                  ),
                ),
              );
            }),
          ),
        ),
              const SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 50),
                      backgroundColor: isPressed
                          ? const Color(0xFF014a71)
                          : (isHovered
                          ? const Color.fromARGB(255, 78, 55, 115)
                          : const Color(0xFFc9b079)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Change_passwd()));
                    },
                    onHover: (hovered) {
                      setState(() {
                        isHovered = hovered;
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        isPressed = !isPressed;
                      });
                    },
                    child: const Text(
                      'Suivant',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircleButton(String text, Color color) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
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
}
