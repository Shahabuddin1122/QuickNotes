import 'package:flutter/material.dart';
import 'package:quick_notes/utils/constants.dart';
import 'package:quick_notes/utils/custom_theme.dart';

class InputBox extends StatefulWidget {
  InputBox({required this.name, required this.value, super.key});
  String name, value;

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  bool isEdit = false;

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
              ? TextField(
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
                    style: TextStyle(
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
