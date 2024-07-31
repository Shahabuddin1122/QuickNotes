import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quick_notes/models/notes.dart';
import 'package:quick_notes/utils/api_sattings.dart';
import 'package:quick_notes/utils/constants.dart';
import 'package:quick_notes/utils/custom_theme.dart';
import 'package:quick_notes/widgets/customer_sidebar.dart';
import 'package:quick_notes/widgets/notes_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Notes>> notes;
  ApiSettings getNotes = ApiSettings(endPoint: 'note/get-notes');

  @override
  void initState() {
    super.initState();
    notes = fetchNotes();
  }

  Future<List<Notes>> fetchNotes() async {
    final response = await getNotes.getMethod();

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map<Notes>((note) => Notes.fromMap(note)).toList();
    } else {
      throw Exception('Failed to load notes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomerSidebar(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/notification'),
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 5,
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[300],
                  ),
                ),
              ),
              // Title Row
              Padding(
                padding: Theme.of(context).sectionDividerPadding,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notes",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("12 notes"),
                  ],
                ),
              ),
              // Recent and Highlighted Containers
              Padding(
                padding: Theme.of(context).sectionDividerPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Recent",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Highlighted",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Notes Cards
              FutureBuilder<List<Notes>>(
                future: notes,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return Padding(
                      padding: Theme.of(context).sectionDividerPadding,
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: snapshot.data!.map((note) {
                          return NotesCard(
                            id: note.id,
                            title: note.title,
                            description: note.description,
                            date: note.formattedDate,
                            isFav: note.favorite,
                          );
                        }).toList(),
                      ),
                    );
                  } else {
                    return Center(child: Text('No notes available'));
                  }
                },
              ),
            ],
          ),
        ),
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
