import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget _campoTexto(
      String labelHint, IconData icone, TextInputType tipoTexto) {
    bool esconderTexto = (labelHint == 'Enter your password.' ? true : false);

    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 2, color: Colors.grey))),
          child: TextField(
            obscureText: esconderTexto,
            style: const TextStyle(color: Colors.black),
            keyboardType: tipoTexto,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icone,
                color: Colors.grey,
              ),
              hintText: labelHint,
              hintStyle: const TextStyle(fontSize: 20.0, color: Colors.grey),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: altura,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/logo_fundo.png',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.3), BlendMode.dstATop))),
          ),
          SingleChildScrollView(
            child: Container(
              height: altura,
              width: largura,
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: constraints.maxHeight * 0.1,
                      child: Image.asset('assets/images/logo-lhtec.png'),
                    ),
                    Container(
                      height: constraints.maxHeight * 0.1,
                    ),
                    _campoTexto('Enter yoir email', Icons.person,
                        TextInputType.emailAddress),
                    Container(
                      height: constraints.maxHeight * 0.03,
                    ),
                    _campoTexto(
                        'Enter your password.', Icons.lock, TextInputType.text),
                    Container(
                      height: constraints.maxHeight * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70, right: 70),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Log In",
                          style: TextStyle(fontSize: 24),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey[700],
                            minimumSize: Size(constraints.maxWidth * 0.6,
                                constraints.maxHeight * 0.07)),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
