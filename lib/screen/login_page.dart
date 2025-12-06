import 'package:flutter/material.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  // State variabel
  String? _error;
  bool _isLoading = false;

  // Function login (contoh sederhana)
  void _login() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    await Future.delayed(const Duration(seconds: 2)); // simulasi loading

    if (emailCtrl.text == "admin" && passCtrl.text == "123") {
      setState(() {
        _error = null;
        _isLoading = false;
      });

      // Contoh sukses
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login berhasil!")),
      );
    } else {
      setState(() {
        _error = "Email atau password salah";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Email
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 8),

            // Password
            TextField(
              controller: passCtrl,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),

            // Error Message
            if (_error != null) ...[
              Text(
                _error!,
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 8),
            ],

            // Login Button
            ElevatedButton(
              onPressed: _isLoading ? null : _login,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
