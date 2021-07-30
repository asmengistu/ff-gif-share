import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestComponentWidget extends StatefulWidget {
  TestComponentWidget({
    Key key,
    this.inputPost,
  }) : super(key: key);

  final PostsRecord inputPost;

  @override
  _TestComponentWidgetState createState() => _TestComponentWidgetState();
}

class _TestComponentWidgetState extends State<TestComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://picsum.photos/seed/187/600',
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
  }
}
