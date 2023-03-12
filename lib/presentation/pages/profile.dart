import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:asbeza/presentation/pages/Home.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'ertyui';
  String _phoneNumber = '345678';

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  Future<void> _getProfile() async {
    // final Iterable< contacts  = await ContactsService.getContacts();
    // final Contact contact = Contacts;
    // setState(() {
    //   _name = contact.displayName ?? '';
    //   _phoneNumber = contact.phones?.first?.value ?? '';
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        title: Text('Profile'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.person,
              size: 150,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Name: ' + _name,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 34.0),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Phone Number: ' + _phoneNumber,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
