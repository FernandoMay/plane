// Widget test de plane — verifica la animación implícita del avión.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:animated/main.dart';

void main() {
  testWidgets('el avión arranca abajo y el FAB muestra "Take Flight"',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byIcon(Icons.airplanemode_active), findsNWidgets(2)); // FAB + child
    expect(find.text('Take Flight'), findsOneWidget);

    final animated = tester.widget<AnimatedContainer>(
      find.byType(AnimatedContainer),
    );
    expect(animated.alignment, Alignment.bottomCenter);
    expect(animated.duration, const Duration(seconds: 2));
  });

  testWidgets('al tocar el FAB el avión vuela al centro',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Take Flight'));
    await tester.pump();                    // inicio de la animación
    await tester.pump(const Duration(seconds: 2)); // animación completa

    final animated = tester.widget<AnimatedContainer>(
      find.byType(AnimatedContainer),
    );
    expect(animated.alignment, Alignment.center);
  });
}
