import 'package:flutter/material.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/emergency_details_theme.dart';

class Panel extends StatelessWidget {
  final String title;
  final Color titleColor;
  final List<Widget> children;

  const Panel({
    super.key,
    required this.title,
    required this.children,
    this.titleColor = EmergencyDetailsTheme.accentGreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: EmergencyDetailsTheme.panelColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          ...children,
        ],
      ),
    );
  }
}

class DividerLine extends StatelessWidget {
  const DividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: EmergencyDetailsTheme.dividerColor,
    );
  }
}

class LabelValueRow extends StatelessWidget {
  final String label;
  final String value;

  const LabelValueRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            label,
            style: const TextStyle(
              color: EmergencyDetailsTheme.textGrey,
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 5,
          child: Text(
            value,
            style: const TextStyle(
              color: EmergencyDetailsTheme.textWhite,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}

class BulletBlock extends StatelessWidget {
  final String title;
  final String count;
  final String date;
  final String description;

  const BulletBlock({
    super.key,
    required this.title,
    required this.count,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    const bulletStyle = TextStyle(
      color: EmergencyDetailsTheme.textWhite,
      fontSize: 13,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('• ', style: bulletStyle),
            Text(title, style: bulletStyle),
          ],
        ),
        const SizedBox(height: 4),
        Text(count, style: bulletStyle),
        Text(date, style: bulletStyle),
        const SizedBox(height: 4),
        Text(
          description,
          style: const TextStyle(
            color: EmergencyDetailsTheme.textGrey,
            fontSize: 12,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}

class ContactRow extends StatelessWidget {
  final String title;
  final String name;
  final String phone;

  const ContactRow({
    super.key,
    required this.title,
    required this.name,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          '• ',
          style: TextStyle(
            color: EmergencyDetailsTheme.textWhite,
            fontSize: 13,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: EmergencyDetailsTheme.textWhite,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 14,
                    color: EmergencyDetailsTheme.textGrey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    name,
                    style: const TextStyle(
                      color: EmergencyDetailsTheme.textGrey,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.phone,
                    size: 14,
                    color: EmergencyDetailsTheme.accentGreen,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    phone,
                    style: const TextStyle(
                      color: EmergencyDetailsTheme.textGrey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EmptyContactBox extends StatelessWidget {
  final String title;

  const EmptyContactBox({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: EmergencyDetailsTheme.panelColor,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Text(
            '• ',
            style: TextStyle(
              color: EmergencyDetailsTheme.textWhite,
              fontSize: 13,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: EmergencyDetailsTheme.textWhite,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
