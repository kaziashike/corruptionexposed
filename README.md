# This App Fights Corruption

A comprehensive Flutter mobile application designed to help citizens of Bangladesh expose and track corruption by providing verified officer profiles, AI-monitored news reports, and public complaint submissions.

## 🎯 Mission

To create a transparent and accountable government system by empowering citizens to report corruption, track officer integrity, and access verified information about government officials.

## ✨ Features

### Core Features
- **User Authentication**: Registration, login with anonymous reporting option
- **Officer Profiles**: Comprehensive database of government and non-government employees
- **Complaint Submission**: Text, image, video, and document upload support
- **AI News Monitoring**: Automated news scraping and classification
- **Real-time Feed**: Live complaint feed with upvote/downvote system
- **Corruption Heatmap**: District-wise visualization of corruption reports
- **Evidence Vault**: Encrypted storage for sensitive reports
- **Whistleblower Protection**: Tips and guidelines for safe reporting

### Additional Features
- **Citizen Rights Guide**: Information about legal rights and anti-corruption laws
- **Emergency Helplines**: Quick access to relevant authorities
- **Honest Officer Recognition**: Highlighting officers with high integrity scores
- **Public Opinion Polls**: Community engagement through polls
- **Push Notifications**: Real-time updates on nearby complaints and case updates
- **Multilingual Support**: Bengali and English language support

## 🏗️ Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   └── app_constants.dart
│   ├── models/
│   │   ├── user_model.dart
│   │   ├── officer_model.dart
│   │   └── complaint_model.dart
│   ├── services/
│   │   └── auth_service.dart
│   └── utils/
├── features/
│   ├── authentication/
│   │   └── screens/
│   │       ├── login_screen.dart
│   │       └── signup_screen.dart
│   ├── dashboard/
│   │   └── screens/
│   │       └── dashboard_screen.dart
│   ├── officer_profiles/
│   │   └── screens/
│   │       └── officer_list_screen.dart
│   ├── reports/
│   │   └── screens/
│   │       └── submit_complaint_screen.dart
│   ├── evidence_vault/
│   ├── leaderboard/
│   ├── news_feed/
│   ├── polls/
│   └── widgets/
├── assets/
│   ├── images/
│   ├── icons/
│   └── lang/
└── main.dart
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.x or higher)
- Dart SDK (3.x or higher)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/corruptionexposed.git
   cd corruptionexposed
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Firebase Setup (Optional for now)

1. Create a Firebase project
2. Add Android and iOS apps to your Firebase project
3. Download and add the configuration files:
   - `google-services.json` for Android
   - `GoogleService-Info.plist` for iOS
4. Enable Authentication and Firestore in Firebase Console

## 📱 Screenshots

### Login Screen
- Clean Material3 design
- Anonymous login option
- Bengali language support

### Dashboard
- Corruption statistics
- Quick action buttons
- Recent complaints feed

### Officer Profiles
- Officer integrity scores
- Complaint history
- District-wise filtering

### Complaint Submission
- Multiple evidence upload
- Anonymous reporting
- District selection

## 🛠️ Technical Stack

- **Framework**: Flutter 3.x
- **UI**: Material3 Design
- **State Management**: Provider
- **Backend**: Firebase (Firestore, Authentication, Storage)
- **Maps**: Google Maps Flutter
- **Encryption**: Encrypt package
- **HTTP**: Dio for API calls
- **Localization**: Flutter Localizations

## 🔒 Security Features

- End-to-end encryption for sensitive reports
- Anonymous reporting capability
- Secure evidence vault
- Whistleblower protection guidelines
- Data privacy compliance

## 📊 Database Schema

### Users Collection
```json
{
  "uid": "string",
  "name": "string",
  "email": "string",
  "isAnonymous": "boolean",
  "district": "string",
  "phoneNumber": "string",
  "createdAt": "timestamp",
  "lastLoginAt": "timestamp",
  "reportsSubmitted": "number",
  "reportsApproved": "number",
  "reputationScore": "number"
}
```

### Officers Collection
```json
{
  "officerId": "string",
  "name": "string",
  "designation": "string",
  "department": "string",
  "district": "string",
  "office": "string",
  "integrityScore": "number",
  "complaintsCount": "number",
  "approvedComplaintsCount": "number",
  "createdAt": "timestamp",
  "lastUpdated": "timestamp",
  "photoUrl": "string",
  "contactInfo": "string",
  "isActive": "boolean",
  "category": "string"
}
```

### Complaints Collection
```json
{
  "complaintId": "string",
  "officerId": "string",
  "reporterUid": "string",
  "title": "string",
  "description": "string",
  "type": "string",
  "status": "string",
  "evidenceUrls": ["string"],
  "timestamp": "timestamp",
  "reviewedAt": "timestamp",
  "reviewedBy": "string",
  "rejectionReason": "string",
  "district": "string",
  "location": "string",
  "latitude": "number",
  "longitude": "number",
  "isAnonymous": "boolean",
  "upvotes": "number",
  "downvotes": "number",
  "upvotedBy": ["string"],
  "downvotedBy": ["string"],
  "adminNotes": "string"
}
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Anti-Corruption Commission of Bangladesh
- Transparency International Bangladesh
- Citizens for Good Governance
- All contributors and supporters

## 📞 Support

For support, email support@corruptionexposed.bd or join our Slack channel.

## 🔮 Roadmap

- [ ] AI-powered news monitoring
- [ ] Advanced analytics dashboard
- [ ] Mobile app for iOS
- [ ] Web dashboard for administrators
- [ ] Integration with government APIs
- [ ] Blockchain-based evidence verification
- [ ] Machine learning for pattern detection
- [ ] International expansion

---

**Note**: This app is designed to promote transparency and accountability. All reports are verified and handled according to legal procedures.
