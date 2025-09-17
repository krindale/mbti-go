import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF6366F1);
  static const Color primaryLight = Color(0xFF818CF8);
  static const Color primaryDark = Color(0xFF4F46E5);

  // Secondary Colors
  static const Color secondary = Color(0xFF8B5CF6);
  static const Color secondaryLight = Color(0xFFA78BFA);
  static const Color secondaryDark = Color(0xFF7C3AED);

  // MBTI Type Colors
  static const Color analysts = Color(0xFF8B5CF6);      // Purple - NT
  static const Color diplomats = Color(0xFF10B981);     // Green - NF
  static const Color sentinels = Color(0xFF3B82F6);     // Blue - SJ
  static const Color explorers = Color(0xFFF59E0B);     // Orange - SP

  // Semantic Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);

  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF6366F1),
    Color(0xFF8B5CF6),
  ];

  static const List<Color> heroGradient = [
    Color(0xFF667EEA),
    Color(0xFF764BA2),
  ];

  static const List<Color> cardGradient = [
    Color(0xFFFFFFFF),
    Color(0xFFF8FAFC),
  ];

  // MBTI Type Color Map
  static Color getMBTIColor(String type) {
    switch (type.substring(0, 2)) {
      case 'NT': return analysts;
      case 'NF': return diplomats;
      case 'SJ': return sentinels;
      case 'SP': return explorers;
      default: return primary;
    }
  }

  static Color getMBTITypeColor(String type) {
    const typeColors = {
      'INTJ': Color(0xFF6366F1),
      'INTP': Color(0xFF8B5CF6),
      'ENTJ': Color(0xFF7C3AED),
      'ENTP': Color(0xFFA78BFA),
      'INFJ': Color(0xFF10B981),
      'INFP': Color(0xFF34D399),
      'ENFJ': Color(0xFF059669),
      'ENFP': Color(0xFF6EE7B7),
      'ISTJ': Color(0xFF3B82F6),
      'ISFJ': Color(0xFF60A5FA),
      'ESTJ': Color(0xFF1D4ED8),
      'ESFJ': Color(0xFF93C5FD),
      'ISTP': Color(0xFFF59E0B),
      'ISFP': Color(0xFFFBBF24),
      'ESTP': Color(0xFFD97706),
      'ESFP': Color(0xFFFCD34D),
    };
    return typeColors[type] ?? primary;
  }
}