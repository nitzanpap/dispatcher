import 'package:dispatcher/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

const GAP_SEPARATOR_HEIGHT = 40.0;
const GAP = Gap(GAP_SEPARATOR_HEIGHT);

class SignUpLoginForm extends StatefulWidget {
  final bool isSignUp;

  const SignUpLoginForm({super.key, this.isSignUp = true});

  @override
  State<SignUpLoginForm> createState() => _SignUpLoginFormState();
}

class _SignUpLoginFormState extends State<SignUpLoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final title = 'Signup';
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: FigmaColors.MEDIUM_BLUE,
                ),
              ),
              GAP,
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'johncena@gmail.com',
                  labelText: 'Your email',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.person),
                  prefixIconColor: MaterialStateColor.resolveWith(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.focused)) {
                      return Colors.green;
                    }
                    if (states.contains(MaterialState.error)) {
                      return Colors.red;
                    }
                    return Colors.grey;
                  }),
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  RegExp validEmailRegEx = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                  ;
                  return (value != null && validEmailRegEx.hasMatch(value))
                      ? null
                      : 'Please enter a valid email address.';
                },
              ),
              GAP,
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.validate();
                },
                child: Text('Signup'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
