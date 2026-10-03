import 'package:flutter/material.dart';

class HealthRecordModel {
  final String title;
  final String subtitle;
  final IconData icon;

  HealthRecordModel({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class HealthRecordProvider extends ChangeNotifier {
  final List<HealthRecordModel> records = [
    HealthRecordModel(
      title: 'Prescriptions',
      subtitle: 'View your medications',
      icon: Icons.medication_rounded,
    ),
    HealthRecordModel(
      title: 'Test Reports',
      subtitle: 'Access your lab results',
      icon: Icons.science_rounded,
    ),
    HealthRecordModel(
      title: 'Vitals',
      subtitle: 'Track key health metrics',
      icon: Icons.favorite_border_rounded,
    ),
    HealthRecordModel(
      title: 'Scans',
      subtitle: 'See your medical imaging',
      icon: Icons.image_search_rounded,
    ),
  ];

  void addRecord(HealthRecordModel record) {
    records.add(record);
    notifyListeners();
  }
}