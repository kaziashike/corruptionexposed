import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Stream of auth changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign up with email and password
  Future<UserModel?> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    String? district,
    String? phoneNumber,
  }) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user != null) {
        // Create user document in Firestore
        final UserModel user = UserModel(
          uid: result.user!.uid,
          name: name,
          email: email,
          isAnonymous: false,
          district: district,
          phoneNumber: phoneNumber,
          createdAt: DateTime.now(),
        );

        await _firestore
            .collection('users')
            .doc(result.user!.uid)
            .set(user.toMap());

        return user;
      }
    } catch (e) {
      print('Error signing up: $e');
      rethrow;
    }
    return null;
  }

  // Sign in with email and password
  Future<UserModel?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user != null) {
        // Update last login time
        await _firestore.collection('users').doc(result.user!.uid).update({
          'lastLoginAt': DateTime.now(),
        });

        // Get user data from Firestore
        final doc = await _firestore
            .collection('users')
            .doc(result.user!.uid)
            .get();

        if (doc.exists) {
          return UserModel.fromMap(doc.data()!);
        }
      }
    } catch (e) {
      print('Error signing in: $e');
      rethrow;
    }
    return null;
  }

  // Sign in anonymously
  Future<UserModel?> signInAnonymously({String? district}) async {
    try {
      final UserCredential result = await _auth.signInAnonymously();

      if (result.user != null) {
        // Create anonymous user document in Firestore
        final UserModel user = UserModel(
          uid: result.user!.uid,
          name: null,
          email: null,
          isAnonymous: true,
          district: district,
          createdAt: DateTime.now(),
        );

        await _firestore
            .collection('users')
            .doc(result.user!.uid)
            .set(user.toMap());

        return user;
      }
    } catch (e) {
      print('Error signing in anonymously: $e');
      rethrow;
    }
    return null;
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
      rethrow;
    }
  }

  // Get user data from Firestore
  Future<UserModel?> getUserData(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data()!);
      }
    } catch (e) {
      print('Error getting user data: $e');
    }
    return null;
  }

  // Update user profile
  Future<void> updateUserProfile({
    required String uid,
    String? name,
    String? district,
    String? phoneNumber,
  }) async {
    try {
      final Map<String, dynamic> updates = {};
      if (name != null) updates['name'] = name;
      if (district != null) updates['district'] = district;
      if (phoneNumber != null) updates['phoneNumber'] = phoneNumber;

      await _firestore.collection('users').doc(uid).update(updates);
    } catch (e) {
      print('Error updating user profile: $e');
      rethrow;
    }
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('Error resetting password: $e');
      rethrow;
    }
  }

  // Delete account
  Future<void> deleteAccount() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        // Delete user document from Firestore
        await _firestore.collection('users').doc(user.uid).delete();

        // Delete user account
        await user.delete();
      }
    } catch (e) {
      print('Error deleting account: $e');
      rethrow;
    }
  }
}
