import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_technique/services/firestore_service.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final FirestoreService firestoreService = FirestoreService();

  ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>?>(
        future: firestoreService.getPlayerData(username), // Utilise FirestoreService
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Aucune donnée trouvée pour ce joueur'));
          } else {
            final playerData = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: const Color(0xFF333C75),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF7584FF),
                                      borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextButton.icon(
                                    icon: const Icon(Icons.chevron_left,
                                      color: Colors.white,
                                      size: 16
                                    ),
                                    label: const Text('Retour',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white
                                        )
                                    ),
                                    onPressed: () {
                                      GoRouter.of(context).go('/');
                                    },
                                  ),
                                ),
                                const SizedBox(height: 150,)
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(height: 150),
                                const CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Color(0xFFFFD1D9),
                                  backgroundImage: AssetImage('assets/person.png'),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  '${playerData['username']}',
                                  style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 5
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF7584FF),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                        ),
                                      ),
                                      child: const Text(
                                        'Champion',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(color: const Color(0xFF7584FF)),
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                      ),
                                      child: const Text(
                                        '#64',
                                        style: TextStyle(
                                          color: Color(0xFF7584FF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      '${playerData['score']} ',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white
                                      ),
                                    ),
                                    SvgPicture.asset('assets/coins.svg',
                                        width: 20,
                                        height: 20
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxHeight: 300),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  const SizedBox(height: 50),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF7584FF),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: SvgPicture.asset('assets/gear.svg', //ne s'affiche pas
                                        width: 40,
                                        height: 40,
                                        color: Colors.white //attribut déprécié
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF7584FF),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: SvgPicture.asset('assets/trophy/trophy.svg',
                                        width: 40,
                                        height: 40,
                                        color: Colors.white
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF7584FF),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: SvgPicture.asset('assets/note.svg',
                                        width: 40,
                                        height: 40,
                                        color: Colors.white
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF7584FF),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: SvgPicture.asset('assets/share.svg',
                                        width: 40,
                                        height: 40,
                                        color: Colors.white
                                    ),
                                  ),
                                ]
                              ),
                            )
                          ]
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  width: 280,
                  decoration: BoxDecoration(
                    color: const Color(0xFF7584FF),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/title_gamepass.png'),
                      ),
                      Image(
                        image: AssetImage('assets/saison_progressbar.png')
                      )
                    ]
                  )
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
