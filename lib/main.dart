import 'package:flutter/material.dart';
import 'features/authentication/screens/login_screen.dart';
import 'features/authentication/screens/signup_screen.dart';
import 'features/dashboard/screens/dashboard_screen.dart';
import 'features/officer_profiles/screens/officer_list_screen.dart';
import 'features/reports/screens/submit_complaint_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(CorruptionExposedApp());
}

class CorruptionExposedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'This App Fights Corruption',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/officers': (context) => OfficerListScreen(),
        '/submit-complaint': (context) => SubmitComplaintScreen(),
        '/evidence-vault': (context) => Scaffold(
          appBar: AppBar(title: Text('Evidence Vault')),
          body: Center(child: Text('Evidence Vault Screen - Coming Soon')),
        ),
        '/corruption-map': (context) => Scaffold(
          appBar: AppBar(title: Text('Corruption Map')),
          body: Center(child: Text('Corruption Map Screen - Coming Soon')),
        ),
        '/complaints': (context) => Scaffold(
          appBar: AppBar(title: Text('All Complaints')),
          body: Center(child: Text('Complaints List Screen - Coming Soon')),
        ),
        '/officer-details': (context) => Scaffold(
          appBar: AppBar(title: Text('Officer Details')),
          body: Center(child: Text('Officer Details Screen - Coming Soon')),
        ),
      },
    );
  }
}
