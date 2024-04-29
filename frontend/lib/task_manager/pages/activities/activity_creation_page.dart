
import 'package:flutter/material.dart';

import '../../utils/validations.dart';
import 'package:Opt120/utils/service/activities.dart';

export 'activity_creation_page.dart';

class ActivityCreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Center(
      child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ActivityForm()
          ],
        ),
    );
  }
}

class ActivityForm extends StatefulWidget {
  const ActivityForm({super.key});

  @override
  State<ActivityForm> createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _title = '';
  String _description = '';
  String _grade = '';

  void createActivity() {
    ActivityRequests().createActivity(_title, _description, _grade)
      .then(() => {
        print('atividade cadastrada')
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: 
                    Text(
                      'Create activity',
                      style:
                        TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        )
                    ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 300,
                      child:
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter activity title',
                          ),
                          validator: emptyFieldValidation,
                          onSaved: (value) {
                            _title = value!;
                          }
                        ),
                    ),
                    Container(
                      width: 300,
                      child:
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter activity description',
                          ),
                          validator: emptyFieldValidation,
                          onSaved: (value) {
                            _description = value!;
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
                            hintText: 'Enter activity grade',
                          ),
                          validator: emptyFieldValidation,
                          onSaved: (value) {
                            _grade = value!;
                          }
                        ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        createActivity();
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
