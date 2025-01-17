import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:football_coach_app/screens/dashboard_screen.dart';
import 'package:football_coach_app/screens/auth/login_screen.dart';
import 'package:football_coach_app/screens/auth/register_screen.dart';
import 'package:football_coach_app/providers/auth_providers.dart';

// Generate a mock for the AuthService
class MockAuthService extends Mock implements AuthService {}

@GenerateMocks([MockAuthService])
void main() {
  late MockAuthService mockAuthService;

  setUp(() {
    mockAuthService = MockAuthService();
  });

  Widget createWidgetUnderTest() {
    return ProviderScope(
      overrides: [
        authServiceProvider.overrideWithValue(mockAuthService),
      ],
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }

  testWidgets('Renders LoginScreen widgets', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));  // Email & Password
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
  });

  testWidgets('Successful login navigates to DashboardScreen', (WidgetTester tester) async {
    when(mockAuthService.login("any", "any")).thenAnswer((_) async {});

    await tester.pumpWidget(createWidgetUnderTest());

    await tester.enterText(find.byType(TextField).at(0), 'abc@abc.com');
    await tester.enterText(find.byType(TextField).at(1), 'sibul123');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    verify(mockAuthService.login('test@example.com', 'password123')).called(1);
    expect(find.byType(DashboardScreen), findsOneWidget);
  });

  testWidgets('Failed login shows SnackBar with error message', (WidgetTester tester) async {
    when(mockAuthService.login("any", "any")).thenThrow(Exception('Invalid credentials'));

    await tester.pumpWidget(createWidgetUnderTest());

    await tester.enterText(find.byType(TextField).at(0), 'wrong@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'wrongpassword');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();  // Let the SnackBar appear

    expect(find.textContaining('Login failed: Exception: Invalid credentials'), findsOneWidget);
  });

  testWidgets('Clicking Register navigates to RegisterScreen', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    await tester.tap(find.text('Register'));
    await tester.pumpAndSettle();

    expect(find.byType(RegisterScreen), findsOneWidget);
  });
}
