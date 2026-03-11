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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A73E8)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
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