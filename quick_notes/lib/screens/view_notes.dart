import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quick_notes/models/notes.dart';
import 'package:quick_notes/utils/api_sattings.dart';
import 'package:quick_notes/utils/constants.dart';
import 'package:quick_notes/utils/custom_theme.dart';
import 'package:quick_notes/widgets/expandable_input_box.dart';
import 'package:quick_notes/widgets/input_box.dart';

class ViewNotes extends StatefulWidget {
  final int id;

  const ViewNotes({Key? key, required this.id}) : super(key: key);

  @override
  State<ViewNotes> createState() => _ViewNotesState();
}

class _ViewNotesState extends State<ViewNotes> {
  late Future<Notes> note;

  @override
  void initState() {
    super.initState();
    note = fetchNote();
  }

  Future<Notes> fetchNote() async {
    final response =
        await ApiSettings(endPoint: 'note/get-individual-note/${widget.id}')
            .getMethod();

    if (response.statusCode == 200) {
      return Notes.fromJson(response.body);
    } else {
      throw Exception('Failed to load note');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View notes'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/notification'),
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: FutureBuilder<Notes>(
        future: note,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          }

          final note = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 5,
              left: 20,
              right: 20,
              bottom: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Shahabuddin\'s Notes',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            softWrap: true,
                          ),
                          Text(
                            'last updated in ${note.formattedDate}',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        if (note.favorite)
                          const Icon(Icons.star, color: Colors.amber, size: 30),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Share'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InputBox(
                  name: 'Title',
                  value: note.title,
                ),
                ExpandableInputBox(
                  name: 'Description',
                  value: note.description,
                ),
                const SizedBox(height: 15),
                if (note.attachments.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Attachment",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      for (var attachment in note.attachments)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.memory(
                            base64Decode(attachment.image),
                            width: 200,
                          ),
                        ),
                    ],
                  )
              ],
            ),
          );
        },
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          backgroundColor: SECONDARY_COLOR,
          onPressed: () {
            Navigator.pushNamed(context, '/add-notes');
          },
          child: const Icon(
            Icons.add,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
