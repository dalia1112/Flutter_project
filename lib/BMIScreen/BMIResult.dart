import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  final String gender;
  final int age;
  final double bmi;

  const BMIResult({
    super.key,
    required this.gender,
    required this.age,
    required this.bmi,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Result',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Gender: $gender",
                style:TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Age: $age",
                style:TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "BMI: ${bmi.toInt()}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            
            
            ],
          ),
        ),
      ),
    );
  }
}