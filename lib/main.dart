import 'package:cabeleleila/app/app.dart';
import 'package:cabeleleila/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR', null);
  setupDependencies();
  runApp(const App());
}
