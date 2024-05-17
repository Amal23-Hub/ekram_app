import 'package:flutter/material.dart';
import 'login.dart';
import 'recupere_pass.dart';
// ignore: camel_case_types
class Reset_Password extends StatefulWidget {
  const Reset_Password({super.key});

  @override
  State<Reset_Password> createState() => _Reset_PasswordState();
}

// ignore: camel_case_types
class _Reset_PasswordState extends State<Reset_Password> {
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
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCircleButton('1', const Color(0xFF014a71)),
             const SizedBox(width: 3,),
            Container(
                 width: 75,
                  height: 1,
                  color: Colors.black,
                  ),
                  const SizedBox(width: 3,),
            _buildCircleButton('2', const Color(0xFFc9b079)), 
            const SizedBox(height: 2,),
            Container(
                 width: 75,
                  height: 1,
                  color: Colors.black,
                  ),
                  const SizedBox(width: 3,),
            _buildCircleButton('3', const Color(0xFFc9b079)), 
          ],
        ),
              const SizedBox(height: 50,),
              const Text(
                'Récupération de mot de passe',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
                const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Pour réinitialiser votre mot de passe, veuillez fournir les informations suivantes :',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: TextField(
                  controller: resetpassword,
                  focusNode: FocusNode(), 
                  decoration: InputDecoration(
                    labelText: 'Adresse e-mail',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: resetpassword.text.isNotEmpty
                          ? const Color(0xFF014a71)
                          : Colors.black,
                    ),
                    prefixIcon: const Icon(Icons.person),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF014a71)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF014a71),
                      fixedSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  const Login()));
                    },
                    child: const Text(
                      'Annuler',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Recupere_pass()));
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
