import 'package:flutter/material.dart';
import 'package:quick_notes/utils/constants.dart';
import 'package:quick_notes/utils/custom_theme.dart';

class NotesCard extends StatelessWidget {
  NotesCard({
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

  String truncateText(String text) {
    List<String> words = text.split(' ');
    if (words.length > 20) {
      words = words.sublist(0, 20);
      return words.join(' ') + '...';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Theme.of(context).insideCardPadding,
      margin: Theme.of(context).defaultPadding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isFav ? PRIMARY_COLOR.withOpacity(0.3) : Colors.white,
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
                      arguments: id,
                    );
                  },
                  child: Text(
                    title,
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
                arguments: id,
              );
            },
            child: Text(
              truncateText(description),
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
                date,
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
                  if (isFav)
                    const Icon(
                      Icons.star,
                      size: 30,
                      color: Colors.amber,
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
