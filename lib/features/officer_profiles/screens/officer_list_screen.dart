import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/models/officer_model.dart';

class OfficerListScreen extends StatefulWidget {
  @override
  _OfficerListScreenState createState() => _OfficerListScreenState();
}

class _OfficerListScreenState extends State<OfficerListScreen> {
  String _selectedDistrict = 'All Districts';
  String _selectedCategory = 'All Categories';
  String _searchQuery = '';

  // Dummy data for testing
  final List<OfficerModel> _dummyOfficers = [
    OfficerModel(
      officerId: '1',
      name: 'Dr. Mohammad Shahidul Islam',
      designation: 'Deputy Commissioner',
      department: 'Administration',
      district: 'Dhaka',
      office: 'Dhaka District Office',
      integrityScore: 85.5,
      complaintsCount: 3,
      approvedComplaintsCount: 1,
      createdAt: DateTime.now().subtract(Duration(days: 365)),
      category: 'government',
    ),
    OfficerModel(
      officerId: '2',
      name: 'Eng. Fatima Begum',
      designation: 'Executive Engineer',
      department: 'Public Works',
      district: 'Chittagong',
      office: 'Chittagong Development Authority',
      integrityScore: 92.0,
      complaintsCount: 0,
      approvedComplaintsCount: 0,
      createdAt: DateTime.now().subtract(Duration(days: 180)),
      category: 'government',
    ),
    OfficerModel(
      officerId: '3',
      name: 'Adv. Rahman Khan',
      designation: 'District Judge',
      department: 'Judiciary',
      district: 'Rajshahi',
      office: 'Rajshahi District Court',
      integrityScore: 45.0,
      complaintsCount: 12,
      approvedComplaintsCount: 8,
      createdAt: DateTime.now().subtract(Duration(days: 730)),
      category: 'government',
    ),
    OfficerModel(
      officerId: '4',
      name: 'Dr. Ayesha Rahman',
      designation: 'Medical Superintendent',
      department: 'Health',
      district: 'Khulna',
      office: 'Khulna Medical College Hospital',
      integrityScore: 78.5,
      complaintsCount: 2,
      approvedComplaintsCount: 0,
      createdAt: DateTime.now().subtract(Duration(days: 90)),
      category: 'government',
    ),
    OfficerModel(
      officerId: '5',
      name: 'Prof. Kamal Hossain',
      designation: 'Vice Chancellor',
      department: 'Education',
      district: 'Sylhet',
      office: 'Shahjalal University of Science & Technology',
      integrityScore: 95.0,
      complaintsCount: 0,
      approvedComplaintsCount: 0,
      createdAt: DateTime.now().subtract(Duration(days: 120)),
      category: 'government',
    ),
  ];

  List<OfficerModel> get _filteredOfficers {
    return _dummyOfficers.where((officer) {
      bool matchesDistrict =
          _selectedDistrict == 'All Districts' ||
          officer.district == _selectedDistrict;
      bool matchesCategory =
          _selectedCategory == 'All Categories' ||
          officer.category == _selectedCategory;
      bool matchesSearch =
          officer.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          officer.designation.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          officer.department.toLowerCase().contains(_searchQuery.toLowerCase());

      return matchesDistrict && matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Officer Profiles',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _showSearchDialog();
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.green.shade50,
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        if (_selectedDistrict != 'All Districts')
                          Chip(
                            label: Text(_selectedDistrict),
                            backgroundColor: Colors.green.shade100,
                            deleteIcon: Icon(Icons.close, size: 18),
                            onDeleted: () {
                              setState(() {
                                _selectedDistrict = 'All Districts';
                              });
                            },
                          ),
                        if (_selectedCategory != 'All Categories')
                          Chip(
                            label: Text(
                              _selectedCategory == 'government'
                                  ? 'Government'
                                  : 'Non-Government',
                            ),
                            backgroundColor: Colors.green.shade100,
                            deleteIcon: Icon(Icons.close, size: 18),
                            onDeleted: () {
                              setState(() {
                                _selectedCategory = 'All Categories';
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Officer List
          Expanded(
            child: _filteredOfficers.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No officers found',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your filters',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _filteredOfficers.length,
                    itemBuilder: (context, index) {
                      final officer = _filteredOfficers[index];
                      return _buildOfficerCard(officer);
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/submit-complaint');
        },
        backgroundColor: Colors.green.shade600,
        foregroundColor: Colors.white,
        icon: Icon(Icons.report),
        label: Text(
          'Report Corruption',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildOfficerCard(OfficerModel officer) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/officer-details', arguments: officer);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.green.shade100,
                    child: Text(
                      officer.name.split(' ').map((e) => e[0]).join(''),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          officer.name,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          officer.designation,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          officer.department,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: officer.integrityColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: officer.integrityColor),
                    ),
                    child: Text(
                      '${officer.integrityScore.toStringAsFixed(1)}',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: officer.integrityColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${officer.district} District',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.category, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: 4),
                  Text(
                    officer.category == 'government'
                        ? 'Government'
                        : 'Non-Government',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.warning, size: 16, color: Colors.orange.shade600),
                  const SizedBox(width: 4),
                  Text(
                    '${officer.complaintsCount} complaints',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.orange.shade600,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.check_circle,
                    size: 16,
                    color: Colors.green.shade600,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${officer.approvedComplaintsCount} approved',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.green.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Search Officers', style: GoogleFonts.poppins()),
        content: TextField(
          decoration: InputDecoration(
            hintText: 'Search by name, designation, or department',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Filter Officers', style: GoogleFonts.poppins()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedDistrict,
              decoration: InputDecoration(labelText: 'District'),
              items:
                  [
                        'All Districts',
                        ..._dummyOfficers.map((o) => o.district).toSet(),
                      ]
                      .map(
                        (district) => DropdownMenuItem(
                          value: district,
                          child: Text(district),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDistrict = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(labelText: 'Category'),
              items: [
                DropdownMenuItem(
                  value: 'All Categories',
                  child: Text('All Categories'),
                ),
                DropdownMenuItem(
                  value: 'government',
                  child: Text('Government'),
                ),
                DropdownMenuItem(
                  value: 'non_government',
                  child: Text('Non-Government'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Apply'),
          ),
        ],
      ),
    );
  }
}
