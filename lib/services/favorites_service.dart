import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// A simple favorite PDF record stored locally on the device.
class FavoritePdf {
  final String id; // Firestore document id of the pdf
  final String title;
  final String url;
  final String subjectId;

  FavoritePdf({
    required this.id,
    required this.title,
    required this.url,
    required this.subjectId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'url': url,
        'subjectId': subjectId,
      };

  factory FavoritePdf.fromJson(Map<String, dynamic> json) => FavoritePdf(
        id: json['id'] as String,
        title: json['title'] as String,
        url: json['url'] as String,
        subjectId: json['subjectId'] as String,
      );
}

class FavoritesService {
  static const _key = 'favorite_pdfs';

  /// In-memory cache so the UI can update instantly without waiting on IO.
  static final List<FavoritePdf> _cache = [];
  static bool _loaded = false;

  static Future<void> _ensureLoaded() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key) ?? [];
    _cache
      ..clear()
      ..addAll(raw.map((s) => FavoritePdf.fromJson(jsonDecode(s))));
    _loaded = true;
  }

  static Future<List<FavoritePdf>> getAll() async {
    await _ensureLoaded();
    return List.unmodifiable(_cache);
  }

  static Future<bool> isFavorite(String pdfId) async {
    await _ensureLoaded();
    return _cache.any((f) => f.id == pdfId);
  }

  static Future<void> toggle(FavoritePdf pdf) async {
    await _ensureLoaded();
    final exists = _cache.any((f) => f.id == pdf.id);
    if (exists) {
      _cache.removeWhere((f) => f.id == pdf.id);
    } else {
      _cache.add(pdf);
    }
    await _persist();
  }

  static Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = _cache.map((f) => jsonEncode(f.toJson())).toList();
    await prefs.setStringList(_key, raw);
  }
}
