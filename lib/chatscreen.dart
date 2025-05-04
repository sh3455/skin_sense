import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skinsense1/api_key.dart';
import 'package:skinsense1/homescreen.dart';

import 'dart:convert';

class GeminiChatScreen extends StatefulWidget {
  @override
  _GeminiChatScreenState createState() => _GeminiChatScreenState();
}

class _GeminiChatScreenState extends State<GeminiChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];
  bool _isLoading = false;

  static String geminiApiUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=${ApiKeys.geminiApiKey}";

  // List of skincare-related keywords
  static const List<String> skincareKeywords = [
    "skincare",
    "skin",
    "face",
    "cream",
    "serum",
    "acne",
    "moisturizer",
    "sunscreen"
  ];

  Future<void> sendMessage(String userMessage) async {
    setState(() {
      messages.add({"sender": "user", "text": userMessage});
      _isLoading = true;
    });

    // Detect if the input is Arabic
    bool isArabic = _detectArabic(userMessage);

    // Prepare the API request payload
    String prompt;
    if (isArabic) {
      prompt = "جاوب باختصار وبطريقة مباشرة باللغة العربية لا تزيد عن 3 جمل: $userMessage";
    } else {
      prompt = "Answer briefly and directly in English, no more than 3 sentences: $userMessage";
    }

    try {
      final response = await http.post(
        Uri.parse(geminiApiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": prompt}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String botReply = data["candidates"][0]["content"]["parts"][0]["text"];
        botReply = botReply.replaceAll('*', '');

        setState(() {
          messages.add({"sender": "bot", "text": botReply});
        });
      } else {
        setState(() {
          messages.add({"sender": "bot", "text": "Error: ${response.statusCode}"});
        });
      }
    } catch (e) {
      setState(() {
        messages.add({"sender": "bot", "text": "Failed to connect to Gemini API"});
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  // Simple function to detect Arabic text based on Arabic characters
  bool _detectArabic(String text) {
    final arabicPattern = RegExp(r'[\u0600-\u06FF]');
    return arabicPattern.hasMatch(text);
  }

  bool _isSkincareRelated(String text) {
    return skincareKeywords.any((keyword) => text.toLowerCase().contains(keyword));
  }

  @override
  void initState() {
    super.initState();
    messages.add({
      "sender": "bot",
      "text": "Welcome to SkinSense! 💖 I'm here to help with skincare questions. Type a product or skincare query!",
    });
  }

  void _goToHomeScreen() {
    Navigator.pop(context);
  }

  Widget buildMessage(String text, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Color(0xFFF5D5DD) : Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: isUser ? Color(0xFFE5B2CA) : Colors.grey[200]!,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Roboto',
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SkinSense Chat',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: _goToHomeScreen,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF8E1E7),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  return buildMessage(msg['text']!, msg['sender'] == 'user');
                },
              ),
            ),
            if (_isLoading)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: Color(0xFFE5B2CA),
                  strokeWidth: 3,
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Type a skincare product name...",
                        hintStyle: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: 'Roboto',
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xFFE5B2CA),
                            width: 2,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFE5B2CA),
                          Color(0xFFF5D5DD),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () {
                        String text = _controller.text.trim();
                        if (text.isNotEmpty) {
                          _controller.clear();
                          sendMessage(text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Send',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.send, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}