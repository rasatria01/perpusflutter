import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:perpusflutter/models/user.dart';
import 'package:perpusflutter/ui/login_page.dart';

class RegistrasiPage extends StatefulWidget {
  final List<User> users;
  final Function regist;

  const RegistrasiPage({super.key, required this.users, required this.regist});

  @override
  State<RegistrasiPage> createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final _namaTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1100),
                        child: Text(
                          "Create an account, It's free",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FadeIn(
                        duration: const Duration(milliseconds: 1200),
                        child: _namaTextField(),
                      ),
                      FadeIn(
                        duration: const Duration(milliseconds: 1300),
                        child: _emailTextField(),
                      ),
                      FadeIn(
                        duration: const Duration(milliseconds: 1400),
                        child: _passwordTextField(),
                      ),
                      FadeIn(
                        duration: const Duration(milliseconds: 1500),
                        child: _passwordKonfirmasiTextField(),
                      ),
                    ],
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1600),
                    child: _buttonRegistrasi(),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1600),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Already have an account?"),
                        _menuLogin(),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Widget _namaTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama"),
      keyboardType: TextInputType.text,
      controller: _namaTextController,
      validator: (value) {
        if (value!.length < 3) {
          return "Nama harus diisi minimal 3 karakter";
        }
        return null;
      },
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Email"),
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextController,
      validator: (value) {
//validasi harus diisi
        if (value!.isEmpty) {
          return 'Email harus diisi';
        }
//validasi email
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

        RegExp regex = RegExp(pattern.toString());
        if (!regex.hasMatch(value)) {
          return "Email tidak valid";
        }
        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Password"),
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: _passwordTextController,
      validator: (value) {
        if (value!.length < 6) {
          return "Password minimal 6 karakter";
        }
        return null;
      },
    );
  }

  Widget _passwordKonfirmasiTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Konfirmasi Password"),
      keyboardType: TextInputType.text,
      obscureText: true,
      validator: (value) {
//jika inputan tidak sama dengan password
        if (value != _passwordTextController.text) {
          return "Konfirmasi Password tidak sama";
        }
        return null;
      },
    );
  }

  Widget _buttonRegistrasi() {
    return ElevatedButton(
        child: const Text("Registrasi"),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            var email = _emailTextController.text;
            var password = _passwordTextController.text;

            var data = User(
              email: email,
              password: password,
              username: _namaTextController.text,
            );
            widget.regist(data);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage(
                          users: widget.users,
                          regist: widget.regist,
                        )));
          }
        });
  }

  Widget _menuLogin() {
    return InkWell(
      child: const Text(
        "Login",
        style: TextStyle(color: Colors.blue),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginPage(
                      users: widget.users,
                      regist: widget.regist,
                    )));
      },
    );
  }
}
