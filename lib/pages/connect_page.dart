import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:videocall/configuration/constants.dart';
import 'package:videocall/widgets/videocall_widget.dart';
import 'package:videocall/pages/prejoin_page.dart';
import 'package:http/http.dart' as http;

class ConnectPage extends StatefulWidget {
  const ConnectPage({Key? key}) : super(key: key);

  static const routeName = '/connect';

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  String? _selectedRoom;

  // List of available rooms
  final List<String> _availableRooms = [
    'Room 1',
    'Room 2',
    'Room 3',
    'Meeting Room',
    'Conference Hall',
  ];

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  void _handleJoin() async {
    if (_formKey.currentState!.validate()) {
      final roomName = _selectedRoom;
      final userName = _userNameController.text;

      try {
        final resp = await http.get(Uri.parse('${Constants.TOKEN_ENDPOINT}?room=$roomName&username=$userName'));
        if (resp.statusCode != 200) {
          throw Exception('Failed to fetch token: ${resp.statusCode} ${resp.reasonPhrase}');
        }
        final data = jsonDecode(resp.body);
        print('Server response: $data');
        print('Received token: ${data['token']}');

        // Form is valid, proceed to PreJoinPage
        if (!mounted) return;
        await Navigator.pushNamed(context, PreJoinPage.routeName,
          arguments: JoinArgs(
            url: Constants.SERVER_URL,
            token: data['token'],
            e2ee: Constants.E2EE,
            e2eeKey: Constants.E2EEKEY,
            simulcast: Constants.SIMULCAST,
            adaptiveStream: Constants.ADAPTATIVE_STREAM,
            dynacast: Constants.DYNACAST,
            preferredCodec: Constants.PREFERRED_CODEC,
            enableBackupVideoCodec: ['VP9', 'AV1'].contains(Constants.PREFERRED_CODEC),
          )
        );
      } catch (e) {
        print('Failed to fetch token. See console for more details. $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Videocall App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: VideocallWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Join a Room',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Room Name',
                        hintText: 'Select a room',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.meeting_room),
                      ),
                      hint: Text('Select a room'),
                      items: _availableRooms.map((String room) {
                        return DropdownMenuItem<String>(
                          value: room,
                          child: Text(room),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRoom = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a room';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _userNameController,
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _handleJoin,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Join Room',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
