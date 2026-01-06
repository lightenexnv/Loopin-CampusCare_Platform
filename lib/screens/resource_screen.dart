import 'package:flutter/material.dart';
import '../screens/bottomnav.dart';
class ResourcePage extends StatefulWidget {
  const ResourcePage({super.key});

  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  String selectedBranch = 'All';
  String selectedSubject = 'All';
  String selectedFormat = 'All';

  final branches = ['All', 'CSE', 'ECE', 'ME', 'CE'];
  final types = ['All', 'PDF', 'DOC', 'Image'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      backgroundColor: const Color(0xffF6F8FC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              /// 🔵 HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xff1E40AF),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Resources",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Upload & share study materials",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// 🔍 SEARCH
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search resources...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [

                      /// 🏫 BRANCH FILTER
                      FilterDropdownChip(
                        label: "Branch",
                        value: selectedBranch,
                        items: ['All', 'CSE', 'ECE', 'ME', 'CE'],
                        onSelected: (value) {
                          setState(() => selectedBranch = value);
                        },
                      ),

                      const SizedBox(width: 10),

                      /// 📘 SUBJECT FILTER
                      FilterDropdownChip(
                        label: "Subject",
                        value: selectedSubject,
                        items: [
                          'All',
                          'DSA',
                          'OS',
                          'DBMS',
                          'CN',
                          'AI',
                        ],
                        onSelected: (value) {
                          setState(() => selectedSubject = value);
                        },
                      ),

                      const SizedBox(width: 10),

                      /// 📂 FORMAT FILTER
                      FilterDropdownChip(
                        label: "Format",
                        value: selectedFormat,
                        items: ['All', 'PDF', 'DOC', 'Image'],
                        onSelected: (value) {
                          setState(() => selectedFormat = value);
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// ➕ UPLOAD BUTTON
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.upload_file,color: Colors.white,),
                    label: const Text("Upload Resource",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1E40AF),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      // TODO: integrate file picker
                    },
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// 📭 EMPTY STATE
              Column(
                children: const [
                  Icon(Icons.folder_off, size: 70, color: Colors.grey),
                  SizedBox(height: 10),
                  Text(
                    "No resources found",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Upload the first resource",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // /// 📚 RESOURCE CARD (SAMPLE)
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: ResourceCard(
              //     title: "Operating System Notes",
              //     branch: "CSE",
              //     type: "PDF",
              //   ),
              // ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterDropdownChip extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String> onSelected;

  const FilterDropdownChip({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final displayValue = value ?? 'All';

    return PopupMenuButton<String>(
      onSelected: (val) {
        onSelected(val);
            },
      itemBuilder: (context) {
        return items
            .map(
              (item) => PopupMenuItem<String>(
            value: item,
            child: Text(item),
          ),
        )
            .toList();
      },
      child: InputChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("$label: $displayValue"),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, size: 18),
          ],
        ),
      ),
    );
  }
}


/// 📦 RESOURCE CARD WIDGET
class ResourceCard extends StatelessWidget {
  final String title;
  final String branch;
  final String type;

  const ResourceCard({
    super.key,
    required this.title,
    required this.branch,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child: Icon(
              type == "PDF"
                  ? Icons.picture_as_pdf
                  : type == "Image"
                  ? Icons.image
                  : Icons.description,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("$branch • $type",
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {
              // TODO: download logic
            },
          ),
        ],
      ),
    );
  }
}
