import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quick_notes/utils/api_sattings.dart';
import 'package:quick_notes/utils/constants.dart';
import 'package:quick_notes/utils/custom_theme.dart';

class NotesCard extends StatefulWidget {
  const NotesCard({
    super.key,
    required this.description,
    required this.title,
    required this.date,
    required this.isFav,
    required this.id,
  });

  final String title, description, date;
  final bool isFav;
  final int id;

  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  late bool isFavLocal;

  @override
  void initState() {
    super.initState();
    isFavLocal = widget.isFav;
  }

  String truncateText(String text) {
    List<String> words = text.split(' ');
    if (words.length > 20) {
      words = words.sublist(0, 20);
      return words.join(' ') + '...';
    }
    return text;
  }

  Future<void> updateFavorite() async {
    Map<String, bool> data = {"favorite": !isFavLocal};
    ApiSettings updateNotes =
        ApiSettings(endPoint: 'note/update-notes/${widget.id}');
    final response = await updateNotes.putMethod(jsonEncode(data));

    if (response.statusCode == 200) {
      setState(() {
        isFavLocal = !isFavLocal;
      });
    } else {
      throw Exception('Failed to update favorite status');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Theme.of(context).insideCardPadding,
      margin: Theme.of(context).defaultPadding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isFavLocal ? PRIMARY_COLOR.withOpacity(0.3) : Colors.white,
          border: Border.all(
            width: 0.5,
            color: Colors.black,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/view-notes',
                      arguments: widget.id,
                    );
                  },
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                  ),
                ),
              ),
              const Icon(
                Icons.more_horiz,
                size: 30,
              ),
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/view-notes',
                arguments: widget.id,
              );
            },
            child: Text(
              truncateText(widget.description),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.date,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.people,
                    size: 30,
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      updateFavorite();
                    },
                    child: Icon(
                      isFavLocal ? Icons.star : Icons.star_border,
                      size: 30,
                      color: isFavLocal ? Colors.amber : Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
