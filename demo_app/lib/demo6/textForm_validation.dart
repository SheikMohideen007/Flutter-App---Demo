import 'package:demo_app/demo5/button_widget.dart';
import 'package:demo_app/demo6/data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextformValidation extends StatefulWidget {
  const TextformValidation({super.key});

  @override
  State<TextformValidation> createState() => _TextformValidationState();
}

class _TextformValidationState extends State<TextformValidation> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  String genderValue = "Male";
  final formKey = GlobalKey<FormState>();
  List<String> professions = [
    "Software Developer",
    "Software Tester",
    "UI/UX Designer",
    "Cloud Engineer"
  ];
  String profession = "Software Tester";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Form Validation'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 20),
              TextFormField(
                controller: name,
                style: TextStyle(fontSize: 18),
                // keyboardType: TextInputType.,
                decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    labelText: 'Enter your Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name should not be empty';
                  } else if (value.length <= 3) {
                    return 'Minimum 4 characters needed';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: age,
                style: TextStyle(fontSize: 18),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 2,
                decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    labelText: 'Enter your Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Age should not be empty';
                  } else if (int.parse(value) <= 17) {
                    return 'Childrens not allowed';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Text('Select your gender'),
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: ListTile(
                            title: Text('Male'),
                            leading: Radio(
                                value: 'Male',
                                groupValue: genderValue,
                                onChanged: (value) {
                                  setState(() {
                                    genderValue = value!;
                                  });
                                })),
                      ),
                      SizedBox(
                        width: 150,
                        child: ListTile(
                            title: Text('Female'),
                            leading: Radio(
                                value: 'Female',
                                groupValue: genderValue,
                                onChanged: (value) {
                                  setState(() {
                                    genderValue = value!;
                                  });
                                })),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Text('Select your profession'),
                  SizedBox(height: 20),
                  DropdownButton(
                    icon: Icon(Icons.arrow_drop_down_circle_outlined),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    isExpanded: true,
                    isDense: true,
                    value: profession,
                    items: professions.map((String value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        profession = newValue!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print(name.text);
                      print(age.text);
                      print(genderValue);
                      print(profession);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Form Submited Successfully'),
                          duration: Duration(seconds: 10),
                          action:
                              SnackBarAction(label: 'OK', onPressed: () {})));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DataScreen(
                                    name: name.text,
                                    age: age.text,
                                    gender: genderValue,
                                    profession: profession,
                                  )));
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
