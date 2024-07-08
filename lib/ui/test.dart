// Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: SizedBox(
//             width: 250,
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Login",
//                     style: Theme.of(context).textTheme.displaySmall!.copyWith(
//                           color: Theme.of(context).colorScheme.onBackground,
//                         ),
//                   ),
//                   _emailTextField(),
//                   _passwordTextField(),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   _buttonLogin(),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   _menuRegistrasi(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),