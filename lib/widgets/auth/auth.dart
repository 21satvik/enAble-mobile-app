// import 'package:flutter/material.dart';

// class AuthForm extends StatelessWidget {
//   const AuthForm({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage('assets/images/login1.png'), fit: BoxFit.cover),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(),
//             Container(
//               padding: const EdgeInsets.only(left: 35, top: 130),
//               child: const Text(
//                 'Welcome\nBack',
//                 style: TextStyle(color: Colors.white, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.5),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.only(left: 35, right: 35),
//                         child: Column(
//                           children: <Widget>[
//                             if (!_isLogin) UserImagePicker(_pickedImage),
//                             TextFormField(
//                               key: const ValueKey('email'),
//                               autocorrect: false,
//                               textCapitalization: TextCapitalization.none,
//                               enableSuggestions: false,
//                               validator: (value) {
//                                 if (value!.isEmpty ||
//                                     !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                         .hasMatch(value)) {
//                                   return 'Please enter a valid email address.';
//                                 }
//                                 return null;
//                               },
//                               keyboardType: TextInputType.emailAddress,
//                               decoration: const InputDecoration(
//                                 labelText: 'Email Address',
//                               ),
//                               onSaved: (value) {
//                                 _userEmail = value!;
//                               },
//                             ),
//                             if (!_isLogin)
//                               TextFormField(
//                                 key: const ValueKey('username'),
//                                 autocorrect: true,
//                                 enableSuggestions: false,
//                                 textCapitalization: TextCapitalization.words,
//                                 validator: (value) {
//                                   if (value!.isEmpty || value.length < 4) {
//                                     return 'Please enter atleast four characters';
//                                   }
//                                   return null;
//                                 },
//                                 decoration: const InputDecoration(
//                                     labelText: 'Username'),
//                                 onSaved: (value) {
//                                   _userName = value!;
//                                 },
//                               ),
//                             TextFormField(
//                               key: const ValueKey('password'),
//                               validator: (value) {
//                                 if (value!.isEmpty || value.length < 6) {
//                                   return 'Password must be atleast six characters long';
//                                 }
//                                 return null;
//                               },
//                               decoration:
//                                   const InputDecoration(labelText: 'Password'),
//                               obscureText: true,
//                               onSaved: (value) {
//                                 _userPassword = value!;
//                               },
//                               onFieldSubmitted: (value) {
//                                 _trySubmit();
//                               },
//                             ),
//                             const SizedBox(
//                               height: 12,
//                             ),
//                             if (widget.isLoading)
//                               const CircularProgressIndicator(),
//                             if (!widget.isLoading)
//                               ElevatedButton(
//                                 onPressed: _trySubmit,
//                                 child: Text(_isLogin ? 'Login' : 'Sign Up'),
//                               ),
//                             if (!widget.isLoading)
//                               TextButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     _isLogin = !_isLogin;
//                                   });
//                                 },
//                                 child: Text(_isLogin
//                                     ? 'Create new account'
//                                     : 'I already have an account'),
//                               ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
