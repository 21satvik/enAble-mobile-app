import 'dart:io';

import 'package:flutter/material.dart';

import '../../helpers/shared_prefs.dart';
import '../utility/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this.submitFn, this.isLoading);

  final bool isLoading;

  final void Function(
    String email,
    String password,
    String username,
    File image,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';
  File _userimageFile = File('');

  void _pickedImage(File image) {
    _userimageFile = image;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (_userimageFile == File('') && !_isLogin) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please pick an image.'),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      return;
    }

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        _userName.trim(),
        _userimageFile,
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage('assets/images/login1.png'), fit: BoxFit.cover),
      // ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: _isLogin
                      ? const AssetImage('assets/images/login1.png')
                      : const AssetImage('assets/images/register.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 35,
                top: MediaQuery.of(context).size.height * 0.15,
              ),
              child: Text(
                _isLogin ? 'Welcome\n Back' : 'Create\n Account',
                style: const TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.45),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: <Widget>[
                            if (!_isLogin) UserImagePicker(_pickedImage),
                            TextFormField(
                              key: const ValueKey('email'),
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              enableSuggestions: false,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'Please enter a valid email address.';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: 'Email Address',
                              ),
                              onSaved: (value) {
                                _userEmail = value!;
                              },
                            ),
                            if (!_isLogin)
                              TextFormField(
                                key: const ValueKey('username'),
                                autocorrect: true,
                                enableSuggestions: false,
                                textCapitalization: TextCapitalization.words,
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 4) {
                                    return 'Please enter atleast four characters';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    labelText: 'Username'),
                                onSaved: (value) {
                                  _userName = value!;
                                },
                              ),
                            TextFormField(
                              key: const ValueKey('password'),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 6) {
                                  return 'Password must be atleast six characters long';
                                }
                                return null;
                              },
                              decoration:
                                  const InputDecoration(labelText: 'Password'),
                              obscureText: true,
                              onSaved: (value) {
                                _userPassword = value!;
                              },
                              onFieldSubmitted: (value) {
                                // getCurrentUserDetail();
                                _trySubmit();
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            if (widget.isLoading)
                              const CircularProgressIndicator(),
                            if (!widget.isLoading)
                              ElevatedButton(
                                onPressed: () {
                                  // getCurrentUserDetail();
                                  _trySubmit();
                                },
                                child: Text(
                                  _isLogin ? 'Login' : 'Sign Up',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                              ),
                            if (!widget.isLoading)
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _isLogin = !_isLogin;
                                  });
                                },
                                child: Text(
                                  _isLogin
                                      ? 'Create new account'
                                      : 'I already have an account',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
