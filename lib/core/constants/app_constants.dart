class AppConstants {
  // App Information
  static const String appName = 'This App Fights Corruption';
  static const String appDescription =
      'সরকারি দুর্নীতি প্রতিরোধে নাগরিকদের সহায়তা';
  static const String appVersion = '1.0.0';

  // Districts of Bangladesh
  static const List<String> districts = [
    'Dhaka',
    'Chittagong',
    'Rajshahi',
    'Khulna',
    'Barisal',
    'Sylhet',
    'Rangpur',
    'Mymensingh',
    'Comilla',
    'Noakhali',
    'Feni',
    'Chandpur',
    'Lakshmipur',
    'Cox\'s Bazar',
    'Bandarban',
    'Rangamati',
    'Khagrachari',
    'Brahmanbaria',
    'Narayanganj',
    'Tangail',
    'Kishoreganj',
    'Netrokona',
    'Jamalpur',
    'Sherpur',
    'Moulvibazar',
    'Habiganj',
    'Sunamganj',
    'Bogra',
    'Naogaon',
    'Natore',
    'Pabna',
    'Sirajganj',
    'Joypurhat',
    'Jashore',
    'Satkhira',
    'Bagerhat',
    'Chuadanga',
    'Meherpur',
    'Jhenaidah',
    'Magura',
    'Narail',
    'Pirojpur',
    'Jhalokati',
    'Bhola',
    'Patuakhali',
    'Barguna',
    'Panchagarh',
    'Dinajpur',
    'Lalmonirhat',
    'Nilphamari',
    'Kurigram',
    'Gaibandha',
    'Thakurgaon',
  ];

  // Government Departments
  static const List<String> departments = [
    'Administration',
    'Police',
    'Judiciary',
    'Education',
    'Health',
    'Public Works',
    'Transport',
    'Agriculture',
    'Fisheries',
    'Forest',
    'Environment',
    'Commerce',
    'Industry',
    'Finance',
    'Revenue',
    'Customs',
    'Immigration',
    'Passport',
    'Land',
    'Housing',
    'Urban Development',
    'Rural Development',
    'Local Government',
    'Water Resources',
    'Power',
    'Gas',
    'Telecommunications',
    'Postal',
    'Railway',
    'Civil Aviation',
    'Shipping',
    'Port',
    'Defense',
    'Foreign Affairs',
    'Home Affairs',
    'Law',
    'Justice',
    'Parliamentary Affairs',
    'Information',
    'Cultural Affairs',
    'Religious Affairs',
    'Social Welfare',
    'Women Affairs',
    'Youth and Sports',
    'Science and Technology',
    'Planning',
    'Statistics',
    'Implementation',
    'Monitoring',
    'Evaluation',
  ];

  // Emergency Helplines
  static const Map<String, String> emergencyHelplines = {
    'Anti-Corruption Commission': '106',
    'Police Emergency': '999',
    'Fire Service': '16163',
    'Ambulance': '16263',
    'Women Helpline': '109',
    'Child Helpline': '1098',
    'Legal Aid': '16430',
  };

  // Whistleblower Protection Tips
  static const List<String> whistleblowerTips = [
    'Document everything with dates and times',
    'Take photos or videos when safe to do so',
    'Keep copies of all documents',
    'Use secure communication channels',
    'Consider anonymous reporting',
    'Know your legal rights',
    'Seek legal advice if needed',
    'Report to multiple authorities',
    'Maintain confidentiality',
    'Stay safe and protect your identity',
  ];

  // Citizen Rights
  static const List<String> citizenRights = [
    'Right to Information',
    'Right to Public Services',
    'Right to Grievance Redressal',
    'Right to Transparent Governance',
    'Right to Participate in Decision Making',
    'Right to Access Public Records',
    'Right to File Complaints',
    'Right to Legal Remedies',
    'Right to Protection from Harassment',
    'Right to Whistleblower Protection',
  ];

  // Anti-Corruption Laws
  static const List<String> antiCorruptionLaws = [
    'Anti-Corruption Commission Act, 2004',
    'Prevention of Corruption Act, 1947',
    'Money Laundering Prevention Act, 2012',
    'Right to Information Act, 2009',
    'Whistleblower Protection Act, 2011',
    'Public Procurement Act, 2006',
    'Government Servants (Conduct) Rules, 1979',
    'Code of Criminal Procedure, 1898',
    'Penal Code, 1860',
    'Evidence Act, 1872',
  ];

  // Colors
  static const int primaryColor = 0xFF4CAF50;
  static const int secondaryColor = 0xFF2196F3;
  static const int accentColor = 0xFFFF9800;
  static const int errorColor = 0xFFF44336;
  static const int successColor = 0xFF4CAF50;
  static const int warningColor = 0xFFFF9800;
  static const int infoColor = 0xFF2196F3;

  // API Endpoints (for future use)
  static const String baseUrl = 'https://api.corruptionexposed.bd';
  static const String complaintsEndpoint = '/api/complaints';
  static const String officersEndpoint = '/api/officers';
  static const String usersEndpoint = '/api/users';
  static const String newsEndpoint = '/api/news';
  static const String reportsEndpoint = '/api/reports';

  // File Upload Limits
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const int maxVideoSize = 50 * 1024 * 1024; // 50MB
  static const int maxDocumentSize = 10 * 1024 * 1024; // 10MB

  // Supported File Types
  static const List<String> supportedImageTypes = ['jpg', 'jpeg', 'png', 'gif'];
  static const List<String> supportedVideoTypes = ['mp4', 'avi', 'mov', 'wmv'];
  static const List<String> supportedDocumentTypes = [
    'pdf',
    'doc',
    'docx',
    'txt',
  ];

  // Validation Rules
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 50;
  static const int minComplaintTitleLength = 10;
  static const int maxComplaintTitleLength = 100;
  static const int minComplaintDescriptionLength = 20;
  static const int maxComplaintDescriptionLength = 2000;

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Cache Duration
  static const Duration cacheDuration = Duration(hours: 1);
  static const Duration userSessionDuration = Duration(days: 30);

  // Notification Settings
  static const String notificationChannelId = 'corruption_alerts';
  static const String notificationChannelName = 'Corruption Alerts';
  static const String notificationChannelDescription =
      'Notifications for corruption reports and updates';
}
