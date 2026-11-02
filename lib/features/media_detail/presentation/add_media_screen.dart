import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../app/router.dart';
import '../../../app/theme/design_tokens.dart';
import '../../../core/errors/app_failure.dart';
import '../../../core/services/app_logger.dart';
import '../../../l10n/app_localizations.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../library/domain/library_entities.dart';
import '../../library/presentation/library_providers.dart';
import '../../library/presentation/status_labels.dart';
import '../domain/media_summary.dart';
import 'media_providers.dart';

class AddMediaScreen extends ConsumerStatefulWidget {
  const AddMediaScreen({super.key});

  @override
  ConsumerState<AddMediaScreen> createState() => _AddMediaScreenState();
}

class _AddMediaScreenState extends ConsumerState<AddMediaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _originalTitle = TextEditingController();
  final _runtime = TextEditingController();
  final _overview = TextEditingController();
  final _poster = TextEditingController();

  MediaType _type = MediaType.movie;
  WatchStatus _status = WatchStatus.planToWatch;
  DateTime? _releaseDate;
  bool _saving = false;

  @override
  void dispose() {
    _title.dispose();
    _originalTitle.dispose();
    _runtime.dispose();
    _overview.dispose();
    _poster.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _releaseDate ?? now,
      firstDate: DateTime(1888),
      lastDate: DateTime(now.year + 10),
    );
    if (picked != null && mounted) setState(() => _releaseDate = picked);
  }

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);
    final userId = ref.read(currentUserIdProvider);
    if (userId == null || !(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _saving = true);
    String? createdId;
    try {
      final media = await ref.read(manualMediaRepositoryProvider).create(
            userId,
            ManualMediaInput(
              title: _title.text,
              mediaType: _type,
              originalTitle: _originalTitle.text,
              overview: _overview.text,
              releaseDate: _releaseDate,
              runtimeMinutes: int.tryParse(_runtime.text.trim()),
              posterPath: _poster.text,
            ),
          );
      createdId = media.id;
      await ref
          .read(libraryRepositoryProvider)
          .setStatus(userId, media.id, _status);
      if (mounted) unawaited(router.pushReplacement(AppPaths.media(media.id)));
    } on AppFailure catch (failure, stack) {
      AppLogger.error('Adding manual media failed', failure, stack);
      if (createdId != null) {
        // The media exists but is not in the library yet: let the user finish
        // on the detail screen instead of leaving an unreachable orphan.
        messenger.showSnackBar(SnackBar(content: Text(l10n.addMediaPartial)));
        if (mounted) unawaited(router.pushReplacement(AppPaths.media(createdId)));
      } else {
        messenger.showSnackBar(SnackBar(content: Text(l10n.addMediaFailed)));
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final dateFormat = DateFormat.yMMMd(Localizations.localeOf(context).toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.addMediaTitle),
        actions: [
          TextButton(
            onPressed: _saving ? null : _save,
            child: Text(l10n.detailSave),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            TextFormField(
              controller: _title,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(labelText: l10n.fieldTitle),
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? l10n.fieldTitleRequired
                  : null,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(l10n.fieldType, style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: AppSpacing.sm),
            SegmentedButton<MediaType>(
              showSelectedIcon: false,
              segments: [
                for (final type in MediaType.values)
                  ButtonSegment(value: type, label: Text(type.label(l10n))),
              ],
              selected: {_type},
              onSelectionChanged: (selection) =>
                  setState(() => _type = selection.first),
            ),
            const SizedBox(height: AppSpacing.lg),
            TextFormField(
              controller: _originalTitle,
              decoration: InputDecoration(labelText: l10n.fieldOriginalTitle),
            ),
            const SizedBox(height: AppSpacing.lg),
            InputDecorator(
              decoration: InputDecoration(labelText: l10n.fieldReleaseDate),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _releaseDate == null
                          ? '–'
                          : dateFormat.format(_releaseDate!),
                    ),
                  ),
                  if (_releaseDate != null)
                    IconButton(
                      icon: const Icon(Icons.clear),
                      tooltip: l10n.fieldClearDate,
                      onPressed: () => setState(() => _releaseDate = null),
                    ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    tooltip: l10n.fieldPickDate,
                    onPressed: _pickDate,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            TextFormField(
              controller: _runtime,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(labelText: l10n.fieldRuntime),
              validator: (value) {
                final text = value?.trim() ?? '';
                if (text.isEmpty) return null;
                final parsed = int.tryParse(text);
                return (parsed == null || parsed <= 0)
                    ? l10n.fieldRuntimeInvalid
                    : null;
              },
            ),
            const SizedBox(height: AppSpacing.lg),
            TextFormField(
              controller: _overview,
              minLines: 3,
              maxLines: 6,
              decoration: InputDecoration(labelText: l10n.fieldOverview),
            ),
            const SizedBox(height: AppSpacing.lg),
            TextFormField(
              controller: _poster,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(labelText: l10n.fieldPoster),
            ),
            const SizedBox(height: AppSpacing.lg),
            DropdownButtonFormField<WatchStatus>(
              initialValue: _status,
              decoration: InputDecoration(labelText: l10n.fieldInitialStatus),
              items: [
                for (final status in WatchStatus.values)
                  DropdownMenuItem(value: status, child: Text(status.label(l10n))),
              ],
              onChanged: (value) {
                if (value != null) setState(() => _status = value);
              },
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}
