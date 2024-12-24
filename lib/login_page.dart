import 'package:flutter/material.dart';
import 'package:logger/web.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'admin_screens/admin_home_nav.dart';
import 'constants/gradient_colors.dart';
import 'constants/loader.dart';
import 'constants/toast_messages.dart';
import 'dio/api_service.dart';
import 'dio/dio_client.dart';
import 'employee_screens/employee_home_nav.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;
  final ApiService _apiService = ApiService(DioClient());
  late Toasty _toasty;
  final logger = Logger();
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    loadCredentials();
    _toasty = Toasty(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        // Label text
                        labelStyle: const TextStyle(
                          color: Colors.orange, // Match the label text color
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 0.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.0,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            _emailController.clear();
                          },
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: _isObscured,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: Colors.orange,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 0.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.0,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                    ),
                    const Text('Remember Password'),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => const ForgetPassword(),
                        // ),
                        // );
                      },
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: AppGradients.secondaryGradient,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () async {
                        if (_isChecked) {
                          await saveCredentials(
                              _emailController.text, _passwordController.text);
                        } else {
                          await removeCredentials();
                        }
                        ShowLoader.show(context);
                        Map<String, dynamic>? responseData = await _handleLogin();
                        ShowLoader.hide(context);

                        if (responseData != null) {
                          _toasty.showSuccess('Login Successful');

                          final userRole = responseData['role'];
                          if (userRole == 'ROLE_EMP') {

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const EmployeeHomeNav(),
                              ),
                            );
                          } else {

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AdminHomeNav(),
                              ),
                            );
                          }
                        } else {
                          _toasty.showError('Failed to Login');
                        }
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                      ),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Map<String, dynamic>?> _handleLogin() async {
    try {
      if (!_validation(_emailController.text, _passwordController.text)) {
        return null;
      }

      final responseData = await _apiService.login(
        _emailController.text,
        _passwordController.text,
      );

      saveData(responseData);
      final maxEmp = responseData['maxEmployee'];
      logger.d('emp count after login : $maxEmp');

      SharedPreferences maxEmpPrefs = await SharedPreferences.getInstance();
      await maxEmpPrefs.setInt('maxEmployee', maxEmp);

      return responseData;
    } catch (e) {
      logger.e('Error while Login: ${e.toString()}');
      return null;
    }
  }

  Future<void> saveData(Map<String, dynamic> responseData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwtToken', responseData['jwtToken']);
    await prefs.setInt('id', responseData['id']);
    await prefs.setString('name', responseData['name']);
    await prefs.setString('email', responseData['email']);
    await prefs.setString('role', responseData['role']);
    await prefs.setBool('enabled', responseData['enabled']);
    await prefs.setInt('empID', responseData['empID']);
    await prefs.setInt('adminId', responseData['adminId']);
    await prefs.setString('companyName', responseData['companyName']);
    await prefs.setString('companyPhone', responseData['companyPhone']);
    await prefs.setString('work', responseData['work']);
    await prefs.setString('phone', responseData['phone']);
    await prefs.setString('companyAddress', responseData['companyAddress']);
    await prefs.setString('companyEmail', responseData['companyEmail']);
    await prefs.setString('logoImage', responseData['logoImage']);
    await prefs.setString('shiftTime', responseData['shiftTime']);
    await prefs.setString('gstin', responseData['gstin']);
  }

  bool _validation(String userName, String password) {
    if (userName.isEmpty) {
      _toasty.showError("Email should not be empty");
      return false;
    }
    if (password.isEmpty) {
      _toasty.showError("Password Should not be empty");
      return false;
    }
    return true;
  }

  Future<void> saveCredentials(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isChecked', true);
    await prefs.setString('user_email', email);
    await prefs.setString('user_password', password);
  }

  Future<void> removeCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isChecked');
    await prefs.remove('user_email');
    await prefs.remove('user_password');
  }

  Future<void> loadCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isChecked = prefs.getBool('isChecked');
    String? username = prefs.getString('user_email');
    String? password = prefs.getString('user_password');
    if (isChecked != null &&
        isChecked &&
        username != null &&
        password != null) {
      setState(() {
        _isChecked = true;
        _emailController.text = username;
        _passwordController.text = password;
      });
    } else {
      setState(() {
        _isChecked = false;
      });
    }
  }
}
