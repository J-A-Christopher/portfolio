import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/contacts/data/models/contact_body.dart';
import 'package:portfolio/features/contacts/presentation/bloc/contact_info_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Contact extends StatefulWidget {
  //const Contact({super.key, required this.description});
  //final String description;

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _formKey = GlobalKey<FormState>();
  final List<String> services = [
    'Android',
    'Web',
    'IOT',
    'API Intergration',
    'Payment Integration',
    'Backend and Deployment',
    'Flutter'
  ];
  var selectedValue = '';
  var name = '';
  var email = '';
  var message = '';

  void _contactSubmission() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final contactData = ContactBody(
              email: email,
              message: message,
              name: name,
              service: selectedValue)
          .toJson();
      context
          .read<ContactInfoBloc>()
          .add(PostContactInfo(contactInfo: contactData));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contact Me'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  onSaved: (value) {
                    name = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty ||
                        value.length < 3 ||
                        RegExp(r'\d').hasMatch(value)) {
                      return 'Invalid input';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your name(Names cannot be numeric values)',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty ||
                        !value.contains('@') ||
                        value.length < 10) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value!;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  hint: const Text(
                    'Select a service',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: services
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a service to proceed.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //Do something when selected item is changed.
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onSaved: (value) {
                    message = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Input cannot be empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: 'Write a message',
                  ),
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 200,
                    child: FilledButton(
                        onPressed: _contactSubmission,
                        child: const Text('Submit'))),
                BlocListener<ContactInfoBloc, ContactInfoState>(
                  listener: (context, state) {
                    if (state is ContactInfoLoaded) {
                      _formKey.currentState!.reset();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Successfully posted data!'),
                      ));

                      Navigator.of(context).pop();
                    }
                    if (state is ContactInfoError) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.errorMessage),
                        backgroundColor: Theme.of(context).colorScheme.error,
                      ));
                    }
                  },
                  child: BlocBuilder<ContactInfoBloc, ContactInfoState>(
                      builder: (context, state) {
                    if (state is ContactInfoLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const SizedBox.shrink();
                  }),
                )
              ],
            ),
          ),
        ));
  }
}
