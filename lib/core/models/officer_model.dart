import 'package:flutter/material.dart';

class OfficerModel {
  final String officerId;
  final String name;
  final String designation;
  final String department;
  final String district;
  final String office;
  final double integrityScore;
  final int complaintsCount;
  final int approvedComplaintsCount;
  final DateTime createdAt;
  final DateTime? lastUpdated;
  final String? photoUrl;
  final String? contactInfo;
  final bool isActive;
  final String category; // 'government' or 'non_government'

  OfficerModel({
    required this.officerId,
    required this.name,
    required this.designation,
    required this.department,
    required this.district,
    required this.office,
    this.integrityScore = 100.0,
    this.complaintsCount = 0,
    this.approvedComplaintsCount = 0,
    required this.createdAt,
    this.lastUpdated,
    this.photoUrl,
    this.contactInfo,
    this.isActive = true,
    required this.category,
  });

  factory OfficerModel.fromMap(Map<String, dynamic> map) {
    return OfficerModel(
      officerId: map['officerId'] ?? '',
      name: map['name'] ?? '',
      designation: map['designation'] ?? '',
      department: map['department'] ?? '',
      district: map['district'] ?? '',
      office: map['office'] ?? '',
      integrityScore: (map['integrityScore'] ?? 100.0).toDouble(),
      complaintsCount: map['complaintsCount'] ?? 0,
      approvedComplaintsCount: map['approvedComplaintsCount'] ?? 0,
      createdAt: DateTime.parse(map['createdAt']),
      lastUpdated: map['lastUpdated'] != null
          ? DateTime.parse(map['lastUpdated'])
          : null,
      photoUrl: map['photoUrl'],
      contactInfo: map['contactInfo'],
      isActive: map['isActive'] ?? true,
      category: map['category'] ?? 'government',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'officerId': officerId,
      'name': name,
      'designation': designation,
      'department': department,
      'district': district,
      'office': office,
      'integrityScore': integrityScore,
      'complaintsCount': complaintsCount,
      'approvedComplaintsCount': approvedComplaintsCount,
      'createdAt': createdAt.toIso8601String(),
      'lastUpdated': lastUpdated?.toIso8601String(),
      'photoUrl': photoUrl,
      'contactInfo': contactInfo,
      'isActive': isActive,
      'category': category,
    };
  }

  OfficerModel copyWith({
    String? officerId,
    String? name,
    String? designation,
    String? department,
    String? district,
    String? office,
    double? integrityScore,
    int? complaintsCount,
    int? approvedComplaintsCount,
    DateTime? createdAt,
    DateTime? lastUpdated,
    String? photoUrl,
    String? contactInfo,
    bool? isActive,
    String? category,
  }) {
    return OfficerModel(
      officerId: officerId ?? this.officerId,
      name: name ?? this.name,
      designation: designation ?? this.designation,
      department: department ?? this.department,
      district: district ?? this.district,
      office: office ?? this.office,
      integrityScore: integrityScore ?? this.integrityScore,
      complaintsCount: complaintsCount ?? this.complaintsCount,
      approvedComplaintsCount:
          approvedComplaintsCount ?? this.approvedComplaintsCount,
      createdAt: createdAt ?? this.createdAt,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      photoUrl: photoUrl ?? this.photoUrl,
      contactInfo: contactInfo ?? this.contactInfo,
      isActive: isActive ?? this.isActive,
      category: category ?? this.category,
    );
  }

  String get integrityStatus {
    if (integrityScore >= 80) return 'Excellent';
    if (integrityScore >= 60) return 'Good';
    if (integrityScore >= 40) return 'Fair';
    if (integrityScore >= 20) return 'Poor';
    return 'Very Poor';
  }

  Color get integrityColor {
    if (integrityScore >= 80) return Colors.green;
    if (integrityScore >= 60) return Colors.lightGreen;
    if (integrityScore >= 40) return Colors.orange;
    if (integrityScore >= 20) return Colors.red;
    return Colors.red.shade900;
  }
}
