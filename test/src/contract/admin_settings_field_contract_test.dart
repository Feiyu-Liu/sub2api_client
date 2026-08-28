import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

void main() {
  test('v0.1.183 Admin settings field inventory is complete and pinned', () {
    final contract =
        jsonDecode(
              File(
                'tool/contracts/v0_1_183_admin_settings_fields.json',
              ).readAsStringSync(),
            )
            as Map<String, Object?>;
    expect(contract['sub2api_tag'], 'v0.1.183');
    expect(
      contract['source_revision'],
      'e8cb019fabf8b55199436229044cbf9aa7a82564',
    );
    final counts = contract['counts']! as Map<String, Object?>;
    expect(counts['response_fields'], 254);
    expect(counts['update_fields'], 280);
    expect(counts['shared_fields'], 222);
    expect(counts['secret_update_fields'], 17);

    final update = (contract['update_fields']! as List)
        .cast<Map<String, Object?>>();
    expect(
      update.singleWhere((field) => field['json_name'] == 'smtp_password'),
      containsPair('secret', true),
    );
    expect(
      update.singleWhere((field) => field['json_name'] == 'step_up_enabled'),
      containsPair('go_type', '*bool'),
    );
  });
}
