import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loopin/screens/bottomnav.dart';
import '../controllers/nav_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Get.find<NavController>();
    nav.updateIndexByRoute(Get.currentRoute);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      bottomNavigationBar: BottomNav(),
      body: Column(
        children: [

          /// 🔹 HEADER (unchanged logic)
          Container(
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 24),
            decoration: const BoxDecoration(
              color: Color(0xFF1E4BB8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.school, color: Colors.white),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back,",
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      "neil",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          /// 🔹 TOP CARD → STUDY MATERIALS
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0xFFE3F2FD),
                        child: Icon(Icons.picture_as_pdf,
                            color: Color(0xFF1E4BB8)),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {
                          print("hello world");
                        },
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Study Materials",
                                style: TextStyle(color: Colors.grey)),
                            Text("This Week",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                      )
                    ],
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "3",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: " new files",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          /// 🔹 QUICK ACTIONS
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Quick Actions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// ✅ Report Issue → Resources
          GestureDetector(
            onTap: () {
              print("hello world");
            },
            child: _actionTile(
              icon: Icons.menu_book,
              title: "Resources",
              subtitle: "Study materials & PDFs",
              iconBg: Color(0xFFE3F2FD),
            ),
          ),

          GestureDetector(
            onTap: () {
              print("hello world");
            },
            child: _actionTile(
              icon: Icons.groups_outlined,
              title: "Community Hub",
              subtitle: "Clubs, events & groups",
              iconBg: Color(0xFFE3F2FD),
            ),
          ),

          GestureDetector(
            onTap: () {
              print("hello world");
            },
            child: _actionTile(
              icon: Icons.chat_bubble_outline,
              title: "Chatrooms",
              subtitle: "Join temporary discussions",
              iconBg: Color(0xFFE8F5E9),
            ),
          ),

          /// 🔹 RECENT RESOURCES
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Recent Resources",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                OutlinedButton(
                  onPressed: null,
                  child: Text("View All",
                      style: TextStyle(color: Color(0xFF1E4BB8))),
                )
              ],
            ),
          ),

          /// 🔹 RESOURCE CARD
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFFE3F2FD),
                    child:
                    Icon(Icons.description, color: Color(0xFF1E4BB8)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Data Structures Notes",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Chip(
                              label: Text("PDF",
                                  style: TextStyle(fontSize: 12)),
                              backgroundColor: Color(0xFFE3F2FD),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.schedule, size: 16),
                            SizedBox(width: 4),
                            Text("35m ago",
                                style: TextStyle(color: Colors.grey)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Action Tile (unchanged)
  static Widget _actionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconBg,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: iconBg,
              child: Icon(icon, color: Colors.black87),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(subtitle,
                      style: const TextStyle(
                          color: Colors.grey, fontSize: 13)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
