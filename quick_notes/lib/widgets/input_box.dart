import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quick_notes/models/notes.dart';
import 'package:quick_notes/utils/api_sattings.dart';
import 'package:quick_notes/utils/constants.dart';
import 'package:quick_notes/utils/custom_theme.dart';

class InputBox extends StatefulWidget {
  InputBox(
      {required this.name, required this.value, required this.id, super.key});
  String name, value;
  int id;

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  bool isEdit = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> updateNote() async {
    final newTitle = _controller.text;
    if (newTitle.isEmpty || newTitle == widget.value) return;

    Map<String, String> data = {"title": newTitle};
    final response =
        await ApiSettings(endPoint: 'note/update-notes/${widget.id}')
            .putMethod(jsonEncode(data));

    if (response.statusCode == 200) {
      // Optionally, you can handle the response, e.g., by updating the local state
      // with the updated note data returned from the API if necessary.
      setState(() {
        widget.value = newTitle; // Update the value in the UI
        isEdit = false; // Exit edit mode
      });
    } else {
      throw Exception('Failed to update note');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Theme.of(context).sectionDividerPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (isEdit) {
                    updateNote();
                  } else {
                    setState(() {
                      isEdit = true;
                    });
                  }
                },
                child: Icon(
                  isEdit ? Icons.check : Icons.edit,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          isEdit
              ? TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: widget.value,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                  ),
                )
              : Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    widget.value,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
