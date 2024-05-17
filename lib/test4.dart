// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: non_constant_identifier_names, file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';
import 'declarant.dart';
import 'location.dart';
import 'map.dart';

class Accueil extends StatelessWidget {
   // ignore: avoid_types_as_parameter_names
   const Accueil({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Futura',
      ),
      home: DefaultTabController(
        length: 3,
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  final TextEditingController _searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var tabBarViewItem = _tabBarViewItem1(
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 10),
            Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InformationsDeclarantForm(),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: const Color.fromARGB(255, 116, 100, 100),
                child: Container(
                  height: 148,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 122, 92, 82),
                        Color.fromARGB(255, 209, 208, 206),
                        (Colors.white)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 19),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Amine Yussefi',
                              style: TextStyle(
                                color: Color.fromARGB(255, 69, 47, 39),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Doe, J., & Smith, A. (2022)',
                              style: TextStyle(
                                color: Color.fromARGB(255, 50, 45, 44),
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '237',
                              style: TextStyle(
                                color: Color.fromARGB(255, 50, 45, 44),
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '4.7Km',
                              style: TextStyle(
                                color: Color.fromARGB(255, 50, 45, 44),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 5),
                            const Text(
                              '15:37',
                              style: TextStyle(
                                color: Color.fromARGB(255, 50, 45, 44),
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MapScreen(),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                // ignore: deprecated_member_use
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    const Color.fromARGB(255, 54, 48, 48)),
                              ),
                              child: const Text(
                                'Location',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  const InformationsDeclarantForm(),
        ),
      );
    },
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: const Color.fromARGB(255, 116, 100, 100),
      child: Container(
        height: 148,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 122, 92, 82),
              Color.fromARGB(255, 209, 208, 206),
              (Colors.white)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amine Yussefi',
                    style: TextStyle(
                      color: Color.fromARGB(255, 69, 47, 39),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Doe, J., & Smith, A. (2022)',
                    style: TextStyle(
                      color: Color.fromARGB(255, 50, 45, 44),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '237',
                    style: TextStyle(
                      color: Color.fromARGB(255, 50, 45, 44),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '4.7Km',
                    style: TextStyle(
                      color: Color.fromARGB(255, 50, 45, 44),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 5),
                  const Text(
                    '15:37',
                    style: TextStyle(
                      color: Color.fromARGB(255, 50, 45, 44),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapScreen(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      // ignore: deprecated_member_use
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 54, 48, 48)),
                    ),
                    child: const Text(
                      'Location',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  ),
),
Padding(
  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  const InformationsDeclarantForm(),
        ),
      );
    },
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: const Color.fromARGB(255, 116, 100, 100),
      child: Container(
        height: 148,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 122, 92, 82),
              Color.fromARGB(255, 209, 208, 206),
              (Colors.white)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amine Yussefi',
                    style: TextStyle(
                      color: Color.fromARGB(255, 69, 47, 39),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Doe, J., & Smith, A. (2022)',
                    style: TextStyle(
                      color: Color.fromARGB(255, 50, 45, 44),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '237',
                    style: TextStyle(
                      color: Color.fromARGB(255, 50, 45, 44),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '4.7Km',
                    style: TextStyle(
                      color: Color.fromARGB(255, 50, 45, 44),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 5),
                  const Text(
                    '15:37',
                    style: TextStyle(
                      color: Color.fromARGB(255, 50, 45, 44),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapScreen(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      // ignore: deprecated_member_use
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 54, 48, 48)),
                    ),
                    child: const Text(
                      'Location',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  ),
),
        
        ],
      ),
    );

    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: TabBarView(
          children: [
            tabBarViewItem,
            const MapScreenn(),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/ekram_logo2.png'),
                  fit: BoxFit.contain,
                ),
              ),
              child: SizedBox(
                width: 100,
                height: 100,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Paramètres'),
              onTap: () {
                Navigator.pop(context);
                // Add navigation logic here
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text(
                'Changer Langue',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              onTap: () {
                Navigator.pop(context);
                showLanguageChangeDialog(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Deconnecter'),
              onTap: () {
                _deconnecter(context);
              },
            ),
          ],
        ),
      ),
    );
  }
  void showLanguageChangeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Changer de Langue'),
          content: const Text('Choisissez votre langue préférée'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Français'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('العربية'), // Pour l'arabe
            ),
          ],
        );
      },
    );
  }

  Widget _tabBarViewItem1({required Widget child}) {
    return Tab(
      child: child,
    );
  }

  Widget tabBarViewItem2({
    required Widget icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Tab(
      icon: icon,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(210),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: _boxDecoration(),
        child: SafeArea(
          child: Column(
            children: [
              _topBar(),
              _searchBox(),
              _tabBar(),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return const BoxDecoration(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
      gradient: LinearGradient(
        colors: [Colors.white,Color.fromARGB(255, 239, 232, 232), Color.fromARGB(255, 147, 124, 124)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'images/ekram_logo2.png',
          width: 140,
          height: 100,
        ),
        Builder(
          builder: (BuildContext context) {
            // ignore: prefer_const_constructors
            return MenuButton();
          },
        ),
      ],
    );
  }

  Widget _searchBox() {
    return SizedBox(
      height: 30,
      child: TextFormField(
        textAlign: TextAlign.start,
        controller: _searchText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: InkWell(
            child: const Icon(Icons.close),
            onTap: () {
              _searchText.clear();
            },
          ),
          hintText: 'Search...',
          contentPadding: const EdgeInsets.all(0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
    );
  }

  Widget _tabBar() {
    return const TabBar(
      labelPadding: EdgeInsets.all(0),
      labelColor: Color.fromARGB(255, 0, 0, 0),
      indicatorColor: Color.fromARGB(255, 0, 0, 0),
      unselectedLabelColor: Color.fromARGB(255, 78, 55, 55),
      tabs: [
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.list),
          text: 'List',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.notifications),
          text: 'Notifications',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.location_on),
          text: 'Location',
        ),
      ],
    );
  }

  void _deconnecter(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }
}

class Test {
  const Test();
}

class MenuButton extends StatefulWidget {
  const MenuButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  Color _iconColor = const Color.fromARGB(255, 82, 53, 43);
  bool _isColorChanging = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu, color: _iconColor, size: 35),
      onPressed: () {
        if (!_isColorChanging) {
          setState(() {
            _iconColor = const Color.fromARGB(255, 115, 93, 55);
            _isColorChanging = true;
          });

          Timer(const Duration(seconds: 1), () {
            setState(() {
              _iconColor = const Color(0xFF014a71);
              _isColorChanging = false;
            });
          });

          Scaffold.of(context).openDrawer();
        }
      },
    );
  }
}
