import 'package:flutter/material.dart';
import 'package:quick_notes/utils/constants.dart';
import 'package:quick_notes/utils/custom_theme.dart';
import 'package:quick_notes/widgets/customer_sidebar.dart';
import 'package:quick_notes/widgets/notes_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
              Padding(
                padding: Theme.of(context).sectionDividerPadding,
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    NotesCard(
                      title: "Property Listings",
                      description:
                          '''The annual company picnic will be held on August 20th at the Central Park. All employees and their families are invited. Activities include:\n\n- Games and competitions\n- BBQ lunch\n- Award ceremony\n\nPlease RSVP by August 10th.''',
                      date: "Jun 23",
                      isFav: false,
                    ),
                    NotesCard(
                      title: "Property Listings",
                      description:
                          '''The annual company picnic will be held on August 20th at the Central Park. All employees and their families are invited. Activities include:\n\n- Games and competitions\n- BBQ lunch\n- Award ceremony\n\nPlease RSVP by August 10th.''',
                      date: "Jun 23",
                      isFav: true,
                    ),
                  ],
                ),
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
