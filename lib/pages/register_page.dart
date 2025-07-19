import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  "Hello!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Daftarkan akun kamu",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 40),
                roundedInput(
                  controller: usernameController,
                  hintText: "Username",
                  icon: Icons.person,
                ),
                SizedBox(height: 16),
                roundedInput(
                  controller: emailController,
                  hintText: "Email",
                  icon: Icons.email_outlined,
                ),
                SizedBox(height: 16),
                roundedInput(
                  controller: passwordController,
                  hintText: "Password",
                  icon: Icons.lock,
                  isObscure: true,
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Berhasil"),
                          content: const Text(
                            "Pendaftaran berhasil. Silakan login.",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Tutup dialog
                                Navigator.pop(context); // Kembali ke LoginPage
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Daftar",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(height: 12),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Lupa password?",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Atau daftar degan",
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialImage("images/facebook.png"),
                    SizedBox(width: 16),
                    socialImage("images/google.png"),
                    SizedBox(width: 16),
                    socialImage("images/twitter.png"),
                  ],
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sudah punya akun? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Masuk disini",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget roundedInput({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isObscure = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.black),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget socialImage(String imagePath) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(0, 2),
            blurRadius: 3,
          ),
        ],
      ),
      child: Image.asset(imagePath, width: 28, height: 28, fit: BoxFit.contain),
    );
  }
}
