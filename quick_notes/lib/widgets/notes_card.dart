import 'package:flutter/material.dart';
import 'package:quick_notes/utils/constants.dart';
import 'package:quick_notes/utils/custom_theme.dart';

class NotesCard extends StatelessWidget {
  NotesCard(
      {super.key,
      required this.description,
      required this.title,
      required this.date,
      required this.isFav});
  String title, description, date;
  bool isFav;

  String truncateText(String text) {
    List<String> words = text.split(' ');
    if (words.length > 30) {
      words = words.sublist(0, 30);
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
        color: PRIMARY_COLOR.withOpacity(0.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/view-notes');
                },
                child: Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
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
              Navigator.pushNamed(context, '/view-notes');
            },
            child: Text(
              truncateText(
                description,
              ),
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
