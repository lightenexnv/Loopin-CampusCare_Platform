import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_controller.dart';
import '../controllers/report_controller.dart';
import '../screens/bottomnav.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Get.find<NavController>();
    nav.updateIndexByRoute(Get.currentRoute);
    final controller = Get.put(ReportController());

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      bottomNavigationBar: BottomNav(),


      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
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
                    Text("Report Issue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("Help improve our campus",
                        style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _title("What's the problem?"),
                      _subtitle("Describe the issue you want to report"),

                      const SizedBox(height: 16),
                      _label("Category *"),
                      _dropdown(),

                      const SizedBox(height: 16),
                      _label("Issue Title *"),
                      _textField("Brief summary of the issue", max: 100),

                      const SizedBox(height: 16),
                      _label("Description *"),
                      _textField(
                        "Provide details about the issue, including location and when it started...",
                        maxLines: 5,
                        max: 1000,
                      ),

                      const SizedBox(height: 16),
                      _label("Photo (Optional)"),


                      InkWell(
                        onTap: controller.pickImage,
                        child: Obx(
                              () => Container(
                            height: 140,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: controller.selectedImage.value == null
                                ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.add_a_photo_outlined,
                                    size: 30, color: Colors.grey),
                                SizedBox(height: 8),
                                Text("Tap to add a photo",
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            )
                                : ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                controller.selectedImage.value!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ),
                      ),


                      const SizedBox(height: 16),


                      Obx(
                            () => Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F3F6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.visibility_off_outlined),
                              const SizedBox(width: 8),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Report Anonymously",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text("Your identity will be hidden",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey)),
                                  ],
                                ),
                              ),
                              Switch(
                                value: controller.isAnonymous.value,
                                onChanged: controller.toggleAnonymous,
                              )
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),


                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E4BB8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Check & Submit", style: TextStyle(color: Colors.white),),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String text) => Text(
    text,
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );

  Widget _subtitle(String text) => Padding(
    padding: const EdgeInsets.only(top: 4),
    child: Text(text, style: const TextStyle(color: Colors.grey)),
  );

  Widget _label(String text) => Text(text,
      style: const TextStyle(fontWeight: FontWeight.bold));

  Widget _textField(String hint,
      {int maxLines = 1, int? max}) {
    return TextField(
      maxLines: maxLines,
      maxLength: max,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF6F7FB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _dropdown() {
    return DropdownButtonFormField<String>(
      items: const [
        DropdownMenuItem(value: "Water", child: Text("Water Issue")),
        DropdownMenuItem(value: "Electricity", child: Text("Electricity")),
        DropdownMenuItem(value: "Cleanliness", child: Text("Cleanliness")),
      ],
      onChanged: (value) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF6F7FB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      hint: const Text("Select a category"),
    );
  }
}
