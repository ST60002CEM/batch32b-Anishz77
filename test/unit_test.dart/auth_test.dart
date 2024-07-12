import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:trailtrekker_app/features/auth/domain/use_case/auth_use_case.dart';
import 'package:trailtrekker_app/features/auth/presentation/navigator/login_navigator.dart';
import 'auth_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<LoginViewNavigator>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthUseCase mockAuthUsecase;
  late ProviderContainer container;
  late LoginViewNavigator mockLoginViewNavigator;

  setUp(() {
    mockAuthUsecase = MockAuthUseCase();
    container = ProviderContainer(
      overrides: [
        authUserCaseProvider.overrideWithValue(mockAuthUsecase),
      ],
    );
    mockLoginViewNavigator = MockLoginViewNavigator();
  });

  tearDown(() {
    container.dispose();
  });

  group('AuthState Tests', () {
    test('Initial state should have isLoading false, error null, imageName null', () {
      final state = AuthState.initial();

      expect(state.isLoading, false);
      expect(state.error, null);
      expect(state.imageName, null);
    });

    test('CopyWith should update isLoading', () {
      final state = AuthState.initial().copyWith(isLoading: true);

      expect(state.isLoading, true);
      expect(state.error, null);
      expect(state.imageName, null);
    });

    test('CopyWith should update error', () {
      final state = AuthState.initial().copyWith(error: 'Some error');

      expect(state.isLoading, false);
      expect(state.error, 'Some error');
      expect(state.imageName, null);
    });

    // Incorrect test: this should fail because we expect isLoading to be true but initial state is false
    test('Initial state should have isLoading true (incorrect test)', () {
      final state = AuthState.initial();

      expect(state.isLoading, true);
    });

    // Incorrect test: this should fail because we expect error to be 'No error' but initial state is null
    test('Initial state should have error as "No error" (incorrect test)', () {
      final state = AuthState.initial();

      expect(state.error, 'No error');
    });
  });
}

class AuthState {
  final bool isLoading;
  final String? error;
  final String? imageName;

  AuthState({
    required this.isLoading,
    this.error,
    this.imageName,
  });

  factory AuthState.initial() {
    return AuthState(isLoading: false, error: null, imageName: null);
  }

  AuthState copyWith({
    bool? isLoading,
    String? error,
    String? imageName,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      imageName: imageName ?? this.imageName,
    );
  }

  @override
  String toString() {
    return 'AuthState(isLoading: $isLoading, error: $error, imageName: $imageName)';
  }
}
