import 'package:flutter/material.dart';
import 'package:omni_chat_telas_novas/screens/login_screen.dart';

void main() {
  runApp(const OmniChat());
}

class OmniChat extends StatelessWidget {
  const OmniChat({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
