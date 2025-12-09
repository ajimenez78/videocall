import 'package:flutter/material.dart';
import 'package:videocall/l10n/app_localizations.dart';

extension LKExampleExt on BuildContext {
  //
  Future<bool?> showPublishDialog() {
    final l10n = AppLocalizations.of(this);
    return showDialog<bool>(
      context: this,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.dialogPublishTitle),
        content: Text(l10n.dialogPublishContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.dialogButtonNo),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.dialogButtonYes),
          ),
        ],
      ),
    );
  }

  Future<bool?> showPlayAudioManuallyDialog() {
    final l10n = AppLocalizations.of(this);
    return showDialog<bool>(
      context: this,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.dialogPlayAudioTitle),
        content: Text(l10n.dialogPlayAudioContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.dialogButtonIgnore),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.dialogPlayAudioButton),
          ),
        ],
      ),
    );
  }

  Future<bool?> showUnPublishDialog() {
    final l10n = AppLocalizations.of(this);
    return showDialog<bool>(
      context: this,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.dialogUnpublishTitle),
        content: Text(l10n.dialogUnpublishContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.dialogButtonNo),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.dialogButtonYes),
          ),
        ],
      ),
    );
  }

  Future<void> showErrorDialog(dynamic exception) {
    final l10n = AppLocalizations.of(this);
    return showDialog<void>(
      context: this,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.dialogErrorTitle),
        content: Text(exception.toString()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.dialogButtonOk),
          )
        ],
      ),
    );
  }

  Future<bool?> showDisconnectDialog() {
    final l10n = AppLocalizations.of(this);
    return showDialog<bool>(
      context: this,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.dialogDisconnectTitle),
        content: Text(l10n.dialogDisconnectContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.dialogButtonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.dialogDisconnectButton),
          ),
        ],
      ),
    );
  }

  Future<bool?> showReconnectDialog() {
    final l10n = AppLocalizations.of(this);
    return showDialog<bool>(
      context: this,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.dialogReconnectTitle),
        content: Text(l10n.dialogReconnectContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.dialogButtonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.dialogReconnectButton),
          ),
        ],
      ),
    );
  }

  Future<void> showReconnectSuccessDialog() {
    final l10n = AppLocalizations.of(this);
    return showDialog<void>(
      context: this,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.dialogReconnectTitle),
        content: Text(l10n.dialogReconnectSuccessContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.dialogButtonOk),
          ),
        ],
      ),
    );
  }

  Future<bool?> showSendDataDialog() {
    final l10n = AppLocalizations.of(this);
    return showDialog<bool>(
      context: this,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.dialogSendDataTitle),
        content: Text(l10n.dialogSendDataContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.dialogButtonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.dialogSendDataButton),
          ),
        ],
      ),
    );
  }

  Future<bool?> showDataReceivedDialog(String data) {
    final l10n = AppLocalizations.of(this);
    return showDialog<bool>(
      context: this,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.dialogDataReceivedTitle),
        content: Text(data),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.dialogButtonOk),
          ),
        ],
      ),
    );
  }

  Future<bool?> showRecordingStatusChangedDialog(bool isActiveRecording) {
    final l10n = AppLocalizations.of(this);
    return showDialog<bool>(
      context: this,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.dialogRecordingTitle),
        content: Text(isActiveRecording ? l10n.dialogRecordingActive : l10n.dialogRecordingStopped),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.dialogButtonOk),
          ),
        ],
      ),
    );
  }

  Future<bool?> showSubscribePermissionDialog() {
    final l10n = AppLocalizations.of(this);
    return showDialog<bool>(
      context: this,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.dialogSubscribePermissionTitle),
        content: Text(l10n.dialogSubscribePermissionContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.dialogButtonNo),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.dialogButtonYes),
          ),
        ],
      ),
    );
  }

  Future<SimulateScenarioResult?> showSimulateScenarioDialog() {
    final l10n = AppLocalizations.of(this);
    return showDialog<SimulateScenarioResult>(
      context: this,
      builder: (ctx) => SimpleDialog(
        title: Text(l10n.dialogSimulateScenarioTitle),
        children: SimulateScenarioResult.values
            .map((e) => SimpleDialogOption(
                  child: Text(e.name),
                  onPressed: () => Navigator.pop(ctx, e),
                ))
            .toList(),
      ),
    );
  }
}

enum SimulateScenarioResult {
  signalReconnect,
  fullReconnect,
  speakerUpdate,
  nodeFailure,
  migration,
  serverLeave,
  switchCandidate,
  e2eeKeyRatchet,
  participantName,
  participantMetadata,
  clear,
}
