import 'package:flutter/material.dart';
import 'years_screen.dart';
import 'subjects_screen.dart';

class ModuleInfo {
  final String id; // used as the Firestore field value
  final String title;
  final String yearTermKey; // e.g. 'year1_term2'
  final IconData icon;

  const ModuleInfo({
    required this.id,
    required this.title,
    required this.yearTermKey,
    required this.icon,
  });
}

const List<ModuleInfo> kAllModules = [
  // Year 1 - Term 2
  ModuleInfo(
    id: 'lcs105',
    title: 'LCS-105: Locomotor System',
    yearTermKey: 'year1_term2',
    icon: Icons.accessibility_new_outlined,
  ),
  ModuleInfo(
    id: 'cps106',
    title: 'CPS-106: Basics of Cardio-Pulmonary System',
    yearTermKey: 'year1_term2',
    icon: Icons.favorite_outline,
  ),
  ModuleInfo(
    id: 'gis107',
    title: 'GIS-107: Basics of Gastrointestinal System',
    yearTermKey: 'year1_term2',
    icon: Icons.restaurant_outlined,
  ),
  ModuleInfo(
    id: 'psy108',
    title: 'PSY-108: Psychology',
    yearTermKey: 'year1_term2',
    icon: Icons.psychology_alt_outlined,
  ),

  // Year 2 - Term 1
  ModuleInfo(
    id: 'nss201',
    title: 'NSS-201: Basics of Neuroscience and Special Senses',
    yearTermKey: 'year2_term1',
    icon: Icons.psychology_outlined,
  ),
  ModuleInfo(
    id: 'ecs202',
    title: 'ECS-202: Basics of Endocrine System',
    yearTermKey: 'year2_term1',
    icon: Icons.biotech_outlined,
  ),
  ModuleInfo(
    id: 'gus203',
    title: 'GUS-203: Basics of Genito-Urinary System',
    yearTermKey: 'year2_term1',
    icon: Icons.medication_outlined,
  ),
  ModuleInfo(
    id: 'pat204',
    title: 'PAT-204: Principles of Pathology',
    yearTermKey: 'year2_term1',
    icon: Icons.science_outlined,
  ),

  // Year 2 - Term 2
  ModuleInfo(
    id: 'mic206',
    title: 'MIC-206: Principles of Microbiology',
    yearTermKey: 'year2_term2',
    icon: Icons.coronavirus_outlined,
  ),
  ModuleInfo(
    id: 'imm207',
    title: 'IMM-207: Immunology and Immunopathology',
    yearTermKey: 'year2_term2',
    icon: Icons.shield_outlined,
  ),
  ModuleInfo(
    id: 'hem208',
    title: 'HEM-208: Hematological Disorders',
    yearTermKey: 'year2_term2',
    icon: Icons.bloodtype_outlined,
  ),
  ModuleInfo(
    id: 'sld209',
    title: 'SLD-209: Skin and Locomotor Disorders',
    yearTermKey: 'year2_term2',
    icon: Icons.healing_outlined,
  ),
  ModuleInfo(
    id: 'cpd210',
    title: 'CPD-210: Cardio-Pulmonary Disorders',
    yearTermKey: 'year2_term2',
    icon: Icons.monitor_heart_outlined,
  ),
  ModuleInfo(
    id: 'gid211',
    title: 'GID-211: Gastrointestinal Disorders',
    yearTermKey: 'year2_term2',
    icon: Icons.restaurant_menu_outlined,
  ),

  // Year 3 - Term 1
  ModuleInfo(
    id: 'nss301',
    title: 'NSS-301: Neuro and Special Senses Disorders',
    yearTermKey: 'year3_term1',
    icon: Icons.psychology_outlined,
  ),
  ModuleInfo(
    id: 'ecd302',
    title: 'ECD-302: Endocrine Disorders',
    yearTermKey: 'year3_term1',
    icon: Icons.biotech_outlined,
  ),
  ModuleInfo(
    id: 'gud303',
    title: 'GUD-303: Genito-Urinary Disorders',
    yearTermKey: 'year3_term1',
    icon: Icons.medication_outlined,
  ),
  ModuleInfo(
    id: 'cfm304',
    title: 'CFM-304: Community and Family Medicine',
    yearTermKey: 'year3_term1',
    icon: Icons.groups_outlined,
  ),
  ModuleInfo(
    id: 'pcp306',
    title: 'PCP-306: Primary Health Care and Public Health',
    yearTermKey: 'year3_term1',
    icon: Icons.health_and_safety_outlined,
  ),

  // Year 3 - Term 2
  ModuleInfo(
    id: 'oph307',
    title: 'OPH-307: Ophthalmology',
    yearTermKey: 'year3_term2',
    icon: Icons.visibility_outlined,
  ),
  ModuleInfo(
    id: 'orl308',
    title: 'ORL-308: Otorhinolaryngology',
    yearTermKey: 'year3_term2',
    icon: Icons.hearing_outlined,
  ),
];

class ModulesScreen extends StatelessWidget {
  final YearInfo year;
  final String termId;
  final String termTitle;

  const ModulesScreen({
    super.key,
    required this.year,
    required this.termId,
    required this.termTitle,
  });

  @override
  Widget build(BuildContext context) {
    final key = '${year.id}_$termId';
    final modules =
        kAllModules.where((m) => m.yearTermKey == key).toList();

    return Scaffold(
      appBar: AppBar(title: Text('${year.title} - $termTitle')),
      body: modules.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.school_outlined,
                        size: 56, color: Colors.grey.shade400),
                    const SizedBox(height: 12),
                    const Text(
                      'No modules added yet for this term.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: modules.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final module = modules[index];
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
                          builder: (_) => SubjectsScreen(
                            moduleId: module.id,
                            moduleTitle: module.title,
                            moduleColor: year.color,
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
