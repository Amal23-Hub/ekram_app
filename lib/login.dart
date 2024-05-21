import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Accueil.dart';
import 'forgot_password.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isHovered = false;
  bool isPressed = false;
  bool showUsernameError = false;
  bool showPasswordError = false;
  String usernameErrorMessage = '';
  String passwordErrorMessage = '';
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  bool isArabic = false;
  bool obscurePassword = true;

  @override
  void dispose() {
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                
                  children: _buildWidgets(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildWidgets(BuildContext context) {
    return [
      
      Image.asset('images/ekram_logo2.png', height: 180, width: 290),
     const SizedBox(height: 35),
      TextField(
        controller: usernameController,
        focusNode: usernameFocusNode,
        decoration: InputDecoration(
          hintText: isArabic ? 'اسم المستخدم' : 'Nom d\'utilisateur',
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          
          ),
          prefixIcon: const Icon(Icons.person),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF014a71)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorText: showUsernameError ? usernameErrorMessage : null,
          suffixIcon: showUsernameError
              ? const Icon(Icons.error, color: Color.fromARGB(255, 173, 52, 43))
            : null,
        ),
      ),
      const SizedBox(height: 22),
      TextField(
        controller: passwordController,
        focusNode: passwordFocusNode,
        decoration: InputDecoration(
          hintText: isArabic ? 'كلمة السر' : 'Mot de passe',
           hintStyle: const TextStyle(
            fontWeight: FontWeight.w600,
             color: Colors.black,
            
          ),
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon:
                Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF014a71)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorText: showPasswordError ? passwordErrorMessage : null,
        ),
        obscureText: obscurePassword,
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Reset_Password()));
            },
            child: Text(
              isArabic ? 'هل نسيت كلمة السر؟' : 'Mot de passe oublié ?',
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 71, 42, 32),
              ),
            ),
            
          ),
        ),
      ),
      const SizedBox(height: 22,),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              isHovered = false;
            });
          },
          
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: isPressed
                  ? const Color.fromARGB(255, 138, 152, 160)
                  : (isHovered ? const Color.fromARGB(255, 82, 53, 43): const Color.fromARGB(255, 82, 53, 43)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: Size(MediaQuery.of(context).size.width, 59),
            ),
            onPressed: () async {
              setState(() {
                isPressed = !isPressed;
              });
              if (usernameController.text.isEmpty) {
                setState(() {
                  showUsernameError = true;
                  usernameErrorMessage = isArabic
                      ? '.الرجاء إدخال اسم المستخدم الخاص بك'
                      : 'Veuillez saisir votre nom d\'utilisateur.';
                });
              } else {
                setState(() {
                  showUsernameError = false;
                });
              }

              if (passwordController.text.isEmpty) {
                setState(() {
                  showPasswordError = true;
                  passwordErrorMessage = isArabic
                      ? '.الرجاء إدخال كلمة المرور الخاصة بك'
                      : 'Veuillez saisir votre mot de passe.';
                      
                });
              } else {
                setState(() {
                  showPasswordError = false;
                });
              }
              if (usernameController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                await callApi();
              }
              _showEnableLocationDialog();
              
            },
            child: Text(
              isArabic ? 'تسجيل الدخول' : 'Se Connecter',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          setState(() {
            isArabic = !isArabic;
          });
        },
        child: Text(
          isArabic ? 'Français' : 'العربية',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ];
  }

  Future<void> callApi() async {
    const String apiUrl = 'http://98.71.95.115/authentication-api/users/login';

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'username': usernameController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const Accueil()),
        );
      } else {
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              title: const Text(
                'Erreur d\'authentification',
                style: TextStyle(
                  color: Color.fromARGB(255, 162, 134, 72),
                  // fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              content: const Text(
                'Nom d\'utilisateur ou mot de passe incorrect',
                style: TextStyle(
                  color: Color.fromARGB(255, 112, 109, 109),
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'OK',
                    
                    style: TextStyle(
                      color: Color(0xFF014a71),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Erreur lors de l\'appel de l\'API: $e');
      }
    }
  }

  void _showEnableLocationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Activer la localisation",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 82, 53, 43),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          content: const Text(
            "Veuillez activer la localisation pour utiliser cette fonctionnalité. Cliquez sur le lien pour activer la localisation dans les paramètres de votre téléphone.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(221, 92, 92, 92),
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Activer la localisation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 82, 53, 43),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _openLocationSettings(context);
              },
            ),
            TextButton(
              child: const Text(
                "Annuler",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 82, 53, 43),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _openLocationSettings(BuildContext context) async {
    const url = 'app-settings:';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Impossible d'ouvrir les paramètres de localisation."),
        ),
      );
    }
  }
}