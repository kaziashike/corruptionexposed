import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String? name;
  final String? email;
  final bool isAnonymous;
  final String? district;
  final String? phoneNumber;
  final DateTime createdAt;
  final DateTime? lastLoginAt;
  final int reportsSubmitted;
  final int reportsApproved;
  final double reputationScore;

  UserModel({
    required this.uid,
    this.name,
    this.email,
    required this.isAnonymous,
    this.district,
    this.phoneNumber,
    required this.createdAt,
    this.lastLoginAt,
    this.reportsSubmitted = 0,
    this.reportsApproved = 0,
    this.reputationScore = 0.0,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'],
      email: map['email'],
      isAnonymous: map['isAnonymous'] ?? false,
      district: map['district'],
      phoneNumber: map['phoneNumber'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      lastLoginAt: map['lastLoginAt'] != null
          ? (map['lastLoginAt'] as Timestamp).toDate()
          : null,
      reportsSubmitted: map['reportsSubmitted'] ?? 0,
      reportsApproved: map['reportsApproved'] ?? 0,
      reputationScore: (map['reputationScore'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'isAnonymous': isAnonymous,
      'district': district,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt,
      'lastLoginAt': lastLoginAt,
      'reportsSubmitted': reportsSubmitted,
      'reportsApproved': reportsApproved,
      'reputationScore': reputationScore,
    };
  }

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    bool? isAnonymous,
    String? district,
    String? phoneNumber,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    int? reportsSubmitted,
    int? reportsApproved,
    double? reputationScore,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      district: district ?? this.district,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      reportsSubmitted: reportsSubmitted ?? this.reportsSubmitted,
      reportsApproved: reportsApproved ?? this.reportsApproved,
      reputationScore: reputationScore ?? this.reputationScore,
    );
  }
}
