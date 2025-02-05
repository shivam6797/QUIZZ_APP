import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizz_app/app_routes.dart';
import 'package:quizz_app/quiz_task_screen.dart';

class AvailableTaskScreen extends StatefulWidget {
  const AvailableTaskScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AvailableTaskScreenState createState() => _AvailableTaskScreenState();
}

class _AvailableTaskScreenState extends State<AvailableTaskScreen> {
  // List of test data
  final List<Map<String, dynamic>> _tests = [
    {
      "title": "Javascript Essentials",
      "rating": 4.8,
      "skills": ["Java Script", "Public", "ADP Solutions"],
      "status": "Cancelled",
      "statusColor": Colors.red,
      "category": "Public",
    },
    {
      "title": "Javascript Essentials",
      "rating": 4.8,
      "skills": ["Java", "Private", "ADP Solutions"],
      "status": "Ongoing",
      "statusColor": Colors.green,
      "category": "Private",
    },
    {
      "title": "Pytorch Module",
      "rating": 4.8,
      "skills": ["Python", "Hiring", "ADP Solutions"],
      "status": "Upcoming",
      "statusColor": Colors.blue,
      "category": "Hiring",
    },
    {
      "title": "K8s Services",
      "rating": 4.8,
      "skills": ["Kubernetes", "Private", "ADP Solutions"],
      "status": "Expired",
      "statusColor": Colors.red,
      "category": "Private",
    },
  ];

  // Selected category
  String _selectedCategory = "All";

  // Function to filter tests based on the selected category
  List<Map<String, dynamic>> get _filteredTests {
    if (_selectedCategory == "All") return _tests;
    return _tests
        .where((test) => test["category"] == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20,
        title: const Text('Available tests',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
                height: 30,
                width: 45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1.0)),
                child: const Icon(FontAwesomeIcons.sliders,
                    size: 15, color: Colors.black)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Filter Buttons
            Wrap(
              spacing: 8.0,
              children: ["All", "Public", "Private", "Hiring"].map((category) {
                final isSelected = _selectedCategory == category;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: isSelected ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1.0)),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            // Test Cards
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: _filteredTests.length,
                itemBuilder: (context, index) {
                  final test = _filteredTests[index];
                  return TestCard(
                    title: test["title"],
                    rating: test["rating"],
                    skills: test["skills"],
                    status: test["status"],
                    statusColor: test["statusColor"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 55,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
               Navigator.pushNamed(context,AppRoutes.ROUTE_QUIZ_TASK);
              },
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    FontAwesomeIcons.bookOpen,
                    size: 20,
                    color: Colors.black,
                  )),
            ),
            Icon(
              FontAwesomeIcons.gamepad,
              size: 20,
              color: Colors.white,
            ),
            Icon(
              FontAwesomeIcons.squarePollVertical,
              size: 20,
              color: Colors.white,
            ),
            Icon(
              FontAwesomeIcons.user,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class TestCard extends StatelessWidget {
  final String title;
  final double rating;
  final List<String> skills;
  final String status;
  final Color statusColor;

  const TestCard({
    required this.title,
    required this.rating,
    required this.skills,
    required this.status,
    required this.statusColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title.replaceAll(' ', '\n'),
                  style: const TextStyle(
                      fontFamily: "Nunito",
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      '$rating',
                      style: const TextStyle(
                          fontFamily: "Nunito",
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Skills
            ...skills.map((skill) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      skill.contains('Java Script') || skill.contains('Java')
                          ? Icons.code
                          : skill.contains('Kubernetes')
                              ? Icons.cloud
                              : Icons.account_balance,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      skill,
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              );
            }).toList(),
            // const Spacer(),
            SizedBox(
              height: 5,
            ),
            // Status
            Row(
              children: [
                Icon(
                  statusColor == Colors.green
                      ? Icons.check_circle
                      : Icons.cancel,
                  color: statusColor,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  status,
                  style: TextStyle(
                      color: statusColor,
                      fontFamily: "Nunito",
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
