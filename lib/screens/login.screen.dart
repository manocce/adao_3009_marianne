import 'package:flutter/material.dart';
import 'package:untitled/screens/controller/login.controller.dart';
import 'package:untitled/snippets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late LoginController _loginController;

  @override
  void initState() {
    _loginController = LoginController();
    super.initState();
  }

  _onPressed(){
    _loginController.save(
        _emailController.text,
        _passwordController.text
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
            ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _emailController,
              decoration: inputDecoration(label: " Informe o e-mail "),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordController,
              decoration: inputDecoration(label: " Informe o password "),
            ),
          ),
          ElevatedButton(onPressed: _onPressed,
              child: const Text("Entrar")
          ),
          Row(
            children: [
              Text("Não tem conta? "),
              InkWell(
                onTap: (){

              },
                  child: Text("Cadastro ", style: TextStyle(fontWeight: FontWeight.bold),)),
            ],
          )
        ],
      ),
    );
  }
}