import 'package:flutter/material.dart';
import '../models/profile.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _RetrieveTextState();
}

class _RetrieveTextState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 96, 101, 208),
      body: WelcomeScreenWithForm(),
    );
  }
}

class WelcomeScreenWithForm extends StatefulWidget {
  const WelcomeScreenWithForm({super.key});

  @override
  State<WelcomeScreenWithForm> createState() => _RetrieveTextformState();
}

class _RetrieveTextformState extends State<WelcomeScreenWithForm> {
  final _formKey = GlobalKey<FormState>();
  final controllerText = TextEditingController();

  void submit() {
    final inputText = controllerText.value.text;

    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/home',
          arguments: Profile(userName: inputText));
      //Navigator.pushNamed(context, '/quiz', arguments: Profile(userName: inputText));
    } else {
      print('Username Cannot be Empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // container for Quiz Logo
              Container(
                child: const Center(
                  child: Text("QUIZ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        fontSize: 30,
                        letterSpacing: 1,
                      )),
                ),
              ),
              const SizedBox(height: 20, width: 20),
              // Code for Image
              const Image(
                image: AssetImage('images/quiz.jpeg'),
              ),
              const SizedBox(height: 40, width: 40),

              // container for white screen properties
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                height: 150,
                width: 300,
                child: Column(
                  children: [
                    // container for name copy widget
                    Container(
                      child: const Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text("Please Enter your Name",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 13,
                            )),
                      ),
                    ),
                    // container for text field widget
                    const SizedBox(height: 20, width: 20),
                    Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 225, 225, 225),
                        ),
                        height: 40,
                        width: 230,
                        child: TextFormField(
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              //isCollapsed: true,
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 225, 225, 225),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Username";
                              } else {
                                return null;
                              }
                            },
                            controller: controllerText)
                        //),
                        ),
                    const SizedBox(height: 10, width: 10),
                    // container for submit button

                    Container(
                      height: 30,
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffb8e893),
                            padding: const EdgeInsets.fromLTRB(20, 10, 25, 5)),
                        onPressed: submit,
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Code  for setting the offset welcome button between two containers
              Transform.translate(
                offset: const Offset(0.0, -340 / 2.0),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      /* do stuff */
                    },
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 184, 232, 147),
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0.0, 6.0),
                            color: Color.fromARGB(255, 184, 232, 147),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.fromLTRB(20.0, 3.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 2.0),
                            child: Text(
                              'WELCOME',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
