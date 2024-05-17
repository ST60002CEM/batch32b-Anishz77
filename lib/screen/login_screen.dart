import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trailtrekker_app/screen/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      final email = _emailController.text;
      final password = _passwordController.text;
      // Simulate a network request
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
        print('Email: $email, Password: $password');
      });
    }
  }

  void _loginWithGoogle() {
    print('Login with Google');
  }

  void _loginWithTwitter() {
    print('Login with Twitter');
  }

  void _loginWithApple() {
    print('Login with Apple ID');
  }

  void _forgotPassword() {
    print('Forgot Password?');
    // Handle forgot password logic here
  }

  void _signUp() {
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>SignUpScreen()),);
    
    // Handle sign up logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 32.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        obscureText: _obscurePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _login(),
                      ),
                      SizedBox(height: 16.0),
                      _isLoading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: _login,
                              child: Text('Login'),
                            ),
                      SizedBox(height: 8.0),
                      TextButton(
                        onPressed: _forgotPassword,
                        child: Text('Forgot Password?'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Or Sign Up using',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                      onPressed: _loginWithGoogle,
                      iconSize: 40,
                    ),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.blue),
                      onPressed: _loginWithTwitter,
                      iconSize: 40,
                    ),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.apple, color: Colors.black),
                      onPressed: _loginWithApple,
                      iconSize: 40,
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                TextButton(
                  onPressed: _signUp,
                  child: Text('Don\'t have an account? Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
