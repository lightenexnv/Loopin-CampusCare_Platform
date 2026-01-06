import 'package:get/get.dart';
import 'package:loopin/screens/login.dart';
import 'package:loopin/screens/resource_screen.dart';
import '../screens/home_screen.dart';
import '../screens/report_screen.dart';
import '../screens/community_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/profile_screen.dart';

class AppRoutes {
  static const home = '/';
  // static const report = '/report';
  static const community = '/community';
  static const chat = '/chat';
  static const profile = '/profile';
  static const auth = '/auth';
  static const resource = '/resource';

  static final pages = [
    GetPage(name: home, page: () => const HomeScreen()),
    // GetPage(name: report, page: () => const ReportScreen()),
    GetPage(name: community, page: () => const CommunityScreen()),
    GetPage(name: chat, page: () => const ChatScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: auth, page: () => const AuthScreen()),
    GetPage(name: resource, page: () => const ResourcePage()),

  ];
}
