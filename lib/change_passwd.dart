import 'package:flutter/material.dart';

// ignore: camel_case_types
class Change_passwd extends StatefulWidget {
  const Change_passwd({super.key});

  @override
  State<Change_passwd> createState() => _Change_passwdState();
}

// ignore: camel_case_types
class _Change_passwdState extends State<Change_passwd> {
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
                  _buildCircleButton('2', const Color(0xFFc9b079)),
                  const SizedBox(width: 3),
                  Container(
                    width: 75,
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 3),
                  _buildCircleButton('3', const Color(0xFF014a71)),
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
              const SizedBox(height: 20),
             const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: Column(
                children: [
                  TextField(
                    obscureText: true, 
                    decoration: InputDecoration(
                      labelText: 'Nouveau mot de passe',
                      prefixIcon: Icon(Icons.lock), 
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF014a71)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10), 
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirmer le mot de passe',
                      prefixIcon: Icon(Icons.lock),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF014a71)),
                      ),
                    ),
                  ),
                ],
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
                    onPressed: () {},
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
