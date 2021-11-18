import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPageWidget extends StatefulWidget {
  OnboardingPageWidget({
    Key key,
    this.test,
  }) : super(key: key);

  final String test;

  @override
  _OnboardingPageWidgetState createState() => _OnboardingPageWidgetState();
}

class _OnboardingPageWidgetState extends State<OnboardingPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional(-0.05, 0),
          child: InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavBarPage(initialPage: 'HomePage'),
                ),
              );
            },
            child: Text(
              'Go home',
              style: FlutterFlowTheme.bodyText1,
            ),
          ),
        ),
      ),
    );
  }
}
