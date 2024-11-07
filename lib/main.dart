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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
                  Container(
                      child: Text('Jean Dupont')
                  )
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
      body: Container(
        color: Color(0xFFECF1FF),
        child: Column(
          children: <Widget>[
            Container(

            )
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
