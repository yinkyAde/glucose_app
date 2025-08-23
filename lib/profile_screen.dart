import 'package:flutter/material.dart';
import 'package:glucose_app/widgets/section_label.dart';
import 'package:glucose_app/widgets/app_card.dart';
import 'package:glucose_app/widgets/device_Tile.dart';
import 'package:glucose_app/widgets/info_pill.dart';
import 'package:glucose_app/widgets/nav_row.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
      children: [
        Row(
          children: [
            Expanded(child: Text('Profile', style: GoogleFonts.inter(
                fontSize: 34, fontWeight: FontWeight.w800))),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: cs.surface, borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: const [
                  Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(width: 6),
                  Icon(Icons.edit, size: 16)
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        AppCard(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Emily Ashley', style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700)),
                    SizedBox(height: 6),
                    Text('EmiAshley@gmail.com', style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
              const CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage('assets/images/user.png'),
                // If you don't have assets, use backgroundColor:
                // backgroundColor: Color(0xFF222733),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        Row(
          children: const [
            Expanded(child: InfoPill(title: 'Diabetes', value: 'type 2')),
            SizedBox(width: 12),
            Expanded(child: InfoPill(title: 'Blood type', value: 'A+')),
          ],
        ),
        const SizedBox(height: 12),

        SectionLabel('My devices'),
        DeviceTile(title: 'Blood Glucose', subtitle: 'Meter', percent: .88),
        const SizedBox(height: 12),

        SectionLabel('Additional'),
        const NavRow(label: 'Go Premium'),
        const SizedBox(height: 12),
        const NavRow(label: 'Health info'),
        const SizedBox(height: 12),
        const NavRow(label: 'Settings'),
      ],
    );
  }
}