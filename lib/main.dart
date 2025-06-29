import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
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
      const SnackBar(content: Text("Feedback submitted successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Feedback Form'),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Name"),
            const SizedBox(height: 6),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Enter your name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            const Text("Roll Number"),
            const SizedBox(height: 6),
            TextField(
              controller: rollController,
              decoration: const InputDecoration(
                hintText: "Enter your roll number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            const Text("Enter your feedback..."),
            const SizedBox(height: 6),
            TextField(
              controller: feedbackController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Rate your experience"),
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
            const SizedBox(height: 16),

            const Text("Select a category"),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                hintText: "Choose  a category",
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
            const SizedBox(height: 20),

            const Text("What features did you like?"),
            CheckboxListTile(
              title: const Text("Easy to Use"),
              value: easyToUse,
              onChanged: (val) => setState(() => easyToUse = val!),
            ),
            CheckboxListTile(
              title: const Text("Design"),
              value: design,
              onChanged: (val) => setState(() => design = val!),
            ),
            CheckboxListTile(
              title: const Text("Speed"),
              value: speed,
              onChanged: (val) => setState(() => speed = val!),
            ),
            CheckboxListTile(
              title: const Text("Support"),
              value: support,
              onChanged: (val) => setState(() => support = val!),
            ),
            CheckboxListTile(
              title: const Text("I agree to the terms and conditions"),
              value: agree,
              onChanged: (val) => setState(() => agree = val!),
            ),
            const SizedBox(height: 10),

            Center(
              child: ElevatedButton(
                onPressed: handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                ),
                child: const Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}