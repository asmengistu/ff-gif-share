import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DestinationViewPageWidget extends StatefulWidget {
  DestinationViewPageWidget({Key key, this.destination}) : super(key: key);

  final String destination;

  @override
  _DestinationViewPageWidgetState createState() =>
      _DestinationViewPageWidgetState();
}

class _DestinationViewPageWidgetState extends State<DestinationViewPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: unsplashCall(
        query: widget.destination,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final destinationViewPageUnsplashResponse = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          body: SafeArea(
            child: Builder(
              builder: (context) {
                final searchResults = getJsonField(
                            destinationViewPageUnsplashResponse, r'$.results')
                        ?.toList() ??
                    [];
                return Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: searchResults.length,
                    itemBuilder: (context, searchResultsIndex) {
                      final searchResultsItem =
                          searchResults[searchResultsIndex];
                      return Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFF5F5F5),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.network(
                                getJsonField(searchResultsItem, r'$.urls.full'),
                                width: double.infinity,
                                height: 300,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
