import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfsScreen extends StatelessWidget {
  final Color moduleColor;
  final String subjectId;
  final String subjectTitle;

  const PdfsScreen({
    super.key,
    required this.moduleColor,
    required this.subjectId,
    required this.subjectTitle,
  });

  @override
  Widget build(BuildContext context) {
    final query = FirebaseFirestore.instance
        .collection('pdfs')
        .where('subject', isEqualTo: subjectId)
        .orderBy('title');

    return Scaffold(
      appBar: AppBar(title: Text(subjectTitle)),
      body: StreamBuilder<QuerySnapshot>(
        stream: query.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data?.docs ?? [];

          if (docs.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.picture_as_pdf_outlined,
                        size: 56, color: Colors.grey.shade400),
                    const SizedBox(height: 12),
                    const Text(
                      'No PDFs added yet for this subject.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: docs.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
              final title = (data['title'] ?? 'Untitled').toString();
              final url = (data['url'] ?? '').toString();

              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                child: ListTile(
                  leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                  title: Text(title),
                  trailing: const Icon(Icons.open_in_new, size: 18),
                  onTap: () => _openPdf(context, url),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _openPdf(BuildContext context, String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the PDF.')),
      );
    }
  }
}
