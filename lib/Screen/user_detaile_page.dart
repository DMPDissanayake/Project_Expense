import 'package:flutter/material.dart';
import 'package:project_expense/Constants/colors.dart';
import 'package:project_expense/Widgets/main_button.dart';

class UserDetailePage extends StatefulWidget {
  const UserDetailePage({super.key});

  @override
  State<UserDetailePage> createState() => _UserDetailePageState();
}

class _UserDetailePageState extends State<UserDetailePage> {
  //check box value
  bool _checkBox = false;

  //form validetion
  final _formKey = GlobalKey<FormState>();
  //form controller
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Enter your \nPersonal Details',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //name
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //email
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //password
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Confirm password
                  TextFormField(
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Remember
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Remember Me for the next time",
                        style: TextStyle(
                          fontSize: 15,
                          color: kMainColor,
                        ),
                      ),
                      Checkbox(
                        value: _checkBox,
                        onChanged: (value) {
                          setState(() {
                            _checkBox = value!;
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //Button
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        //save data
                        final name = _nameController.text;
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        final confirmPassword = _confirmPasswordController.text;
                      }
                    },
                    child: MainButton(
                      bColor: kMainColor,
                      text: "Next",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
