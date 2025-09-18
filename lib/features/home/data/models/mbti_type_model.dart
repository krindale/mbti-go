/// MBTI 타입 데이터 모델
/// Single Responsibility: MBTI 타입 정보 구조 정의
class MBTITypeModel {
  final String type;
  final String name;
  final String image;
  final String category;
  final String description;
  final String detailedDescription;

  const MBTITypeModel({
    required this.type,
    required this.name,
    required this.image,
    required this.category,
    required this.description,
    required this.detailedDescription,
  });

  /// Map에서 MBTITypeModel로 변환
  factory MBTITypeModel.fromMap(Map<String, String> map) {
    return MBTITypeModel(
      type: map['type']!,
      name: map['name']!,
      image: map['image']!,
      category: map['category']!,
      description: map['description']!,
      detailedDescription: map['detailedDescription']!,
    );
  }

  /// MBTITypeModel을 Map으로 변환
  Map<String, String> toMap() {
    return {
      'type': type,
      'name': name,
      'image': image,
      'category': category,
      'description': description,
      'detailedDescription': detailedDescription,
    };
  }
}
