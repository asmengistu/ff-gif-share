import '../add_post/add_post_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
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
        title: Text(
          'Feed',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
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
        width: MediaQuery.of(context).size.width * 0.9,
        child: Drawer(
          elevation: 16,
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<List<PostsRecord>>(
          stream: queryPostsRecord(
            queryBuilder: (postsRecord) =>
                postsRecord.orderBy('created_at', descending: true),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            List<PostsRecord> listViewPostsRecordList = snapshot.data;
            // Customize what your widget looks like with no query results.
            if (snapshot.data.isEmpty) {
              // return Container();
              // For now, we'll just include some dummy data.
              listViewPostsRecordList = createDummyPostsRecord(count: 4);
            }
            return Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewPostsRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewPostsRecord =
                      listViewPostsRecordList[listViewIndex];
                  return StreamBuilder<UsersRecord>(
                    stream: UsersRecord.getDocument(listViewPostsRecord.user),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final cardUsersRecord = snapshot.data;
                      return Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Card(
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
                                InkWell(
                                  onDoubleTap: () async {
                                    final postsRecordData = {
                                      ...createPostsRecordData(),
                                      'liked_by': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    };

                                    await listViewPostsRecord.reference
                                        .update(postsRecordData);
                                  },
                                  child: Image.network(
                                    listViewPostsRecord.gifUrl,
                                    width: double.infinity,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  ),
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
                                          'Post by: ',
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
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
