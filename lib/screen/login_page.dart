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
  bool _obscureText = true;

  // Function login Firebase
  void _login() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailCtrl.text.trim(),
        password: passCtrl.text.trim(),
      );

      setState(() {
        _isLoading = false;
      });

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //       content: Text("Login berhasil! UID: ${credential.user!.uid}")),
      // );
      ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade600,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "Login berhasil! Selamat datang 👋",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  ),
);


      // TODO: Pindah ke home/dashboard di sini

    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.message;
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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Icon(Icons.lock_outline, size: 80, color: Colors.green),
                const SizedBox(height: 20),

                const Text(
                  "Selamat Datang!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const Text(
                  "Silahkan Login untuk melanjutkan.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.green),
                ),

                const SizedBox(height: 20),

                // EMAIL
                TextField(
                  controller: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Email',
                    hintText: 'Masukan email anda',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // PASSWORD
                TextField(
                  controller: passCtrl,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outlined),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    labelText: 'Password',
                    hintText: 'Masukan password anda',
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // ERROR MESSAGE
                if (_error != null)
                  Text(
                    _error!,
                    style: const TextStyle(color: Colors.red),
                  ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Lupa Password?",
                      style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // BUTTON LOGIN
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),

                const SizedBox(height: 15),

                // PEMBATAS
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 10,
                      ),
                    ),
                    Text("atau", style: TextStyle(color: Colors.grey)),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 10,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // GOOGLE LOGIN (dummy)
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Melakukan login dengan Google...'),
                          backgroundColor: Colors.blue,
                        ),
                      );
                    },
                    icon: const Icon(Icons.public, color: Colors.black),
                    label: const Text(
                      "Login dengan Google",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // REGISTER
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum punya akun?"),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Daftar di sini",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
