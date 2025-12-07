import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
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

  try {
    // Login Firebase Authentication
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: emailCtrl.text.trim(),
      password: passCtrl.text.trim(),
    );

    // LOGIN BERHASIL
    setState(() {
      _isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Login berhasil! UID: ${credential.user!.uid}")),
    );

  } on FirebaseAuthException catch (e) {
    // LOGIN GAGAL
    setState(() {
      _isLoading = false;
      _error = e.message; // pesan error dari firebase
    });

  } catch (e) {
    setState(() {
      _isLoading = false;
      _error = "Terjadi kesalahan: $e";
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
