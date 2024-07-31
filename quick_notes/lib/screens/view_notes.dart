import 'package:flutter/material.dart';
import 'package:quick_notes/utils/constants.dart';
import 'package:quick_notes/utils/custom_theme.dart';
import 'package:quick_notes/widgets/expandable_input_box.dart';
import 'package:quick_notes/widgets/input_box.dart';

class ViewNotes extends StatelessWidget {
  const ViewNotes({super.key});

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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'View Notes',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Share'),
                  )
                ],
              ),
              InputBox(
                name: 'Title',
                value: 'Property Listings',
              ),
              const ExpandableInputBox(
                name: 'Description',
                value:
                    '''The annual company picnic will be held on August 20th at the Central Park. All employees and their families are invited. Activities include:\n\n- Games and competitions\n- BBQ lunch\n- Award ceremony\n\nPlease RSVP by August 10th.''',
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
