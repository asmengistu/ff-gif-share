import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class TestComponentWidget extends StatefulWidget {
  TestComponentWidget({Key key}) : super(key: key);

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
