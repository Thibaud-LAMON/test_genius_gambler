import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFECF1FF),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Row(
          children: [
            const Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: 0.65,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF108236)),
                  strokeWidth: 8,
                ),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  backgroundImage: AssetImage('assets/person.png'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/coins.svg', width: 20, height: 20),
                      Text(' 433')
                    ]
                  ),
                  Stack(
                    clipBehavior: Clip.none, // Permet au conteneur superposé de déborder
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFF7584FF),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          'Champion',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Conteneur "# Rang" positionné à droite et partiellement superposé
                      Positioned(
                        right: -50, // Ajuste la valeur pour obtenir le chevauchement souhaité
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: const Color(0xFF7584FF)), // Bordure bleue
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(5), // Coins droits arrondis
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          child: const Text(
                            '#64', // Remplace par le rang dynamique
                            style: TextStyle(
                              color: Color(0xFF7584FF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFEE9714),
                borderRadius: BorderRadius.circular(30)
            ),
            child: TextButton.icon(
              icon: SvgPicture.asset('assets/shop.svg'),
              label: Text('Boutique', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF364F6B))),
              onPressed: () {
                print('Boutique');
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('CLASSEMENT \nAMIS',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF7584FF)
              ),
            ),
            const Text(
              'Compare ton classement avec tes amis et regarde lequel est le meilleur d\'entre vous',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF364F6B),
              ),
            ),
            Expanded(
                child:ListView.builder(
                    itemBuilder:
                )
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/podium/podium_primary.svg'),
              label: 'Classement',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/trophy/trophy.svg'),
              label: 'Tournois',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/stadium/stadium.svg'),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/field/field.svg'),
              label: 'Matchs',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/ticket/ticket.svg'),
              label: 'Mes Pronos',
            ),
          ],
        selectedItemColor: Color(0xFF7584FF),
        unselectedItemColor: Color(0xFFADADAD),
        currentIndex: 0,
        onTap: (index) {
          // Handle your navigation here
        },
      ),
    );
  }
}
