import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FeedbackForm(),
  ));
}

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollController = TextEditingController();
  final TextEditingController feedbackController = TextEditingController();

  double rating = 5;
  String? selectedCategory;
  bool easyToUse = false;
  bool design = false;
  bool speed = false;
  bool support = false;
  bool agree = false;

  void handleSubmit() {
    print("Name: ${nameController.text}");
    print("Roll Number: ${rollController.text}");
    print("Feedback: ${feedbackController.text}");
    print("Rating: $rating");
    print("Category: $selectedCategory");
    print("Features liked:");
    if (easyToUse) print("- Easy to Use");
    if (design) print("- Design");
    if (speed) print("- Speed");
    if (support) print("- Support");
    print("Agreed to terms: $agree");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Feedback submitted successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Feedback Form'),
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name"),
            SizedBox(height: 6),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter your name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            Text("Roll Number"),
            SizedBox(height: 6),
            TextField(
              controller: rollController,
              decoration: InputDecoration(
                hintText: "Enter your roll number",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            Text("Enter your feedback..."),
            SizedBox(height: 6),
            TextField(
              controller: feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Rate your experience"),
                Text(rating.toInt().toString()),
              ],
            ),
            Slider(
              value: rating,
              min: 0,
              max: 10,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),
            SizedBox(height: 16),

            Text("Select a category"),
            SizedBox(height: 6),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: "Choose a category",
                border: OutlineInputBorder(),
              ),
              value: selectedCategory,
              items: ["UI", "Bug", "Performance", "Other"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),
            SizedBox(height: 20),

            Text("What features did you like?"),
            CheckboxListTile(
              title: Text("Easy to Use"),
              value: easyToUse,
              onChanged: (val) => setState(() => easyToUse = val!),
            ),
            CheckboxListTile(
              title: Text("Design"),
              value: design,
              onChanged: (val) => setState(() => design = val!),
            ),
            CheckboxListTile(
              title: Text("Speed"),
              value: speed,
              onChanged: (val) => setState(() => speed = val!),
            ),
            CheckboxListTile(
              title: Text("Support"),
              value: support,
              onChanged: (val) => setState(() => support = val!),
            ),
            CheckboxListTile(
              title: Text("I agree to the terms and conditions"),
              value: agree,
              onChanged: (val) => setState(() => agree = val!),
            ),
            SizedBox(height: 10),

            Center(
              child: ElevatedButton(
                onPressed: handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                ),
                child: Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
