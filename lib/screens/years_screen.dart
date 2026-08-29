import 'package:flutter/material.dart';
import 'terms_screen.dart';

class YearInfo {
  final String id;
  final String title;
  final Color color;

  const YearInfo({
    required this.id,
    required this.title,
    required this.color,
  });
}

const List<YearInfo> kYears = [
  YearInfo(id: 'year1', title: 'Year 1', color: Color(0xFF2E7D32)),
  YearInfo(id: 'year2', title: 'Year 2', color: Color(0xFF00838F)),
  YearInfo(id: 'year3', title: 'Year 3', color: Color(0xFFAD1457)),
  YearInfo(id: 'year4', title: 'Year 4', color: Color(0xFF6A1B9A)),
  YearInfo(id: 'year5', title: 'Year 5', color: Color(0xFFEF6C00)),
];

class YearsScreen extends StatelessWidget {
  const YearsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MedCrew')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: kYears.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final year = kYears[index];
          return Card(
            elevation: 0,
            color: year.color.withValues(alpha: 0.08),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: year.color.withValues(alpha: 0.2)),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: CircleAvatar(
                backgroundColor: year.color,
                child: const Icon(Icons.school_outlined, color: Colors.white),
              ),
              title: Text(
                year.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TermsScreen(year: year),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
