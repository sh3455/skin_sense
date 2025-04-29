import 'dart:io';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? deviceId;
  bool isLoading = true;
  List<Map<String, String>> answers = [];

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    await _loadDeviceId();
    await _fetchAnswersFromFirestore();
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

  Future<void> _fetchAnswersFromFirestore() async {
    if (deviceId == null) {
      print('Device ID is null');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cannot fetch answers: Device ID is missing')),
      );
      return;
    }

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(deviceId)
          .collection('answers')
          .get();

      answers = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return {
          'question': data['questionText'] as String,
          'answer': data['answer'] as String,
        };
      }).toList();
    } catch (e) {
      print('Error fetching answers: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching answers')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
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
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : answers.isEmpty
            ? Center(child: Text('No answers found.', style: TextStyle(fontSize: 18)))
            : ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: answers.length,
          itemBuilder: (context, index) {
            final answer = answers[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      answer['question']!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      answer['answer']!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}