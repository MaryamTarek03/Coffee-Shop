import 'package:flutter/material.dart';

GlobalKey<FormState> formkey = GlobalKey();

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 196, 114, 84),
          title: const Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                      width: 450,
                      child: custom(
                          textt: "full name",
                          iconn: Icon(Icons.person),
                          inputtype: TextInputType.name)),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                      width: 450,
                      child: custom(
                          textt: "phone number",
                          iconn: Icon(Icons.phone),
                          inputtype: TextInputType.number)),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                      width: 450,
                      child: custom(
                          textt: "email",
                          iconn: Icon(Icons.email),
                          inputtype: TextInputType.emailAddress)),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                      width: 450,
                      child: custom(
                          textt: "password",
                          iconn: Icon(Icons.password),
                          inputtype: TextInputType.visiblePassword)),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {}
                },
                child: Text(
                  "Sign up",
                ),
                color: const Color.fromARGB(255, 196, 114, 84),
              ),
            ],
          ),
        ));
  }
}

class custom extends StatelessWidget {
  @override
  custom({
    required this.textt,
    required this.iconn,
    required this.inputtype,
  });

  String textt;
  Icon iconn;
  TextInputType inputtype;

  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: textt,
        labelText: textt,
        prefixIcon: iconn,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "must not be empyt";
        }
      },
      keyboardType: inputtype,
    );
  }
}
