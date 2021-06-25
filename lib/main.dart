//await Firebase.initializeApp();

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:payflow/app_widget.dart';
import 'package:payflow/modules/splash/splash_page.dart';

void main() => runApp(AppFirebase());

class AppFirebase extends StatefulWidget {
  const AppFirebase({Key? key}) : super(key: key);

  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return _getErrorPage();
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return AppWidget();
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return _getLoadingScreen();
      },
    );
  }

  Material _getLoadingScreen() {
    return Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Material _getErrorPage() {
    return Material(
      child: Center(
        child: Text(
          "Não foi possível iniciar o firebase.",
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
