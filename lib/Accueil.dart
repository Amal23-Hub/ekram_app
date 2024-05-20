// ignore: file_names
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'declarant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final TextEditingController _searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var tabBarViewItem = _tabBarViewItem1(
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          buildDataFetcher(),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const MapScreen()),
                // );
              },
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: _appBar(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: TabBarView(
              children: [
                tabBarViewItem,
                // const SearchDeclaration(),
                tabBarViewItem2(
                  icon: const Icon(Icons.circle),
                  label: 'Nouvelle Page',
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             const InformationsDeclarantForm()));
                  },
                ),
              ],
            ),
          ),
        ],
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
              title: const Text(
                'Paramètres',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.pop(context);
                // Add navigation logic here
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text(
                'Changer Langue',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.pop(context);
                showLanguageChangeDialog(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'Déconnecter',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
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
          title: const Text(
            'Changer de Langue',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          content: const Text(
            'Choisissez votre langue préférée',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17, color: Color.fromARGB(255, 110, 101, 101)),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Français',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
            const SizedBox(height: 10),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'العربية',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
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
        colors: [Colors.white, Color.fromARGB(255, 178, 154, 127)],
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
          width: 170,
          height: 100,
        ),
        Builder(
          builder: (BuildContext context) {
            return MenuButton();
          },
        ),
      ],
    );
  }

  Widget _searchBox() {
    return SizedBox(
      height: 35,
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
      labelColor: Color.fromARGB(255, 56, 44, 26),
      indicatorColor: Color.fromARGB(255, 56, 44, 26),
      unselectedLabelColor: Color.fromARGB(255, 248, 242, 227),
      tabs: [
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.list, size: 28),
          text: 'List',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.notifications, size: 28),
          text: 'Notifications',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.location_on, size: 28),
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
  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  Color _iconColor = const Color.fromARGB(255, 65, 42, 32);
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
              _iconColor = const Color.fromARGB(255, 56, 44, 26);
              _isColorChanging = false;
            });
          });

          Scaffold.of(context).openDrawer();
        }
      },
    );
  }
}

Future<List<Map<String, dynamic>>> fetchData() async {
  List<Map<String, dynamic>> allData = [];
  int pageNumber = 1;
  const pageSize = 10;

  while (true) {
    final response = await http.get(
      Uri.parse(
          'http://98.71.95.115/declaration-api/declarations?AssignmentBCH=1&StatusId=1&DateOfDeathStart=2024-05-15&DateOfDeathEnd=2024-05-20'),
      headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6InJhYmF0X2NvbnN0YXRldXIiLCJmaXJzdE5hbWUiOiJDb25zdGF0ZXVyIiwibGFzdE5hbWUiOiJSYWJhdCIsInVzZXJJZCI6ImQzYjc1MjhjLWQwNjMtNDMyNC04NWI0LTgxMGM5NjcyN2JhZSIsImFzc2lnbm1lbnRCQ0giOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiT2JzZXJ2ZXIiLCJleHAiOjE3MTYyMDI1ODksImlzcyI6InlvdXJfaXNzdWVyIiwiYXVkIjoieW91cl9hdWRpZW5jZSJ9.oQk0wVgnt3fRKStDLT7oj--cVqQoyhmDEPOYhwXqPF8',
        'X-Pagenumber': pageNumber.toString(),
        'X-Pagesize': pageSize.toString(),
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      print('Response body: $responseBody');
      if (responseBody.containsKey('data') && responseBody['data'] is List) {
        final List<Map<String, dynamic>> data = (responseBody['data'] as List)
            .map((item) => item as Map<String, dynamic>)
            .toList();
        print('Parsed data: $data');
        allData.addAll(data);
        if (data.length < pageSize) {
          break;
        }
        pageNumber++;
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }
  return allData;
}

Widget buildDataFetcher() {
  return FutureBuilder<List<Map<String, dynamic>>>(
    future: fetchData(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData && snapshot.data != null) {
        final data = snapshot.data!;
        if (data.isNotEmpty) {
          // ignore: sized_box_for_whitespace
          return Container(
            height:
                MediaQuery.of(context).size.height, // Utilisez une taille appropriée ici
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InformationsDeclarantForm(declarationDetails: item),
                        ),
                      );
                    },
                    child: Card(
                      color: const Color.fromARGB(255, 248, 242, 227),
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          '${item['deceased']?['name'] ?? ''}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Color.fromARGB(255, 93, 60, 50),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('N°: ${item['declarationNumber'] ?? ''}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Date de décès: ${item['death']?['dateOfDeath'] ?? ''}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Age de défunt: ${item['deceased']?['age'] ?? ''}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.location_on),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MapScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Text('No data available');
        }
      } else {
        return const Text('No data available');
      }
    },
  );
}
