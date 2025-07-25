import 'package:flutter/material.dart';

enum ComplaintType {
  bribery,
  nepotism,
  embezzlement,
  abuseOfPower,
  fraud,
  other,
}

enum ComplaintStatus { pending, underReview, approved, rejected, closed }

class ComplaintModel {
  final String complaintId;
  final String? officerId;
  final String? reporterUid;
  final String title;
  final String description;
  final ComplaintType type;
  final ComplaintStatus status;
  final List<String> evidenceUrls;
  final DateTime timestamp;
  final DateTime? reviewedAt;
  final String? reviewedBy;
  final String? rejectionReason;
  final String district;
  final String? location;
  final double? latitude;
  final double? longitude;
  final bool isAnonymous;
  final int upvotes;
  final int downvotes;
  final List<String> upvotedBy;
  final List<String> downvotedBy;
  final String? adminNotes;

  ComplaintModel({
    required this.complaintId,
    this.officerId,
    this.reporterUid,
    required this.title,
    required this.description,
    required this.type,
    this.status = ComplaintStatus.pending,
    this.evidenceUrls = const [],
    required this.timestamp,
    this.reviewedAt,
    this.reviewedBy,
    this.rejectionReason,
    required this.district,
    this.location,
    this.latitude,
    this.longitude,
    this.isAnonymous = false,
    this.upvotes = 0,
    this.downvotes = 0,
    this.upvotedBy = const [],
    this.downvotedBy = const [],
    this.adminNotes,
  });

  factory ComplaintModel.fromMap(Map<String, dynamic> map) {
    return ComplaintModel(
      complaintId: map['complaintId'] ?? '',
      officerId: map['officerId'],
      reporterUid: map['reporterUid'],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      type: ComplaintType.values.firstWhere(
        (e) => e.toString() == 'ComplaintType.${map['type']}',
        orElse: () => ComplaintType.other,
      ),
      status: ComplaintStatus.values.firstWhere(
        (e) => e.toString() == 'ComplaintStatus.${map['status']}',
        orElse: () => ComplaintStatus.pending,
      ),
      evidenceUrls: List<String>.from(map['evidenceUrls'] ?? []),
      timestamp: DateTime.parse(map['timestamp']),
      reviewedAt: map['reviewedAt'] != null
          ? DateTime.parse(map['reviewedAt'])
          : null,
      reviewedBy: map['reviewedBy'],
      rejectionReason: map['rejectionReason'],
      district: map['district'] ?? '',
      location: map['location'],
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
      isAnonymous: map['isAnonymous'] ?? false,
      upvotes: map['upvotes'] ?? 0,
      downvotes: map['downvotes'] ?? 0,
      upvotedBy: List<String>.from(map['upvotedBy'] ?? []),
      downvotedBy: List<String>.from(map['downvotedBy'] ?? []),
      adminNotes: map['adminNotes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'complaintId': complaintId,
      'officerId': officerId,
      'reporterUid': reporterUid,
      'title': title,
      'description': description,
      'type': type.toString().split('.').last,
      'status': status.toString().split('.').last,
      'evidenceUrls': evidenceUrls,
      'timestamp': timestamp.toIso8601String(),
      'reviewedAt': reviewedAt?.toIso8601String(),
      'reviewedBy': reviewedBy,
      'rejectionReason': rejectionReason,
      'district': district,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'isAnonymous': isAnonymous,
      'upvotes': upvotes,
      'downvotes': downvotes,
      'upvotedBy': upvotedBy,
      'downvotedBy': downvotedBy,
      'adminNotes': adminNotes,
    };
  }

  ComplaintModel copyWith({
    String? complaintId,
    String? officerId,
    String? reporterUid,
    String? title,
    String? description,
    ComplaintType? type,
    ComplaintStatus? status,
    List<String>? evidenceUrls,
    DateTime? timestamp,
    DateTime? reviewedAt,
    String? reviewedBy,
    String? rejectionReason,
    String? district,
    String? location,
    double? latitude,
    double? longitude,
    bool? isAnonymous,
    int? upvotes,
    int? downvotes,
    List<String>? upvotedBy,
    List<String>? downvotedBy,
    String? adminNotes,
  }) {
    return ComplaintModel(
      complaintId: complaintId ?? this.complaintId,
      officerId: officerId ?? this.officerId,
      reporterUid: reporterUid ?? this.reporterUid,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      status: status ?? this.status,
      evidenceUrls: evidenceUrls ?? this.evidenceUrls,
      timestamp: timestamp ?? this.timestamp,
      reviewedAt: reviewedAt ?? this.reviewedAt,
      reviewedBy: reviewedBy ?? this.reviewedBy,
      rejectionReason: rejectionReason ?? this.rejectionReason,
      district: district ?? this.district,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      upvotes: upvotes ?? this.upvotes,
      downvotes: downvotes ?? this.downvotes,
      upvotedBy: upvotedBy ?? this.upvotedBy,
      downvotedBy: downvotedBy ?? this.downvotedBy,
      adminNotes: adminNotes ?? this.adminNotes,
    );
  }

  String get typeDisplayName {
    switch (type) {
      case ComplaintType.bribery:
        return 'Bribery';
      case ComplaintType.nepotism:
        return 'Nepotism';
      case ComplaintType.embezzlement:
        return 'Embezzlement';
      case ComplaintType.abuseOfPower:
        return 'Abuse of Power';
      case ComplaintType.fraud:
        return 'Fraud';
      case ComplaintType.other:
        return 'Other';
    }
  }

  Color get statusColor {
    switch (status) {
      case ComplaintStatus.pending:
        return Colors.orange;
      case ComplaintStatus.underReview:
        return Colors.blue;
      case ComplaintStatus.approved:
        return Colors.green;
      case ComplaintStatus.rejected:
        return Colors.red;
      case ComplaintStatus.closed:
        return Colors.grey;
    }
  }

  String get statusDisplayName {
    switch (status) {
      case ComplaintStatus.pending:
        return 'Pending';
      case ComplaintStatus.underReview:
        return 'Under Review';
      case ComplaintStatus.approved:
        return 'Approved';
      case ComplaintStatus.rejected:
        return 'Rejected';
      case ComplaintStatus.closed:
        return 'Closed';
    }
  }

  int get netVotes => upvotes - downvotes;
}

// Extension to provide display names for ComplaintType enum values
extension ComplaintTypeExtension on ComplaintType {
  String get typeDisplayName {
    switch (this) {
      case ComplaintType.bribery:
        return 'Bribery';
      case ComplaintType.nepotism:
        return 'Nepotism';
      case ComplaintType.embezzlement:
        return 'Embezzlement';
      case ComplaintType.abuseOfPower:
        return 'Abuse of Power';
      case ComplaintType.fraud:
        return 'Fraud';
      case ComplaintType.other:
        return 'Other';
    }
  }
}
