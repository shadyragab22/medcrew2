import 'package:flutter/material.dart';
import 'subjects_screen.dart';

class ModuleInfo {
  final String id; // used as the Firestore collection/field value
  final String title;
  final IconData icon;
  final Color color;

  const ModuleInfo({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
  });
}

const List<ModuleInfo> kModules = [
  ModuleInfo(
    id: 'nss301',
    title: 'NSS-301: Neuro and Special Senses Disorders',
    icon: Icons.psychology_outlined,
    color: Color(0xFF2E7D32),
  ),
  ModuleInfo(
    id: 'ecd302',
    title: 'ECD-302: Endocrine Disorders',
    icon: Icons.biotech_outlined,
    color: Color(0xFFAD1457),
  ),
  ModuleInfo(
    id: 'gud303',
    title: 'GUD-303: Genito-Urinary Disorders',
    icon: Icons.medication_outlined,
    color: Color(0xFF00838F),
  ),
  ModuleInfo(
    id: 'cfm304',
    title: 'CFM-304: Community and Family Medicine',
    icon: Icons.groups_outlined,
    color: Color(0xFF6A1B9A),
  ),
  ModuleInfo(
    id: 'bcs305',
    title: 'BCS-305: Basic Clinical Skills II',
    icon: Icons.medical_services_outlined,
    color: Color(0xFFEF6C00),
  ),
  ModuleInfo(
    id: 'pcp306',
    title: 'PCP-306: Primary Health Care and Public Health',
    icon: Icons.health_and_safety_outlined,
    color: Color(0xFF00695C),
  ),
  ModuleInfo(
    id: 'oph307',
    title: 'OPH-307: Ophthalmology',
    icon: Icons.visibility_outlined,
    color: Color(0xFF1565C0),
  ),
  ModuleInfo(
    id: 'orl308',
    title: 'ORL-308: Otorhinolaryngology',
    icon: Icons.hearing_outlined,
    color: Color(0xFFC62828),
  ),
];

class ModulesScreen extends StatelessWidget {
  const ModulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MedCrew')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: kModules.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final module = kModules[index];
          return Card(
            elevation: 0,
            color: module.color.withValues(alpha: 0.08),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: module.color.withValues(alpha: 0.2)),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: CircleAvatar(
                backgroundColor: module.color,
                child: Icon(module.icon, color: Colors.white),
              ),
              title: Text(
                module.title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SubjectsScreen(module: module),
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
