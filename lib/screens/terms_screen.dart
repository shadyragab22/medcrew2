import 'package:flutter/material.dart';
import 'years_screen.dart';
import 'modules_screen.dart';

class TermsScreen extends StatelessWidget {
  final YearInfo year;

  const TermsScreen({super.key, required this.year});

  @override
  Widget build(BuildContext context) {
    final terms = [
      {'id': 'term1', 'title': 'Term 1'},
      {'id': 'term2', 'title': 'Term 2'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text(year.title)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: terms.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final term = terms[index];
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
                child: const Icon(Icons.calendar_month_outlined,
                    color: Colors.white),
              ),
              title: Text(
                term['title']!,
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
                    builder: (_) => ModulesScreen(
                      year: year,
                      termId: term['id']!,
                      termTitle: term['title']!,
                    ),
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
