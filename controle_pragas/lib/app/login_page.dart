//criar tela de login em flutter, utilizando o firebase como autenticação com o google, depois de logado, redirecionar para a tela principal do app
import 'package:controle_pragas/app/home_page.dart';
import 'package:controle_pragas/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../login_model.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

    @override
  void initState() {
    super.initState();
    // _model = createModel(context, () => LoginModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }
  
  Future<UserCredential> _signInWithGoogle() async {
  
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Align(
          child: Center(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(
              maxWidth: 670,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/img-home.jpg',
                        ).image,
                      ),
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0x00FFFFFF), Colors.white],
                          stops: [0, 1],
                          begin: AlignmentDirectional(0, -1),
                          end: AlignmentDirectional(0, 1),
                        ),
                      ),
                      alignment: const AlignmentDirectional(0, 1),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(24, 64, 24, 24),
                        child: Text(
                          'Bem Vindo',
                          textAlign: TextAlign.center,
                          style: ThemeApp.theme.textTheme
                              .displayMedium
                              ?.copyWith(
                                fontFamily: 'Urbanist',
                                color: const Color(0xFF101213),
                                fontSize: 48,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 36, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 24),
                        child: OutlinedButton.icon(
                          label: Text('Entre com Google', style: ThemeApp.theme.textTheme
                              .titleLarge
                              ?.copyWith(
                                fontFamily: 'Urbanist',
                                color: Color(0xFF101213),
                                fontSize: 18,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                              ),),
                          onPressed: () {
                             _signInWithGoogle().then((userCredential) {
                 
                          Navigator.push(context,  MaterialPageRoute(builder: (context) => HomePage()));
                        }).catchError((error) {
                          print('Login error: $error');
                        });
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFFE0E3E7), side: const BorderSide(color: Color(0xFFE0E3E7), width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          icon: const Icon(
                            FontAwesomeIcons.google,
                            color: Color(0xFF101213),
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                           ),
                ),
              ],
          ),
        ),
      ),
    )));
  }
}