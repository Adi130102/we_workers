import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'login.dart';

void main() {
  runApp(RegisterApp());
}

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Page',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: RegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _technicianNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _locationsController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String? _errorText;
  File? _idProofFile;

  Future<void> _registerUser() async {
    final url = 'https://awesomeworld1301.pythonanywhere.com/technicianApiGet/';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "Technician_name": _technicianNameController.text.trim(),
          "Technician_email": _emailController.text.trim(),
          "Technician_phone": _phoneController.text.trim(),
          "Technician_location": _locationsController.text.trim(),
          "Technician_pincode": _pincodeController.text.trim(),
          "Technician_Password": _passwordController.text.trim(),
          // Send only file path if file is selected
          "Technician_ID_Proof": _idProofFile != null ? _idProofFile!.path : '',
        }),
      );

      if (response.statusCode == 201) {
        _clearFields();
        Navigator.push(context, MaterialPageRoute(builder: (context) => TechnicianLogin()));
      } else {
        setState(() {
          _errorText = 'Registration failed. Please try again.';
          _clearFields();
        });
      }
    } catch (error) {
      setState(() {
        _errorText = 'An unexpected error occurred. Please try again later.';
        _clearFields();
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_passwordController.text.trim() != _confirmPasswordController.text.trim()) {
        setState(() {
          _errorText = 'Passwords do not match';
        });
        return;
      }
      _registerUser();
    }
  }

  void _clearFields() {
    _technicianNameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _locationsController.clear();
    _pincodeController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    _idProofFile = null;
  }

  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _idProofFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _technicianNameController,
                decoration: InputDecoration(
                  labelText: 'Technician Name',
                  prefixIcon: Icon(Icons.person, color: Colors.deepPurple),
                  hintText: 'Enter your Name:',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email, color: Colors.deepPurple),
                  hintText: 'Enter your Email:',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              // Add other text form fields
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.deepPurple,
                  ),
                  hintText: 'Enter your Contact number:',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _locationsController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  prefixIcon: Icon(
                    Icons.location_city,
                    color: Colors.deepPurple,
                  ),
                  hintText: 'Enter your Address:',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your location';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _pincodeController,
                decoration: InputDecoration(
                  labelText: 'Pincode',
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: Colors.deepPurple,
                  ),
                  hintText: 'Enter your Pincode:',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your pincode';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.deepPurple,
                  ),
                  hintText: 'Enter your Password:',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.deepPurple,
                  ),
                  hintText: 'Enter your Password Again:',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text.trim()) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              if (_errorText != null)
                Text(
                  _errorText!,
                  style: TextStyle(color: Colors.red),
                ),

              TextFormField(
                enabled: false,
                controller: TextEditingController(
                  text: _idProofFile != null ? _idProofFile!.path.split('/').last : 'No file selected',
                ),
                decoration: InputDecoration(
                  labelText: 'ID Proof',
                  prefixIcon: Icon(Icons.upload_file),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.file_upload),
                    onPressed: _selectFile,
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                validator: (value) {
                  if (_idProofFile == null) {
                    return 'Please upload ID proof';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              if (_errorText != null)
                Text(
                  _errorText!,
                  style: TextStyle(color: Colors.red),
                ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Register', style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
