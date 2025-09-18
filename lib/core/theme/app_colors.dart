import 'package:flutter/material.dart';

class AppColors {
  // Carbon Design System inspired primary colors
  static const Color primary = Color(0xFF0f62fe); // IBM Blue
  static const Color primaryLight = Color(0xFF4589ff);
  static const Color primaryDark = Color(0xFF0043ce);

  // Secondary Colors - Carbon style
  static const Color secondary = Color(0xFF161616); // Carbon Gray 100
  static const Color secondaryLight = Color(0xFF393939);
  static const Color secondaryDark = Color(0xFF000000);

  // MBTI Type Colors
  static const Color analysts = Color(0xFF8B5CF6); // Purple - NT
  static const Color diplomats = Color(0xFF10B981); // Green - NF
  static const Color sentinels = Color(0xFF3B82F6); // Blue - SJ
  static const Color explorers = Color(0xFFF59E0B); // Orange - SP

  // Semantic Colors - Carbon style
  static const Color success = Color(0xFF24a148); // Carbon Green
  static const Color warning = Color(0xFFf1c21b); // Carbon Yellow
  static const Color error = Color(0xFFda1e28); // Carbon Red
  static const Color info = Color(0xFF0f62fe); // Carbon Blue

  // Carbon Design System Neutral Colors
  static const Color white = Color(0xFFffffff); // Carbon White
  static const Color black = Color(0xFF000000); // Carbon Black
  static const Color grey10 = Color(0xFFf4f4f4); // Carbon Gray 10
  static const Color grey20 = Color(0xFFe0e0e0); // Carbon Gray 20
  static const Color grey30 = Color(0xFFc6c6c6); // Carbon Gray 30
  static const Color grey40 = Color(0xFFa8a8a8); // Carbon Gray 40
  static const Color grey50 = Color(0xFF8d8d8d); // Carbon Gray 50
  static const Color grey60 = Color(0xFF6f6f6f); // Carbon Gray 60
  static const Color grey70 = Color(0xFF525252); // Carbon Gray 70
  static const Color grey80 = Color(0xFF393939); // Carbon Gray 80
  static const Color grey90 = Color(0xFF262626); // Carbon Gray 90
  static const Color grey100 = Color(0xFF161616); // Carbon Gray 100

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

  // Additional colors for widgets
  static const Color green50 = Color(0xFF22C55E); // Green for strengths
  static const Color orange50 = Color(0xFFF97316); // Orange for weaknesses
  static const Color blue50 = Color(0xFF3B82F6); // Blue for compatibility
  static const Color pink50 = Color(0xFFEC4899); // Pink for best matches

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
    if (type.length < 2) return primary;

    switch (type.substring(0, 2)) {
      case 'NT':
        return analysts;
      case 'NF':
        return diplomats;
      case 'SJ':
        return sentinels;
      case 'SP':
        return explorers;
      default:
        return primary;
    }
  }

  static Color getMBTITypeColor(String type) {
    const typeColors = {
      // Analysts (NT) - 지적이고 차가운 톤
      'INTJ': Color(0xFF4C1D95), // 딥 퍼플 (전략가의 신비로움)
      'INTP': Color(0xFF0F766E), // 틸 (탐구가의 분석력)
      'ENTJ': Color(0xFF1E40AF), // 로얄 블루 (지휘관의 권위)
      'ENTP': Color(0xFFEAB308), // 골드 (혁신가의 창의성)
      // Diplomats (NF) - 자연스럽고 따뜻한 톤
      'INFJ': Color(0xFF065F46), // 딥 에메랄드 (옹호자의 깊이)
      'INFP': Color(0xFF7C3AED), // 바이올렛 (몽상가의 감성)
      'ENFJ': Color(0xFF0891B2), // 스카이 블루 (멘토의 포용력)
      'ENFP': Color(0xFFFF6B35), // 코랄 오렌지 (활동가의 따뜻한 에너지)
      // Sentinels (SJ) - 안정적이고 신뢰감 있는 톤
      'ISTJ': Color(0xFF374151), // 슬레이트 그레이 (현실주의자의 견고함)
      'ISFJ': Color(0xFF92400E), // 어스 브라운 (수호자의 온화함)
      'ESTJ': Color(0xFF1F2937), // 차콜 (경영자의 안정감)
      'ESFJ': Color(0xFF8B5A83), // 라벤더 퍼플 (협력자의 조화로움)
      // Explorers (SP) - 활기차고 자유로운 톤
      'ISTP': Color(0xFF059669), // 민트 그린 (해결사의 쿨함)
      'ISFP': Color(0xFF7C2D12), // 테라코타 (모험가의 자연스러움)
      'ESTP': Color(0xFFB45309), // 앰버 (도전가의 에너지)
      'ESFP': Color(0xFFF59E0B), // 선샤인 옐로우 (연예인의 밝음)
    };
    return typeColors[type] ?? primary;
  }
}
