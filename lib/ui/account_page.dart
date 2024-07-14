import 'package:flutter/material.dart';
import 'package:perpusflutter/models/user.dart';
import 'package:perpusflutter/ui/welcome_page.dart';

class AccountPage extends StatelessWidget {
  final User user;
  const AccountPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.inversePrimary,
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                const Icon(
                  Icons.account_circle,
                  size: 80,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      user.username,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.email,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(
              width: 100,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(color: Colors.redAccent),
              ),
            ),
            height: 50,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text(
                "Log Out",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      )),
    );
  }
}
