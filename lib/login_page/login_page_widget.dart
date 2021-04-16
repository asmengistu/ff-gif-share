import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF110631),
        ),
        alignment: Alignment(0, 0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, 0.45),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: Container(
                          width: 285,
                          height: 40,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: TextFormField(
                                  controller: emailTextController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'email',
                                    hintStyle: GoogleFonts.getFont(
                                      'Lato',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF3C2452),
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF3C2452),
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Lato',
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0.95, 0.5),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: Container(
                          width: 285,
                          height: 40,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: TextFormField(
                                  controller: passwordTextController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'password',
                                    hintStyle: GoogleFonts.getFont(
                                      'Lato',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF3C2452),
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF3C2452),
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Lato',
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0.95, 0.5),
                                child: Icon(
                                  Icons.lock_open,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                final user = await createAccountWithEmail(
                                  context,
                                  emailTextController.text,
                                  passwordTextController.text,
                                );
                                if (user == null) {
                                  return;
                                }

                                if (mounted && Navigator.of(context).canPop()) {
                                  Navigator.of(context).pop();
                                }
                              },
                              text: 'Sign up',
                              options: FFButtonOptions(
                                width: 125,
                                height: 40,
                                color: Color(0x00FFFFFF),
                                textStyle: GoogleFonts.getFont(
                                  'Lato',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFF553BBA),
                                  width: 2,
                                ),
                                borderRadius: 0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final user = await signInWithEmail(
                                    context,
                                    emailTextController.text,
                                    passwordTextController.text,
                                  );
                                  if (user == null) {
                                    return;
                                  }

                                  if (mounted &&
                                      Navigator.of(context).canPop()) {
                                    Navigator.of(context).pop();
                                  }
                                },
                                text: 'Sign in',
                                options: FFButtonOptions(
                                  width: 125,
                                  height: 40,
                                  color: Color(0x00FFFFFF),
                                  textStyle: GoogleFonts.getFont(
                                    'Lato',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xFF553BBA),
                                    width: 2,
                                  ),
                                  borderRadius: 0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        'Forgot Password?',
                        style: GoogleFonts.getFont(
                          'Lato',
                          color: Color(0xFF8E8E8E),
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.04, -0.58),
              child: Text(
                'GifShare',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Playfair Display',
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}