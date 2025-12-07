import 'package:flutter/material.dart';
import 'package:minggu_11/screen/login_page.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
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
            ScaleTransition(
              scale: Tween<double>(begin: 0.9, end: 1.0).animate(_animation),
              child: FadeTransition(
                opacity: _animation,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    image: DecorationImage(
                      image: AssetImage("assets/images/welcome3.png"),
                      fit: BoxFit.cover,
                    ),
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
                const SizedBox(width: 5),
                Container(
                  height: 7,
                  width: 7,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
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
                      MaterialPageRoute(builder: (context) => const LoginPage()),
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
