import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_notes/utils/api_sattings.dart';
import 'package:quick_notes/utils/constants.dart';
import 'package:quick_notes/utils/custom_theme.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  File? _image;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  ApiSettings store_information = ApiSettings(endPoint: 'note/add-note');
  bool _isLoading = false; // Flag to track loading state

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> storeInformation() async {
    String title = titleController.text;
    String description = descriptionController.text;
    print(title);
    print(description);
    print(_image);

    // Set loading state to true
    setState(() {
      _isLoading = true;
    });

    // Create a multipart request
    var uri = Uri.parse(store_information.uri);
    var request = http.MultipartRequest('POST', uri);

    // Add text fields
    request.fields['title'] = title;
    request.fields['description'] = description;

    // Add image file if it exists
    if (_image != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'attachment',
          _image!.path,
        ),
      );
    }

    try {
      // Send the request
      final response = await request.send();

      // Get the response
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 201) {
        print('Data posted successfully: $responseBody');
        Navigator.pushNamed(context, '/');
      } else {
        print('Failed to post data. Status code: ${response.statusCode}');
        print('Response body: $responseBody');
      }
    } catch (e) {
      print('Error occurred: $e');
    } finally {
      // Set loading state to false
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add notes'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/notification'),
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Show spinner while loading
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ready to start taking notes?',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'Add Notes',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Share'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Title",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: titleController,
                            decoration: InputDecoration(
                              hintText: "write a title",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            constraints: const BoxConstraints(
                              minHeight: 100,
                              maxHeight: 200,
                            ),
                            child: TextField(
                              controller: descriptionController,
                              expands: true,
                              minLines: null,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'Enter description here',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                              ),
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: Theme.of(context).sectionDividerPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Attachments",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: _image == null
                                  ? const Icon(
                                      Icons.add,
                                      size: 60,
                                    )
                                  : Image.file(
                                      _image!,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          storeInformation();
                        },
                        child: const Text('Save'),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
