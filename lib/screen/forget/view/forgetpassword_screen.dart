import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../services/api_call.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  final Apicall api = Apicall();
  int currentStep = 1; // 1 for email, 2 for OTP, 3 for password
  String sotp = '';
  String otp = '';
  String semail = '';
  bool isOtpValid = false;
  String _errorText = '';

  Future<void> sendOtp(BuildContext context) async {
    final email = emailController.text.trim();
    if (email.isEmpty) {
      setState(() {
        _errorText = '*Email Address are not valid';
      });
      return;
    }
    try {
      final response = await api.sendOtp(email);
      if (response.sotp != "0") {
        // Handle OTP received
        if (kDebugMode) {
          print('OTP: ${response.sotp}');
        }
        sotp = response.sotp!;
        semail = response.email!;
        setState(() {
          currentStep = 2;
        });
      } else {
        setState(() {
          _errorText = '*Email Address are not valid';
        });
        if (kDebugMode) {
          print('No OTP received');
        }
      }
    } catch (e) {
      // Handle API call failure
      if (kDebugMode) {
        print('Failed to send OTP: $e');
      }
    }
  }

  @override
  void dispose() {
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (currentStep == 1) ...[
                    const Text(
                      "Enter Your Email",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00B79B)),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email",
                      ),
                    ),
                    if (_errorText.isNotEmpty)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _errorText,
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          sendOtp(context);
                        },
                        child: const Text("Send OTP",
                            style: TextStyle(color: Color(0xFF00B79B))),
                      ),
                    ),
                  ],
                  if (currentStep == 2) ...[
                    const Text(
                      "Enter the OTP",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00B79B)),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        6,
                            (index) => SizedBox(
                          width: 50,
                          child: TextField(
                            focusNode: focusNodes[index],
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                // Append the entered value to the OTP
                                otp += value;
                                if (otp.length == 6) {
                                  // Check if OTP is complete
                                  if (otp == sotp) {
                                    // Correct OTP, set validation flag
                                    setState(() {
                                      isOtpValid = true;
                                    });
                                  } else {
                                    // Incorrect OTP, reset OTP and show error dialog
                                    otp = '';
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Error'),
                                          content: const Text(
                                              'Invalid OTP. Please try again.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                } else {
                                  // Move focus to the next box
                                  focusNodes[index + 1].requestFocus();
                                }
                              } else {
                                // If value is empty (user erases a digit), decrement OTP length
                                if (otp.isNotEmpty) {
                                  otp = otp.substring(0, otp.length - 1);
                                }
                                // Move focus to the previous box
                                if (index > 0) {
                                  focusNodes[index - 1].requestFocus();
                                }
                              }
                            },
                            maxLength: 1,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isOtpValid
                            ? () {
                                // Navigate to the next screen when OTP is valid
                                setState(() {
                                  currentStep = 3;
                                });
                              }
                            : null,
                        child: const Text("Verify",
                            style: TextStyle(color: Color(0xFF00B79B))),
                      ),
                    ),
                  ],
                  if (currentStep == 3) ...[
                    const Text(
                      "Set New Password",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00B79B)),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: passwordController,
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock),
                        labelText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: obscureConfirmPassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock),
                        labelText: "Confirm Password",
                        suffixIcon: IconButton(
                          icon: Icon(obscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              obscureConfirmPassword = !obscureConfirmPassword;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (passwordController.text ==
                              confirmPasswordController.text) {
                            var response = await api.changePassword(
                                semail, passwordController.text);
                            if (response.success == 1) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Success"),
                                    content: const Text(
                                        "Your Password Successfully Changed."),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text("Close"),
                                        onPressed: () {
                                          Navigator.pushNamed(context, 'login');
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content: const Text(
                                        "Failed to change password. Please try again."),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text("Close"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Error"),
                                  content: const Text(
                                      "Passwords do not match. Please re-enter."),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text("Close"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Text("Continue",
                            style: TextStyle(color: Color(0xFF00B79B))),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
