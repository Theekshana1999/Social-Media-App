import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/Screen/home_screen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobStatusController = TextEditingController();
  final TextEditingController _otherDetailsController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  String? _selectedGender;
  DateTime? _selectedDate;
  String? _selectedDistrict;
  String? _selectedStatus;
  String? _selectedEducation;
  String? _selectedIncome;
  String? _selectedCountry;

  // Example dropdown data
  final List<String> genders = ["Male", "Female", "Other"];
  final List<String> districts = [
    "Colombo",
    "Gampaha",
    "Kalutara",
    "Kandy",
    "Matale",
    "Nuwara Eliya",
    "Galle",
    "Matara",
    "Hambantota",
    "Jaffna",
    "Kilinochchi",
    "Mannar",
    "Vavuniya",
    "Mullaitivu",
    "Batticaloa",
    "Ampara",
    "Trincomalee",
    "Kurunegala",
    "Puttalam",
    "Anuradhapura",
    "Polonnaruwa",
    "Badulla",
    "Monaragala",
    "Ratnapura",
    "Kegalle",
  ];
  final List<String> statuses = ["Single", "Married", "Divorced"];
  final List<String> educations = ["O/L", "A/L", "Graduate", "Postgraduate"];
  final List<String> incomes = ["< 50,000", "50,000 - 100,000", "100,000+"];

  final List<String> countries = [
    "Sri Lanka",
    "India",
    "Pakistan",
    "Bangladesh",
    "Nepal",
  ];
  //
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Profile Image
                    GestureDetector(
                      onTap: () {
                        _pickImage(ImageSource.gallery);
                      },
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage:
                            _image != null ? FileImage(_image!) : null,
                        child:
                            _image == null
                                ? const Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                  color: Colors.white,
                                )
                                : null,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Your Details",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Name Field
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Gender Dropdown
                    DropdownButtonFormField<String>(
                      value: _selectedGender,
                      decoration: InputDecoration(
                        labelText: "Gender",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      items:
                          genders
                              .map(
                                (gender) => DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                ),
                              )
                              .toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedGender = val;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // Birthday
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: "Birthday",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon: const Icon(Icons.calendar_today),
                      ),
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          setState(() {
                            _selectedDate = picked;
                          });
                        }
                      },
                      controller: TextEditingController(
                        text:
                            _selectedDate == null
                                ? ""
                                : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                      ),
                    ),
                    const SizedBox(height: 16),

                    // District Dropdown
                    DropdownButtonFormField<String>(
                      value: _selectedDistrict,
                      decoration: InputDecoration(
                        labelText: "Home District",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      items:
                          districts
                              .map(
                                (d) =>
                                    DropdownMenuItem(value: d, child: Text(d)),
                              )
                              .toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedDistrict = val;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    //Living Country
                    DropdownButtonFormField<String>(
                      value: _selectedCountry,
                      decoration: InputDecoration(
                        labelText: "Living Country",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      items:
                          countries
                              .map(
                                (c) =>
                                    DropdownMenuItem(value: c, child: Text(c)),
                              )
                              .toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedCountry = val;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // Marriage Status Dropdown
                    DropdownButtonFormField<String>(
                      value: _selectedStatus,
                      decoration: InputDecoration(
                        labelText: "Marriage Status",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      items:
                          statuses
                              .map(
                                (s) =>
                                    DropdownMenuItem(value: s, child: Text(s)),
                              )
                              .toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedStatus = val;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // Education Dropdown
                    DropdownButtonFormField<String>(
                      value: _selectedEducation,
                      decoration: InputDecoration(
                        labelText: "Education",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      items:
                          educations
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedEducation = val;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    //Job Status
                    TextField(
                      controller: _jobStatusController,
                      
                      decoration: InputDecoration(
                        labelText: "Job Status",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Income Dropdown
                    DropdownButtonFormField<String>(
                      value: _selectedIncome,
                      decoration: InputDecoration(
                        labelText: "Monthly Income",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      items:
                          incomes
                              .map(
                                (i) =>
                                    DropdownMenuItem(value: i, child: Text(i)),
                              )
                              .toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedIncome = val;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    //Height
                    TextFormField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Height",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Height is required';
                        }
                        final num? height = num.tryParse(value);
                        if (height == null || height <= 0) {
                          return 'Enter a valid height';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    //weight
                    TextFormField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Weight",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Weight is required';
                        }
                        final num? weight = num.tryParse(value);
                        if (weight == null || weight <= 0) {
                          return 'Enter a valid weight';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      maxLines: 3,
                      controller: _otherDetailsController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: "Other Details",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8385FF),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Save the profile details
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                                const SnackBar(content: Text("Details Saved!")),
                              )
                              .closed
                              .then((_) {
                                //hide snackbar then show navigator
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              });
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
