import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/signupzombie.dart';

void main() => runApp(const MaterialApp(home: ZombiePage()));

class ZombiePage extends StatefulWidget {
  const ZombiePage({Key? key}) : super(key: key);

  @override
  _ZombiePageState createState() => _ZombiePageState();
}

class _ZombiePageState extends State<ZombiePage> with TickerProviderStateMixin {
  bool isZombieTapped = false;
  late AnimationController _heartsController;
  int heartsCount = 0;
  int imageIndex = 0; // Indice de l'image affichée
  late AnimationController _animationController;
  bool showRepentText = false;

  @override
  void initState() {
    super.initState();
    _heartsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  void _handleZombieTap() {
    setState(() {
      isZombieTapped = !isZombieTapped;
    });
  }

  void _handleHeartTap() {
    setState(() {
      heartsCount++;
      _heartsController.forward(from: 0.0);

      // Logique pour changer l'image en fonction du nombre de clics
      if (heartsCount == 10) {
        imageIndex = 1;
      } else if (heartsCount == 20) {
        imageIndex = 2;
      } else if (heartsCount == 30) {
        imageIndex = 3;
      } else if (heartsCount == 40) {
        imageIndex = 4;
        _animateImage();
        _animateHearts();
        showRepentText = true;
      } else if (heartsCount > 40) {
        heartsCount = 0; // Réinitialiser le compteur après la dernière image
        imageIndex = 0; // Revenir à la première image
        showRepentText = false;
      }
    });
  }

  void _animateImage() {
    _animationController.forward();
  }

  void _animateHearts() {
    // Utilisez _animationController pour animer les coeurs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(''),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          if (showRepentText)
            Container(
              color: Colors.green,
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Denis Zombie Repentit',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _handleHeartTap,
                      child: AnimatedBuilder(
                        animation: _heartsController,
                        builder: (context, child) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/coeurs.png',
                                width: 50.0,
                                height: 50.0,
                              ),
                              if (_heartsController.value > 0)
                                Positioned(
                                  top: -20 * _heartsController.value,
                                  child: Text(
                                    '+$heartsCount',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                    Container(width: 10.0),
                    GestureDetector(
                      onTap: _handleHeartTap,
                      child: AnimatedBuilder(
                        animation: _heartsController,
                        builder: (context, child) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/coeurs.png',
                                width: 70.0,
                                height: 70.0,
                              ),
                              if (_heartsController.value > 0)
                                Positioned(
                                  top: -20 * _heartsController.value,
                                  child: Text(
                                    '+$heartsCount',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                    Container(width: 10.0),
                    GestureDetector(
                      onTap: _handleHeartTap,
                      child: AnimatedBuilder(
                        animation: _heartsController,
                        builder: (context, child) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/coeurs.png',
                                width: 50.0,
                                height: 50.0,
                              ),
                              if (_heartsController.value > 0)
                                Positioned(
                                  top: -20 * _heartsController.value,
                                  child: Text(
                                    '+$heartsCount',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Hug a zombie',
                  style: GoogleFonts.creepster(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 16, 36),
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: _handleZombieTap,
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: isZombieTapped ? 200.0 : 150.0,
                        height: isZombieTapped ? 200.0 : 150.0,
                        child: Center(
                          child: Transform.scale(
                            scale: _animationController.value,
                            child: Image.asset(
                              _getImagePath(imageIndex),
                              key: UniqueKey(),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40.0),
                Container(
                  width: 200.0,
                  child: const Text(
                    'Forget the classic weapons and methods. Let\'s face the zombies with hugs.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: CustomButton(),
    );
  }

  // Méthode pour obtenir le chemin de l'image en fonction de l'indice
  String _getImagePath(int index) {
    switch (index) {
      case 1:
        return 'assets/images/zombiepasmal.png';
      case 2:
        return 'assets/images/zombiedistingué.png';
      case 3:
        return 'assets/images/zombieamoureux.png';
      case 4:
        return 'assets/images/hommeheureux.png';
      default:
        return 'assets/images/zombi.png';
    }
  }

  @override
  void dispose() {
    _heartsController.dispose();
    _animationController.dispose();
    super.dispose();
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Signupzombie()),
        );
      },
      child: Icon(Icons.arrow_forward),
      backgroundColor: Colors.green,
    );
  }
}