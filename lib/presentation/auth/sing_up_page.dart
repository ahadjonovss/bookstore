import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopee/components/constants/image.dart';
import 'package:shopee/components/routes/app_routes.dart';
import 'package:shopee/components/widgets/text_widget.dart';
import 'package:shopee/presentation/auth/widgets/button.dart';
import 'package:shopee/presentation/auth/widgets/input_widget.dart';
import 'package:shopee/presentation/auth/widgets/rich_text.dart';
import 'package:shopee/view_models/auth_view_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.authBackground),
                    fit: BoxFit.cover)),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "My Shop,\nWelcome to you!",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.04),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWidget("Sign Up"
                            , fontsize: 24),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        InputWidget(
                            controller: email,
                            hintText: "example123@gmail.com",
                            validator: (value) {
                              if (value?.contains("@gmail.com") == false ||
                                  value!.length < 13) {
                                return "Incorrect email!";
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        InputWidget(
                            controller: password,
                            hintText: "qwerty1234",
                            validator: (value) {
                              if (value.length < 6) {
                                return "Password must include characters more than 6";
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        InkWell(
                            onTap: (){
                              if(_formKey.currentState!.validate()){
                                context.read<AuthViewModel>().signUp(email: email.text, password: password.text );
                                Navigator.pushNamedAndRemoveUntil(context,RouteName.mainPage , (route) => false);
                              }
                            },
                            child: AuthButton(isLogin: false)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Center(child: AuthRichText(firsttxt: "Do you have an account?",secondtxt: "Sign In",RouteName: RouteName.signIn,))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
