import 'dart:convert';
import 'dart:io';

import 'package:sub2api_client/src/usage/sub2api_usage_mapper.dart';
import 'package:test/test.dart';

void main() {
  group('v0.1.183 usage fixtures', () {
    test('maps list page with exact decimal costs', () {
      final page = mapUsagePage(_fixture('usage/list.json'));

      expect(page.items, hasLength(1));
      expect(page.items.single.totalCost.toString(), '0.003');
      expect(page.items.single.actualCost.toString(), '0.0045');
      expect(page.page, 1);
      expect(page.total, 1);
    });

    test('maps one detail record', () {
      final record = mapUsageDetail(_fixture('usage/detail.json'));

      expect(record.id, 102);
      expect(record.requestType, 'responses');
      expect(record.totalCost.toString(), '0.0003');
    });

    test('maps aggregate statistics', () {
      final stats = mapUsageStatistics(_fixture('usage/stats.json'));

      expect(stats.totalRequests, 12);
      expect(stats.totalActualCost.toString(), '1.5');
      expect(stats.averageDurationMs.toString(), '15.5');
    });
  });
}

Object? _fixture(String relativePath) =>
    jsonDecode(File('test/fixtures/v0_1_183/$relativePath').readAsStringSync());
