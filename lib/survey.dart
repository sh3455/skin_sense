import 'dart:io';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skinsense1/homescreen.dart';

class SurveyQuestion {
  final String text;
  final List<String> options;
  final List<IconData>? icons;

  SurveyQuestion({
    required this.text,
    required this.options,
    this.icons,
  });
}

class SurveyScreen extends StatefulWidget {
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  List<SurveyQuestion> questions = [];
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  String? deviceId;
  bool isLoading = true;
  bool noQuestions = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    await _loadDeviceId();
    await _fetchQuestionsFromFirestore();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _loadDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.id;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      }
      print('Device ID: $deviceId');
    } catch (e) {
      print('Error getting device ID: $e');
    }
  }

  Future<void> _fetchQuestionsFromFirestore() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('personal')
          .doc('question')
          .get();

      if (!doc.exists || doc.data() == null) {
        setState(() {
          noQuestions = true;
        });
        return;
      }

      final data = doc.data() as Map<String, dynamic>;

      data.forEach((questionText, value) {
        final options = (value as List<dynamic>).cast<String>();

        List<IconData>? icons;
        if (questionText.toLowerCase().contains("gender")) {
          icons = [Icons.female, Icons.male, Icons.transgender];
        }

        questions.add(SurveyQuestion(
          text: questionText,
          options: options,
          icons: icons,
        ));
      });
    } catch (e) {
      print('Error fetching questions: $e');
      setState(() {
        noQuestions = true;
      });
    }
  }

  Future<void> _saveAnswerToFirestore(String questionText, String answer) async {
    if (deviceId == null) {
      print('Device ID is null');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cannot save answer: Device ID is missing')),
      );
      return;
    }

    String cleanQuestionText = questionText.replaceAll(' ', '_').replaceAll('?', '').replaceAll('.', '');

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(deviceId)
          .collection('answers')
          .doc(cleanQuestionText)
          .set({
        'questionText': questionText,
        'answer': answer,
        'deviceId': deviceId,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print('Answer saved successfully for question: $questionText');
    } catch (e) {
      print('Error saving answer: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving answer')),
      );
    }
  }

  Future<void> _submitAnswer() async {
    if (selectedAnswer != null) {
      await _saveAnswerToFirestore(
        questions[currentQuestionIndex].text,
        selectedAnswer!,
      );

      setState(() {
        selectedAnswer = null;
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (noQuestions || questions.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text('No questions available at the moment.', style: TextStyle(fontSize: 18)),
        ),
      );
    }

    final question = questions[currentQuestionIndex];
    double progress = (currentQuestionIndex + 1) / questions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Skin Care Survey'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.pink[50]!,
              Colors.pink[100]!,
            ],
          ),
        ),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: Colors.black,
              minHeight: 5,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question.text,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 20),
                    ...question.options.asMap().entries.map(
                          (entry) {
                        int index = entry.key;
                        String option = entry.value;
                        return RadioListTile<String>(
                          title: Row(
                            children: [
                              if (question.icons != null && index < question.icons!.length)
                                Icon(question.icons![index], color: Colors.black54),
                              SizedBox(width: 10),
                              Text(option),
                            ],
                          ),
                          value: option,
                          groupValue: selectedAnswer,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer = value;
                            });
                          },
                        );
                      },
                    ),
                    Spacer(),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: selectedAnswer != null ? _submitAnswer : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                          ),
                          child: Text(
                            currentQuestionIndex < questions.length - 1 ? 'Continue' : 'Finish',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}