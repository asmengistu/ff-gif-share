import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../onboarding_page/onboarding_page_widget.dart';
import '../phone_sign_in_page/phone_sign_in_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  bool passwordVisibility;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;
  bool _loadingButton4 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        elevation: 16,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF110631),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Align(
              alignment: AlignmentDirectional(0.04, -0.58),
              child: Text(
                'GifShare',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Playfair Display',
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 5,
              child: Align(
                alignment: AlignmentDirectional(0, 0.45),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                          child: Container(
                            width: 285,
                            height: 40,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
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
                                  alignment: AlignmentDirectional(0.95, 0.5),
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                          child: Container(
                            width: 285,
                            height: 40,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: TextFormField(
                                    controller: passwordTextController,
                                    obscureText: !passwordVisibility,
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
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => passwordVisibility =
                                              !passwordVisibility,
                                        ),
                                        child: Icon(
                                          passwordVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          size: 22,
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
                                  alignment: AlignmentDirectional(0.95, 0.5),
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() => _loadingButton1 = true);
                                  try {
                                    final user = await createAccountWithEmail(
                                      context,
                                      emailTextController.text,
                                      passwordTextController.text,
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            OnboardingPageWidget(),
                                      ),
                                    );
                                  } finally {
                                    setState(() => _loadingButton1 = false);
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
                                loading: _loadingButton1,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(35, 0, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    setState(() => _loadingButton2 = true);
                                    try {
                                      final user = await signInWithEmail(
                                        context,
                                        emailTextController.text,
                                        passwordTextController.text,
                                      );
                                      if (user == null) {
                                        return;
                                      }

                                      await Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'HomePage'),
                                        ),
                                        (r) => false,
                                      );
                                    } finally {
                                      setState(() => _loadingButton2 = false);
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
                                  loading: _loadingButton2,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.getFont(
                              'Lato',
                              color: Color(0xFF8E8E8E),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            setState(() => _loadingButton3 = true);
                            try {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhoneSignInPageWidget(),
                                ),
                              );
                            } finally {
                              setState(() => _loadingButton3 = false);
                            }
                          },
                          text: 'Phone Sign In',
                          icon: FaIcon(
                            FontAwesomeIcons.phoneAlt,
                          ),
                          options: FFButtonOptions(
                            width: 160,
                            height: 60,
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
                          loading: _loadingButton3,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                setState(() => _loadingButton4 = true);
                try {
                  final user = await signInWithGoogle(context);
                  if (user == null) {
                    return;
                  }
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavBarPage(initialPage: 'HomePage'),
                    ),
                    (r) => false,
                  );
                } finally {
                  setState(() => _loadingButton4 = false);
                }
              },
              text: 'Google Sign In',
              icon: FaIcon(
                FontAwesomeIcons.google,
              ),
              options: FFButtonOptions(
                width: 160,
                height: 60,
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
              loading: _loadingButton4,
            ),
            Spacer(flex: 2)
          ],
        ),
      ),
    );
  }
}
