import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:we_workers/Technician_Screens/login.dart';
// import '../User_Screens/Login.dart';

void main() {
  runApp(RegisterApp());
}

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        // backgroundColor: Colors.deepPurple[100],
        title: Text('Technician Registration Form',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey.shade400,

        // centerTitle: true,
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
  TextEditingController _NameController = TextEditingController();
  TextEditingController _EmailNameController = TextEditingController();

  // TextEditingController _EmailNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _locationsController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String? _errorText;

  Future<void> _registerUser() async {
    final url = 'https://awesomeworld1301.pythonanywhere.com/technicianApiGet/';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "Technician_name": _NameController.text.trim(),
          "Technician_email": _EmailNameController.text.trim(),
          "Technician_phone": _phoneController.text.trim(),
          "Technician_location": _locationsController.text.trim(),
          "Technician_pincode": _pincodeController.text.trim(),
          "Technician_Password": _passwordController.text.trim(),
          // "Technician_ID_Proof": Null,
          "Technician_Service_Accept": true
          // Change this if you allow users to select their role
        }),
      );

      if (response.statusCode == 201) {
        // User successfully registered
        // print('Registration Successful');
        _NameController.clear();
        _EmailNameController.clear();
        // _EmailNameController.clear();
        _phoneController.clear();
        _locationsController.clear();
        _pincodeController.clear();
        _passwordController.clear();
        _confirmPasswordController.clear();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TechnicianLogin()));
      } else {
        // Error occurred during registration
        print('Error: ${response.body}');
        setState(() {
          _errorText = 'Registration failed. Please try again.';
          _NameController.clear();
          _EmailNameController.clear();
          // _EmailNameController.clear();
          _phoneController.clear();
          _locationsController.clear();
          _pincodeController.clear();
          _passwordController.clear();
          _confirmPasswordController.clear();
        });
      }
    } catch (error) {
      // Error occurred during HTTP request
      print('Error: $error');
      setState(() {
        _errorText = 'An unexpected error occurred. Please try again later.';
        _NameController.clear();
        _EmailNameController.clear();
        _phoneController.clear();
        _locationsController.clear();
        _pincodeController.clear();
        _passwordController.clear();
        _confirmPasswordController.clear();
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Validate fields
      // Check passwords match
      if (_passwordController.text.trim() !=
          _confirmPasswordController.text.trim()) {
        setState(() {
          _errorText = 'Passwords do not match';
        });
        return;
      }

      // Perform registration
      _registerUser();
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
              Container(
                child: Image(
                  image: AssetImage("assets/images/Registration.jpg"),
                  height: 200,
                ),
              ),
              TextFormField(
                controller: _NameController,
                decoration: InputDecoration(
                  labelText: 'Technician_name',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.deepPurple,
                  ),
                  hintText: 'Enter your Name:',
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
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _EmailNameController,
                decoration: InputDecoration(
                  labelText: 'Technician_email',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.deepPurple,
                  ),
                  hintText: 'Enter your email:',
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
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
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
              ElevatedButton(
                onPressed: () {
                  _submitForm();
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (_) => Location(),
                  //   ),
                  // );
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decorationColor: Colors.blueAccent.shade200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
