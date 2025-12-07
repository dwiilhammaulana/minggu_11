import 'package:flutter/material.dart';
import 'package:minggu_11/screen/splash_screen2.dart';


class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("1123150008"), actions: const []),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage("assets/images/welcome.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Forgot to bring your wallet \n when you are shopping?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 7,
                  width: 7,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  height: 7,
                  width: 7,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFC8E6C9),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  height: 7,
                  width: 7,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFC8E6C9),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.all(40),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Screen2()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
