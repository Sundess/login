import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prestige/network/userNetworking.dart';
import 'package:prestige/validators/validator.dart';
import 'package:prestige/controller/login_controller.dart';
import 'package:prestige/components/custom_text_feild.dart';

class LoginScreen extends StatelessWidget {
  final _obscureText = true.obs;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final userStorage = GetStorage();
    var token = userStorage.read('token');

    if (token != null) {
      verifyUser(token);
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 46.0),
                      child: Center(
                        child: Text(
                          'Prestige',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    CustomTextFeild(
                      hintText: 'Email adress',
                      // suffixIcon: Icon(Icons.email_outlined),
                      validator: emailValidator,
                      controller: _emailController,
                    ),
                    Obx(
                      () => CustomTextFeild(
                        hintText: 'Password',
                        controller: _passwordController,
                        obscureText: _obscureText.value,
                        validator: passwordValidator,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _obscureText.toggle();
                          },
                          icon: _obscureText.value
                              ? const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.visibility_outlined),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Forgot password?',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff2DC6EB),
                              )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: SizedBox(
                        height: 50,
                        width: double.maxFinite,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xff24BE67),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            controller.login(
                              _emailController.text,
                              _passwordController.text,
                            );
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            )),
                        Expanded(child: Divider()),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: const Color(0xffF2F2F7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/G.png',
                                height: 20,
                                width: 20,
                                // fit: BoxFit.fitWidth,
                              ),
                              const SizedBox(width: 16),
                              const Text(
                                'Continue with Google',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 250),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Create account'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
