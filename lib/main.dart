import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/firebase_user_provider.dart';
import 'package:gif_share/login_page/login_page_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'home_page/home_page_widget.dart';
import 'profile_page/profile_page_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GifShareHomePage(),
    );
  }
}

class GifShareHomePage extends StatelessWidget {
  const GifShareHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GifShareFirebaseUser>(
      stream: gifShareFirebaseUser,
      initialData: gifShareFirebaseUser.value,
      builder: (context, snapshot) {
        return snapshot.data.when(
          user: (_) => NavBarHolder(),
          loggedOut: () => LoginPageWidget(),
          initial: () => Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4b39ef)),
              ),
            ),
          ),
        );
      },
    );
  }
}

class NavBarHolder extends StatefulWidget {
  NavBarHolder({Key key}) : super(key: key);

  @override
  _NavBarHolderState createState() => _NavBarHolderState();
}

/// This is the private State class that goes with NavBarHolder.
class _NavBarHolderState extends State<NavBarHolder> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      HomePageWidget(),
      ProfilePageWidget(),
    ];
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.home,
              size: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.person,
              size: 24,
            ),
            label: 'Profile',
          )
        ],
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        selectedItemColor: FlutterFlowTheme.primaryColor,
        unselectedItemColor: Color(0x8A000000),
        onTap: (i) => setState(() => _currentIndex = i),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
