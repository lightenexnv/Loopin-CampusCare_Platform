import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_controller.dart';
import '../screens/bottomnav.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    final nav = Get.find<NavController>();
    nav.updateIndexByRoute(Get.currentRoute);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      bottomNavigationBar:BottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 80),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
                decoration: const BoxDecoration(
                  color: Color(0xFF1E4BB8),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Community",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Clubs, events & study groups",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40,),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Transform.translate(
                  offset: const Offset(0, -20),
                  child: _searchBar(),
                ),
              ),

              _filters(),
              const SizedBox(height: 16),
              _categoryRow(),
              const SizedBox(height: 24),
              _emptyState(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filters() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _FilterButton(
              icon: Icons.groups,
              label: "Clubs",
              isSelected: selectedFilter == 0,
              onTap: () => setState(() => selectedFilter = 0),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: _FilterButton(
              icon: Icons.menu_book,
              label: "Events",
              isSelected: selectedFilter == 1,
              onTap: () => setState(() => selectedFilter = 1),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: _FilterButton(
              icon: Icons.calendar_today,
              label: "Study Groups",
              isSelected: selectedFilter == 2,
              onTap: () => setState(() => selectedFilter = 2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.filter_list, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(child: Text("All Categories")),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E4BB8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.add, color: Colors.white),
                SizedBox(width: 6),
                Text("Create", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyState() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(Icons.groups_outlined, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          const Text("No clubs found", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterButton({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade200 : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 20,
                color: isSelected ? const Color(0xFF1E4BB8) : Colors.grey),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color:
                isSelected ? const Color(0xFF1E4BB8) : Colors.grey,
                fontWeight:
                isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
