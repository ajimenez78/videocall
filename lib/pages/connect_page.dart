import 'package:flutter/material.dart';
import 'package:videocall/configuration/constants.dart';
import 'package:videocall/widgets/videocall_widget.dart';
import 'package:videocall/l10n/app_localizations.dart';
import 'package:videocall/models/join_args.dart';
import 'package:videocall/services/token_service.dart';
import 'package:videocall/pages/prejoin_page.dart';

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
    'Enfermería',
    'Consulta endocrinología',
    'Medicina General',
  ];

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  void _handleJoin() async {
    if (_formKey.currentState!.validate()) {
      final l10n = AppLocalizations.of(context);
      final roomName = _selectedRoom;
      final userName = _userNameController.text;

      try {
        final token = await TokenService.fetchToken(room: roomName!, username: userName);
        print('Received token: $token');

        // Form is valid, proceed to PreJoinPage
        if (!mounted) return;
        await Navigator.pushNamed(context, PreJoinPage.routeName,
            arguments: JoinArgs(
              url: Constants.SERVER_URL,
              token: token,
              e2ee: Constants.E2EE,
              e2eeKey: Constants.E2EEKEY,
              simulcast: Constants.SIMULCAST,
              adaptiveStream: Constants.ADAPTATIVE_STREAM,
              dynacast: Constants.DYNACAST,
              preferredCodec: Constants.PREFERRED_CODEC,
              enableBackupVideoCodec: ['VP9', 'AV1'].contains(Constants.PREFERRED_CODEC),
            ));
      } catch (e) {
        print('${l10n.errorFetchToken}. ${l10n.errorSeeConsole}. $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.connectTitle),
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
                      l10n.connectHeading,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: l10n.connectRoomLabel,
                        hintText: l10n.connectRoomHint,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.meeting_room),
                      ),
                      hint: Text(l10n.connectRoomHint),
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
                          return l10n.connectRoomError;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _userNameController,
                      decoration: InputDecoration(
                        labelText: l10n.connectUserLabel,
                        hintText: l10n.connectUserHint,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return l10n.connectUserError;
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
                        l10n.connectButton,
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
