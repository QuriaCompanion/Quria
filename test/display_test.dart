import 'dart:convert';

import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:quria/data/models/helpers/exoticHelper.model.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:test/test.dart';
import 'package:universal_io/io.dart';

void main() async {
  group('DisplayService()', () {
    group('exoticLoop', () {
      test('all exotics', () async {
        final response = File(
            'C:/Users/hunts/work/cours/Quria/Quria/test/mocks/mockedRequest.json');
        final Map<String, dynamic> json =
            jsonDecode(await response.readAsString());
        List<DestinyItemComponent> items = [];
        for (var item in json["items"]) {
          items.add(DestinyItemComponent.fromJson(item));
        }
        final manifestResponse = File(
            'C:/Users/hunts/work/cours/Quria/Quria/test/mocks/mockedManifest.json');
        final Map<String, dynamic> manifestJson =
            jsonDecode(await manifestResponse.readAsString());
        Map<int, DestinyInventoryItemDefinition> manifest = {};
        for (final entry in manifestJson.entries) {
          manifest[int.parse(entry.key)] =
              DestinyInventoryItemDefinition.fromJson(entry.value);
        }
        ExoticHelper exoticHelperMock = ExoticHelper(
            manifest: manifest, items: items, classType: DestinyClass.Warlock);
        List<DestinyInventoryItemDefinition> exotics =
            DisplayService().exoticLoop(exoticHelperMock);
        expect(exotics.length, equals(3));
        expect(exotics[0].displayProperties?.name, equals("Necrotic Grip"));
      });
    });
  });
}
