import 'package:flutter/material.dart';
import 'package:omni_chat_telas/screens/chat_screen.dart';
import 'package:omni_chat_telas/screens/chats_recebidos_screen.dart';
import 'package:omni_chat_telas/screens/login_screen.dart';
import 'package:omni_chat_telas/screens/ramal_screen.dart';
import 'package:omni_chat_telas/screens/welcome_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: LoginScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        ChatsRecebidosScreen.id: (context) => ChatsRecebidosScreen(),
        RamalScren.id: (context) => RamalScren()
      },
    );
  }
}
