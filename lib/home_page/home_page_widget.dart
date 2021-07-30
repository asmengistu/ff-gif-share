import '../add_post/add_post_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login_page/login_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            scaffoldKey.currentState.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: Colors.black,
            size: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await signOut();
              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPageWidget(),
                ),
                (r) => false,
              );
            },
            icon: Icon(
              Icons.logout,
              color: Colors.black,
              size: 30,
            ),
            iconSize: 30,
          )
        ],
        centerTitle: true,
        elevation: 1,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPostWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24,
        ),
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Drawer(
          elevation: 16,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 60, 10, 0),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://picsum.photos/seed/465/600',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ListTile(
                      title: Text(
                        'Account Settings',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                      contentPadding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ListTile(
                      title: Text(
                        'Account Settings',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                      contentPadding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ListTile(
                      title: Text(
                        'Account Settings',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                      contentPadding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ListTile(
                      title: Text(
                        'Account Settings',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                      contentPadding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ListTile(
                      title: Text(
                        'Account Settings',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                      contentPadding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ListTile(
                      title: Text(
                        'Account Settings',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                      contentPadding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
          child: StreamBuilder<List<PostsRecord>>(
            stream: queryPostsRecord(
              queryBuilder: (postsRecord) =>
                  postsRecord.orderBy('created_at', descending: true),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.primaryColor,
                    ),
                  ),
                );
              }
              List<PostsRecord> listViewPostsRecordList = snapshot.data;
              // Customize what your widget looks like with no query results.
              if (snapshot.data.isEmpty) {
                return Container(
                  height: 100,
                  child: Center(
                    child: Text('No results.'),
                  ),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewPostsRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewPostsRecord =
                      listViewPostsRecordList[listViewIndex];
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(listViewPostsRecord.user),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.primaryColor,
                              ),
                            ),
                          );
                        }
                        final cardUsersRecord = snapshot.data;
                        return Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFF5F5F5),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Stack(
                                  children: [
                                    InkWell(
                                      onDoubleTap: () async {
                                        final postsUpdateData = {
                                          'liked_by': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        };
                                        await listViewPostsRecord.reference
                                            .update(postsUpdateData);
                                      },
                                      child: Image.network(
                                        listViewPostsRecord.gifUrl,
                                        width: double.infinity,
                                        height: 300,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment(0.95, 0),
                                      child: ToggleIcon(
                                        onPressed: () async {
                                          final postsUpdateData =
                                              createPostsRecordData(
                                            testBool:
                                                !listViewPostsRecord.testBool,
                                          );
                                          await listViewPostsRecord.reference
                                              .update(postsUpdateData);
                                        },
                                        value: listViewPostsRecord.testBool,
                                        onIcon: Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                          size: 26,
                                        ),
                                        offIcon: Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 0, 0, 0),
                                        child: Text(
                                          '',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 1),
                                        child: Text(
                                          cardUsersRecord.email,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 0, 0, 0),
                                        child: Text(
                                          '',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
