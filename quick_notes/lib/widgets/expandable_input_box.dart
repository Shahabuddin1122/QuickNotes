import 'package:flutter/material.dart';
import 'package:quick_notes/utils/constants.dart';
import 'package:quick_notes/utils/custom_theme.dart';

class ExpandableInputBox extends StatefulWidget {
  const ExpandableInputBox(
      {required this.name, required this.value, super.key});
  final String name;
  final String value;

  @override
  State<ExpandableInputBox> createState() => _ExpandableInputBoxState();
}

class _ExpandableInputBoxState extends State<ExpandableInputBox> {
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
                  setState(() {
                    isEdit = !isEdit;
                  });
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
              ? Container(
                  constraints: BoxConstraints(
                    minHeight: 100,
                    maxHeight: 200,
                  ),
                  child: TextField(
                    controller: _controller,
                    expands: true,
                    minLines: null,
                    maxLines: null,
                    decoration: InputDecoration(
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
                )
              : Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
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
