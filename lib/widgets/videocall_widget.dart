import 'package:flutter/material.dart';
import 'package:videocall/l10n/app_localizations.dart';

class VideocallWidget extends StatelessWidget {
  const VideocallWidget({Key? key}) : super(key: key);

  static const serverUrl = 'wss://meet.movilok.net'; // Replace with your LiveKit server URL
  static const tokenEndpoint = 'http://localhost:3000/getToken'; // Replace with your token server URL

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.video_call,
            size: 64,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(height: 16),
          Text(
            l10n.videocallWidgetTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 8),
          Text(
            l10n.videocallWidgetSubtitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
