import 'package:Opt120/utils/service/users.dart';
import 'package:flutter/material.dart';

import '../../utils/validations.dart';

export 'user_creation_page.dart';

class UserCreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Center(
      child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserForm()
          ],
        ),
    );
  }
}

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';

  void createUser() {
    UserRequests().createUser(_name, _email, _password)
      .then(() => {
        print('usuario cadastrado')
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:
        Container(
          width: 620,
          child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 300,
                      child:
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter user name',
                          ),
                          validator: emptyFieldValidation,
                          onSaved: (value) {
                            _name = value!;
                          }
                        ),
                    ),
                    Container(
                      width: 300,
                      child:
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter user email',
                          ),
                          validator: emptyFieldValidation,
                          onSaved: (value) {
                            _email = value!;
                          }
                        ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 300,
                      child:
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Enter user password',
                          ),
                          validator: emptyFieldValidation,
                          onSaved: (value) {
                            _password = value!;
                          }
                        ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        createUser();
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            )
        )
    );
  }
}
