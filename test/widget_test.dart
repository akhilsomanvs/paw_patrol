// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:paw_patrol/main.dart';
import 'package:paw_patrol/views/screens/details_screen.dart';
import 'package:paw_patrol/views/widgets/dialogs/custom_dialog_widget.dart';
import 'package:paw_patrol/views/widgets/pet_card_widget.dart';

void main() {
  group("Home screen widgets", () {
    testWidgets('Should open the navigation drawer when tapping on the menu icon', (WidgetTester tester) async {
      ///Needs this line to prevent network images issues
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(const MyApp());

        final menuIcon = find.byIcon(Icons.menu);
        expect(menuIcon, findsOneWidget);

        await tester.tap(menuIcon);
        await tester.pump();

        expect(find.text('Show History'), findsOneWidget);
      });
    });
    testWidgets('Should navigate to Details screen when clicking on a PetCardWidget', (WidgetTester tester) async {
      ///Needs this line to prevent network images issues
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(const MyApp());

        await tester.pump(Duration(seconds: 2));

        final petCard = find.byKey(Key("1"));
        expect(petCard, findsOneWidget);

        await tester.tap(petCard);
        await tester.pump();

        final detailsScreen = find.byType(DetailsScreen, skipOffstage: false);
        expect(detailsScreen, findsAtLeastNWidgets(1));
      });
    });
  });
}
