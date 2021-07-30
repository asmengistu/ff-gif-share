import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AsdfasWidget extends StatefulWidget {
  AsdfasWidget({Key key}) : super(key: key);

  @override
  _AsdfasWidgetState createState() => _AsdfasWidgetState();
}

class _AsdfasWidgetState extends State<AsdfasWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello World',
      style: FlutterFlowTheme.bodyText1.override(
        fontFamily: 'Poppins',
      ),
    );
  }
}
