import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0E1512),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(Colors.white),
          trackColor: MaterialStateProperty.all(Colors.grey.shade800),
        ),
      ),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  int _counter = 0;
  final ValueNotifier<bool> _showImage = ValueNotifier(false);
  final List<bool> _taskStatus = [false, false, false];

  final List<String> _tasks = [
    "Buy groceries",
    "Finish report",
    "Call mom",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interactive Demo"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(
          children: [
            const Text(
              "Counter",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text("Tap the button to increment the counter."),
            const SizedBox(height: 12),
            Text("Count: $_counter", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Center(
              child: ElevatedButton(
                onPressed: () => setState(() => _counter++),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent.shade400,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text("Increment"),
                ),
              ),
            ),

            const SizedBox(height: 28),
            const Text(
              "Toggle Visibility",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text("Toggle the visibility of the widget below."),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Show Widget"),
                ValueListenableBuilder(
                  valueListenable: _showImage,
                  builder: (context, value, _) => Switch(
                    value: value,
                    onChanged: (val) => _showImage.value = val,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ValueListenableBuilder(
              valueListenable: _showImage,
              builder: (context, value, _) {
                return value
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    "https://media.gettyimages.com/id/2204797442/photo/mls-2025-official-headshots.jpg?s=1024x1024&w=gi&k=20&c=1tTJSirEhnNKQB1BtcdeuGFEaSiCscX4jRUybqLpORU=",
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                )
                    : const SizedBox.shrink();
              },
            ),

            const SizedBox(height: 28),
            const Text(
              "Task List",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text("Mark tasks as completed by checking the boxes."),
            const SizedBox(height: 12),

            for (int i = 0; i < _tasks.length; i++)
              CheckboxListTile(
                value: _taskStatus[i],
                onChanged: (val) {
                  setState(() {
                    _taskStatus[i] = val!;
                  });
                },
                title: Text("Task ${i + 1}: ${_tasks[i]}"),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
          ],
        ),
      ),
    );
  }
}
