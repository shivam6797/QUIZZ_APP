import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final String question = "'OS' computer abbreviation\nusually means ?";
  final List<String> options = [
    "Order of Significance",
    "Open Software",
    "Operating System",
    "Optical Sensor"
  ];

  final int correctIndex = 1;

  int? selectedIndex;

  bool showAnswer = false;

  /// Builds the custom circular indicator.
  Widget _buildRadioIndicator(int index) {
    const double size = 24.0;
    const double iconSize = 16.0;
    const borderColor = Colors.black;

    // Before "Check Answer": always show blank circle with border.
    if (!showAnswer) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: borderColor),
        ),
      );
    } else {
      // After "Check Answer" is pressed:
      if (selectedIndex == index) {
        // If the user selected this option:
        if (index == correctIndex) {
          // Correct selection: dark green with check icon.
          return Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff265b45),
            ),
            child: const Center(
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: iconSize,
              ),
            ),
          );
        } else {
          // Incorrect selection: white with border and red cross icon.
          return Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: borderColor),
            ),
            child: const Center(
              child: Icon(
                Icons.close,
                color: Colors.red,
                size: iconSize,
              ),
            ),
          );
        }
      } else {
        // For unselected options, always show blank white circle with border.
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: borderColor),
          ),
        );
      }
    }
  }

  /// Reset the quiz for reattempt
  void _resetQuiz() {
    setState(() {
      selectedIndex = null;
      showAnswer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFf6f6f6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 11.0),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(FontAwesomeIcons.chevronLeft,
                      size: 17, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 11.0,),
                child: Text(
                  "Stumbl",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset("assets/images/logo_remainder_app.png",
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high),
              Padding(
                padding: const EdgeInsets.only(top: 11.0, left: 5),
                child: Text(
                  "Board",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 11.0, left: 60),
                child: Text(
                  "4/4",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Divider(
            indent: 15,
            endIndent: 15,
            height: 10,
            color: Colors.black,
            thickness: 1,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: double.infinity,
              padding: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  color: Color(0XFFfcfbfc),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.clock,
                              size: 16,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "00:34",
                              textAlign: TextAlign.start,
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Icon(
                          FontAwesomeIcons.ellipsis,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    elevation: 2,
                    margin: EdgeInsets.only(top: 20),
                    child: Container(
                      height: 25,
                      width: 210,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text(
                        "Web development  >  JavaScript",
                        textAlign: TextAlign.start,
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    question,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Select one answer",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        // Determine container background color based on submission state and selection.
                        Color containerColor = Colors.white;
                        if (showAnswer && selectedIndex == index) {
                          containerColor = index == correctIndex
                              ? Color(0xff799b8d)
                              : Color(0xffe6685e);
                        }
                        // for text color
                        Color textColor = Colors.black;
                        if (showAnswer && selectedIndex == index) {
                          textColor = index == correctIndex
                              ? Colors.white
                              : Colors.white;
                        }
                        return GestureDetector(
                          onTap: () {
                            if (!showAnswer) {
                              setState(() {
                                selectedIndex = index;
                              });
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            decoration: BoxDecoration(
                                color: containerColor,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.black, width: 0.9)),
                            child: Row(
                              children: [
                                // Our custom "radio" circle
                                _buildRadioIndicator(index),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    options[index],
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 14,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          setState(() {
            // If answer is not yet revealed, reveal it.
            if (!showAnswer) {
              showAnswer = true;
            } else {
              // If answer is already shown, reset quiz for reattempt.
              _resetQuiz();
            }
          });
        },
        child: Container(
          height: 55,
          width: double.infinity,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              showAnswer ? "Reattempt" : "Submit",
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
