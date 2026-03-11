import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/strategy_market_screen.dart';
import 'screens/my_strategies_screen.dart';
import 'screens/ai_tools_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI交易工具平台',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E88E5),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xFF1E88E5),
          foregroundColor: Colors.white,
        ),
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E88E5),
          brightness: Brightness.dark,
          surface: const Color(0xFF1A1A1A),
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: const Color(0xFF1E1E1E),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xFF1A1A1A),
          foregroundColor: Colors.white,
        ),
        fontFamily: 'Roboto',
      ),
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/strategy_market': (context) => const StrategyMarketScreen(),
        '/my_strategies': (context) => const MyStrategiesScreen(),
        '/ai_tools': (context) => const AIToolsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
