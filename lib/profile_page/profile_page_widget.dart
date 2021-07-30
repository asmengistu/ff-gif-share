import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_profile_page/edit_profile_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePageWidget extends StatefulWidget {
  ProfilePageWidget({Key key}) : super(key: key);

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
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
        final profilePageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: Image.network(
                        'https://images.unsplash.com/photo-1623598129231-0d7846ad9eee?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
                      ).image,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 0, 1),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment(-0.4, -0.02),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        profilePageUsersRecord.photoUrl,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text(
                            profilePageUsersRecord.displayName,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 18, 15, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePageWidget(
                            userRecord: profilePageUsersRecord,
                          ),
                        ),
                      );
                    },
                    text: 'Edit Profile',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 46,
                      color: Colors.white,
                      textStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      borderSide: BorderSide(
                        color: Color(0xCC0C0C0C),
                        width: 1,
                      ),
                      borderRadius: 8,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            labelColor: FlutterFlowTheme.primaryColor,
                            indicatorColor: FlutterFlowTheme.secondaryColor,
                            tabs: [
                              Tab(
                                icon: Icon(
                                  Icons.person,
                                ),
                              ),
                              Tab(
                                icon: Icon(
                                  Icons.photo_library,
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Align(
                                  alignment: Alignment(0, -1),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                    child: StreamBuilder<List<PostsRecord>>(
                                      stream: queryPostsRecord(
                                        queryBuilder: (postsRecord) =>
                                            postsRecord.where('user',
                                                isEqualTo:
                                                    currentUserReference),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<PostsRecord>
                                            gridViewPostsRecordList =
                                            snapshot.data;
                                        // Customize what your widget looks like with no query results.
                                        if (snapshot.data.isEmpty) {
                                          return Container(
                                            height: 100,
                                            child: Center(
                                              child: Text('No results.'),
                                            ),
                                          );
                                        }
                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            childAspectRatio: 1,
                                          ),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              gridViewPostsRecordList.length,
                                          itemBuilder:
                                              (context, gridViewIndex) {
                                            final gridViewPostsRecord =
                                                gridViewPostsRecordList[
                                                    gridViewIndex];
                                            return Image.network(
                                              gridViewPostsRecord.gifUrl,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(0, -1),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                    child: StreamBuilder<List<PostsRecord>>(
                                      stream: queryPostsRecord(
                                        queryBuilder: (postsRecord) =>
                                            postsRecord.where('liked_by',
                                                arrayContains:
                                                    currentUserReference),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<PostsRecord>
                                            gridViewPostsRecordList =
                                            snapshot.data;
                                        // Customize what your widget looks like with no query results.
                                        if (snapshot.data.isEmpty) {
                                          return Container(
                                            height: 100,
                                            child: Center(
                                              child: Text('No results.'),
                                            ),
                                          );
                                        }
                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            childAspectRatio: 1,
                                          ),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              gridViewPostsRecordList.length,
                                          itemBuilder:
                                              (context, gridViewIndex) {
                                            final gridViewPostsRecord =
                                                gridViewPostsRecordList[
                                                    gridViewIndex];
                                            return Image.network(
                                              gridViewPostsRecord.gifUrl,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
