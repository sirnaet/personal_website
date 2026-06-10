import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/main.dart';

void main() {
  testWidgets('Version Selector Landing Page renders and navigates to Flutter version', (WidgetTester tester) async {
    // Set viewport size to a standard desktop viewport.
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;

    // Reset the viewport size after the test.
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the landing page renders with the title and description.
    expect(find.text('VERSION SELECTOR'), findsOneWidget);
    expect(find.text('Pick which version of the website you want to view.'), findsOneWidget);

    // Verify the buttons for React and Flutter versions exist.
    expect(find.text('View React Version'), findsOneWidget);
    expect(find.text('View Flutter Version'), findsOneWidget);

    // Tap the 'View Flutter Version' button and trigger navigation.
    await tester.tap(find.text('View Flutter Version'));
    await tester.pumpAndSettle();

    // Verify we have navigated to the PortfolioHome.
    expect(find.byType(PortfolioHome), findsOneWidget);
  });
}
