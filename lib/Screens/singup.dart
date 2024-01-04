import 'dart:convert';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SingUpScreen extends StatelessWidget {
  SingUpScreen({Key? key}) : super(key: key);
  var data ;
  signupCall({required String email, password}) async {
    const url = "https://reqres.in/api/register";
    final response = await http.post(Uri.parse(url), body: {
      "email": email,
      "password": password,
    });
    data = jsonDecode(response.body);
    print(data.toString());
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up  Post Api"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Email "),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: passswordController,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                    onPressed: () {
                      signupCall(
                          email: emailController.text.toString(),
                          password: passswordController.text.toString());
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 25),
                    )))
          ],
        ),
      ),
    );
  }
}
