import 'package:flutter/material.dart';
import '../../../core/models/complaint_model.dart';
import '../../../core/models/officer_model.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Dummy data for testing
  final List<ComplaintModel> _recentComplaints = [
    ComplaintModel(
      complaintId: '1',
      title: 'Bribery in Land Office',
      description: 'Officer demanding bribe for land registration',
      type: ComplaintType.bribery,
      status: ComplaintStatus.approved,
      district: 'Dhaka',
      timestamp: DateTime.now().subtract(Duration(hours: 2)),
      upvotes: 15,
      downvotes: 2,
    ),
    ComplaintModel(
      complaintId: '2',
      title: 'Nepotism in Job Recruitment',
      description: 'Family members getting preferential treatment',
      type: ComplaintType.nepotism,
      status: ComplaintStatus.underReview,
      district: 'Chittagong',
      timestamp: DateTime.now().subtract(Duration(hours: 5)),
      upvotes: 8,
      downvotes: 1,
    ),
    ComplaintModel(
      complaintId: '3',
      title: 'Embezzlement in Development Project',
      description: 'Funds misused in road construction project',
      type: ComplaintType.embezzlement,
      status: ComplaintStatus.pending,
      district: 'Rajshahi',
      timestamp: DateTime.now().subtract(Duration(hours: 8)),
      upvotes: 12,
      downvotes: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // TODO: Navigate to notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // TODO: Navigate to profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade600, Colors.green.shade800],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to the Fight Against Corruption',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'সরকারি দুর্নীতি প্রতিরোধে আপনার সহায়তা প্রয়োজন',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Statistics Cards
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Total Reports',
                    '1,247',
                    Icons.report,
                    Colors.blue.shade600,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatCard(
                    'Approved Cases',
                    '892',
                    Icons.check_circle,
                    Colors.green.shade600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Active Officers',
                    '156',
                    Icons.people,
                    Colors.orange.shade600,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatCard(
                    'Districts Covered',
                    '64',
                    Icons.location_on,
                    Colors.purple.shade600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Quick Actions
            Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 16),

            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
              children: [
                _buildQuickActionCard(
                  'Report Corruption',
                  Icons.report,
                  Colors.red.shade600,
                  () => Navigator.pushNamed(context, '/submit-complaint'),
                ),
                _buildQuickActionCard(
                  'Officer Profiles',
                  Icons.people,
                  Colors.blue.shade600,
                  () => Navigator.pushNamed(context, '/officers'),
                ),
                _buildQuickActionCard(
                  'Evidence Vault',
                  Icons.security,
                  Colors.green.shade600,
                  () => Navigator.pushNamed(context, '/evidence-vault'),
                ),
                _buildQuickActionCard(
                  'Corruption Map',
                  Icons.map,
                  Colors.orange.shade600,
                  () => Navigator.pushNamed(context, '/corruption-map'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Recent Complaints
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Complaints',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/complaints');
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Complaints List
            ..._recentComplaints.map(
              (complaint) => _buildComplaintCard(complaint),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          // TODO: Navigate to different screens
        },
        selectedItemColor: Colors.green.shade700,
        unselectedItemColor: Colors.grey.shade600,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Officers'),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionCard(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComplaintCard(ComplaintModel complaint) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: complaint.statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    complaint.statusDisplayName,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: complaint.statusColor,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  _formatTimeAgo(complaint.timestamp),
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              complaint.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              complaint.description,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(
                  complaint.district,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      size: 16,
                      color: Colors.green.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${complaint.upvotes}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green.shade600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.thumb_down,
                      size: 16,
                      color: Colors.red.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${complaint.downvotes}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
