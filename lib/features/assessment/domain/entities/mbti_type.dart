import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MBTIType extends Equatable {
  final String code;
  final String name;
  final String category;
  final String description;
  final List<String> strengths;
  final List<String> weaknesses;
  final List<String> careers;
  final String imagePath;
  final Color primaryColor;
  final String detailedDescription;

  const MBTIType({
    required this.code,
    required this.name,
    required this.category,
    required this.description,
    required this.strengths,
    required this.weaknesses,
    required this.careers,
    required this.imagePath,
    required this.primaryColor,
    required this.detailedDescription,
  });

  @override
  List<Object?> get props => [
    code,
    name,
    category,
    description,
    strengths,
    weaknesses,
    careers,
    imagePath,
    primaryColor,
    detailedDescription,
  ];

  // Helper method to get category full name
  String get categoryName {
    switch (category) {
      case 'NT':
        return '합리주의자';
      case 'NF':
        return '이상주의자';
      case 'SJ':
        return '수호자';
      case 'SP':
        return '예술가';
      default:
        return category;
    }
  }

  // Helper method to check if introverted
  bool get isIntroverted => code.startsWith('I');

  // Helper method to check if extraverted
  bool get isExtraverted => code.startsWith('E');

  // Helper method to get cognitive functions
  List<String> get cognitiveFunctions {
    // Simplified cognitive functions based on MBTI type
    final functions = <String>[];

    switch (code) {
      case 'INTJ':
        functions.addAll(['Ni', 'Te', 'Fi', 'Se']);
        break;
      case 'INTP':
        functions.addAll(['Ti', 'Ne', 'Si', 'Fe']);
        break;
      case 'ENTJ':
        functions.addAll(['Te', 'Ni', 'Se', 'Fi']);
        break;
      case 'ENTP':
        functions.addAll(['Ne', 'Ti', 'Fe', 'Si']);
        break;
      case 'INFJ':
        functions.addAll(['Ni', 'Fe', 'Ti', 'Se']);
        break;
      case 'INFP':
        functions.addAll(['Fi', 'Ne', 'Si', 'Te']);
        break;
      case 'ENFJ':
        functions.addAll(['Fe', 'Ni', 'Se', 'Ti']);
        break;
      case 'ENFP':
        functions.addAll(['Ne', 'Fi', 'Te', 'Si']);
        break;
      case 'ISTJ':
        functions.addAll(['Si', 'Te', 'Fi', 'Ne']);
        break;
      case 'ISFJ':
        functions.addAll(['Si', 'Fe', 'Ti', 'Ne']);
        break;
      case 'ESTJ':
        functions.addAll(['Te', 'Si', 'Ne', 'Fi']);
        break;
      case 'ESFJ':
        functions.addAll(['Fe', 'Si', 'Ne', 'Ti']);
        break;
      case 'ISTP':
        functions.addAll(['Ti', 'Se', 'Ni', 'Fe']);
        break;
      case 'ISFP':
        functions.addAll(['Fi', 'Se', 'Ni', 'Te']);
        break;
      case 'ESTP':
        functions.addAll(['Se', 'Ti', 'Fe', 'Ni']);
        break;
      case 'ESFP':
        functions.addAll(['Se', 'Fi', 'Te', 'Ni']);
        break;
    }

    return functions;
  }
}
