import 'package:flutter/material.dart';

class ReminderModel {
  final String title;
  final String subtitle;
  final IconData icon;
  bool enabled;

  ReminderModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.enabled = false,
  });
}

class ReminderSectionModel {
  final String title;
  final List<ReminderModel> items;

  ReminderSectionModel({
    required this.title,
    required this.items,
  });
}

class ReminderProvider extends ChangeNotifier {
  final List<ReminderSectionModel> sections = [
    ReminderSectionModel(
      title: 'Medicine',
      items: [
        ReminderModel(
          title: 'Metformin',
          subtitle: '8:00 AM, Daily',
          icon: Icons.medication_rounded,
        ),
      ],
    ),
    ReminderSectionModel(
      title: 'Diet & Nutrition',
      items: [
        ReminderModel(
          title: 'Drink Water',
          subtitle: 'Every 2 hours',
          icon: Icons.water_drop_outlined,
        ),
      ],
    ),
    ReminderSectionModel(
      title: 'Appointments',
      items: [
        ReminderModel(
          title: 'Cardiologist Check-up',
          subtitle: 'Nov 28 at 2:00 PM',
          icon: Icons.calendar_month_rounded,
        ),
      ],
    ),
  ];

  void toggleReminder(ReminderModel reminder, bool value) {
    reminder.enabled = value;
    notifyListeners();
  }

  void addMedicineReminder({
    required String medicineName,
    required String dosage,
    required String time,
    required String duration,
  }) {
    sections.first.items.add(
      ReminderModel(
        title: medicineName,
        subtitle: '$dosage • $time • $duration',
        icon: Icons.medication_rounded,
        enabled: true,
      ),
    );

    notifyListeners();
  }
}