import 'package:flutter/material.dart';

class AppColors {
  // Carbon Design System inspired primary colors
  static const Color primary = Color(0xFF0f62fe);        // IBM Blue
  static const Color primaryLight = Color(0xFF4589ff);
  static const Color primaryDark = Color(0xFF0043ce);

  // Secondary Colors - Carbon style
  static const Color secondary = Color(0xFF161616);      // Carbon Gray 100
  static const Color secondaryLight = Color(0xFF393939);
  static const Color secondaryDark = Color(0xFF000000);

  // MBTI Type Colors
  static const Color analysts = Color(0xFF8B5CF6);      // Purple - NT
  static const Color diplomats = Color(0xFF10B981);     // Green - NF
  static const Color sentinels = Color(0xFF3B82F6);     // Blue - SJ
  static const Color explorers = Color(0xFFF59E0B);     // Orange - SP

  // Semantic Colors - Carbon style
  static const Color success = Color(0xFF24a148);       // Carbon Green
  static const Color warning = Color(0xFFf1c21b);       // Carbon Yellow
  static const Color error = Color(0xFFda1e28);         // Carbon Red
  static const Color info = Color(0xFF0f62fe);          // Carbon Blue

  // Carbon Design System Neutral Colors
  static const Color white = Color(0xFFffffff);         // Carbon White
  static const Color black = Color(0xFF000000);         // Carbon Black
  static const Color grey10 = Color(0xFFf4f4f4);        // Carbon Gray 10
  static const Color grey20 = Color(0xFFe0e0e0);        // Carbon Gray 20
  static const Color grey30 = Color(0xFFc6c6c6);        // Carbon Gray 30
  static const Color grey40 = Color(0xFFa8a8a8);        // Carbon Gray 40
  static const Color grey50 = Color(0xFF8d8d8d);        // Carbon Gray 50
  static const Color grey60 = Color(0xFF6f6f6f);        // Carbon Gray 60
  static const Color grey70 = Color(0xFF525252);        // Carbon Gray 70
  static const Color grey80 = Color(0xFF393939);        // Carbon Gray 80
  static const Color grey90 = Color(0xFF262626);        // Carbon Gray 90
  static const Color grey100 = Color(0xFF161616);       // Carbon Gray 100

  // Legacy support - mapping to Carbon colors
  static const Color grey100old = grey10;
  static const Color grey200 = grey20;
  static const Color grey300 = grey30;
  static const Color grey400 = grey40;
  static const Color grey500 = grey50;
  static const Color grey600 = grey60;
  static const Color grey700 = grey70;
  static const Color grey800 = grey80;
  static const Color grey900 = grey90;

  // Carbon inspired gradient colors
  static const List<Color> primaryGradient = [
    Color(0xFF0f62fe),
    Color(0xFF4589ff),
  ];

  static const List<Color> heroGradient = [
    Color(0xFF161616),
    Color(0xFF393939),
  ];

  static const List<Color> cardGradient = [
    Color(0xFFffffff),
    Color(0xFFf4f4f4),
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