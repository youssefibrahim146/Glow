import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow/constants/colors.dart';
import 'package:glow/constants/extensions.dart';
import 'package:glow/constants/strings.dart';
import 'package:glow/model/services/auth_sercives.dart';
import 'package:glow/model/services/firebase_services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AutismTestScreen extends StatefulWidget {
  const AutismTestScreen({super.key});

  @override
  State<AutismTestScreen> createState() => _AutismTestScreenState();
}

class _AutismTestScreenState extends State<AutismTestScreen> {
  bool isLoading = false;
  String result = "";
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/home_logo.png"),

                const SizedBox(height: 20),
                const Text(
                  "Please smile and take a photo to your self.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    final picker = ImagePicker();
                    final pickedFile = await picker.pickImage(
                      source: ImageSource.camera,
                    );
                    setState(() {
                      if (pickedFile != null) {
                        file = File(pickedFile.path);
                      }
                    });
                  },
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300],
                    ),
                    child:
                        file == null
                            ? const Center(
                              child: Text(
                                "Press Here to open the Camera",
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                            : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                image: FileImage(file!),
                                fit: BoxFit.cover,
                              ),
                            ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    String result = await uploadImage(file!);
                    setState(() {
                      isLoading = false;
                      this.result = result;
                      FirebaseServices.updateIsAutism(
                        result == "Autistic",
                      ).then((value) {
                        if (value is bool && value) {
                          print("Updated successfully");
                        } else {
                          print("Failed to update");
                        }
                      });
                    });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child:
                          isLoading
                              ? CircularProgressIndicator()
                              : Text(
                                "Show the result",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(result, style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        onPressed: () {
          FirebaseAuthService().signOut().then(
            (value) {
                Get.offAllNamed(AppStrings.loginRoute);

            },
          );
          //Get.toNamed(AppStrings.homeRoute);
        },
        child: const Text("Done", style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Future<String> uploadImage(File imageFile) async {
    const String apiUrl = "https://caeb-154-176-217-26.ngrok-free.app/predict";

    try {
      // Create a multipart request
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Add the image file to the request
      request.files.add(
        await http.MultipartFile.fromPath('image', imageFile.path),
      );

      // Send the request
      var response = await request.send();

      // Check the response status
      if (response.statusCode == 200) {
        // Parse the response
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        return jsonResponse['prediction']; // Return only the prediction field
      } else {
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      return "Exception: $e";
    }
  }
}
