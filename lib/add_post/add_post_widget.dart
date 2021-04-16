import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPostWidget extends StatefulWidget {
  AddPostWidget({Key key}) : super(key: key);

  @override
  _AddPostWidgetState createState() => _AddPostWidgetState();
}

class _AddPostWidgetState extends State<AddPostWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Add GIF',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Playfair Display',
            color: Color(0xFF1A1A1A),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final gifUrl = textController.text;
              final user = currentUserReference;
              final createdAt = getCurrentTimestamp;

              final postsRecordData = createPostsRecordData(
                gifUrl: gifUrl,
                user: user,
                createdAt: createdAt,
              );

              await PostsRecord.collection.doc().set(postsRecordData);
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.done,
              color: Colors.black,
              size: 30,
            ),
            iconSize: 30,
          )
        ],
        centerTitle: true,
        elevation: 1,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: TextFormField(
            controller: textController,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'enter GIF url',
              hintStyle: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
            ),
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
