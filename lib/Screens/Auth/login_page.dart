import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:doctu/Screens/Auth/login_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Provider/user_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Credentials? _credentials;
  late Auth0 auth0;
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    auth0 = Auth0('dev-b5f32aepc3notpyh.us.auth0.com',
        'XZ9fMhdZpJ7QE3HmH2722wpTNwsAsUgP');
    if (_credentials != null) {
      _navigate(_credentials!);
    }
  }

  Future<void> _navigate(Credentials cred) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Loader(cred: cred)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF161616),
        body: Padding(
          padding: EdgeInsets.all(width / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("Assets/Logo/logo.png"),
              ),
              const SizedBox(height: 20),
              const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Looks like you are not logged in, let's login to your dashboard, on clicking the login button you will be redirected to Auth0 login",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              const Spacer(),
              if (_isLoading)
                const Center(
                    child: CircularProgressIndicator(
                  color: Color(0xFFBFECFA),
                )) // Display activity progress indicator
              else if (_credentials == null)
                InkWell(
                  onTap: _handleLoginTap,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width / 15),
                      color: const Color(0xFFBFECFA),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (_credentials != null)
                InkWell(
                  onTap: () {
                    _navigate(_credentials!);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width / 15),
                      color: const Color(0xFFBFECFA),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void refUpdate(WidgetRef ref, Credentials u) {
    ref.read(userProvider.notifier).updateUser(u);
  }

  Future<void> _handleLoginTap() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final credentials = await auth0.webAuthentication(scheme: "app").login();

      setState(() {
        _credentials = credentials;
        _isLoading = false;
      });

      if (_credentials != null) {
        _navigate(_credentials!);
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Login failed. Please try again.';
      });
    }
  }
}
