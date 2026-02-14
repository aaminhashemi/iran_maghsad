import 'package:flutter_riverpod/flutter_riverpod.dart';  // این خط رو حتماً اضافه کن

enum SplashStatus {
  initial,
  loading,
  success,
  error,
}

class SplashState {
  final SplashStatus status;
  final String? errorMessage;
  final double progress;

  SplashState({
    this.status = SplashStatus.initial,
    this.errorMessage,
    this.progress = 0.0,
  });

  SplashState copyWith({
    SplashStatus? status,
    String? errorMessage,
    double? progress,
  }) {
    return SplashState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      progress: progress ?? this.progress,
    );
  }
}

// این Provider برای استفاده در UI
final splashStateProvider = StateNotifierProvider<SplashNotifier, SplashState>((ref) {
  return SplashNotifier();
});

class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier() : super(SplashState());

  Future<String> initializeApp() async {
    state = state.copyWith(status: SplashStatus.loading, progress: 0.1);

    try {
      await Future.delayed(const Duration(milliseconds: 500));
      state = state.copyWith(progress: 0.3);

      await Future.delayed(const Duration(milliseconds: 500));
      state = state.copyWith(progress: 0.6);

      await Future.delayed(const Duration(milliseconds: 500));
      state = state.copyWith(progress: 0.9);

      final hasToken = await _checkAuthToken();

      await Future.delayed(const Duration(milliseconds: 500));
      state = state.copyWith(status: SplashStatus.success, progress: 1.0);

      if (hasToken) {
        return '/home';
      } else {
        return '/login';
      }
    } catch (e) {
      state = state.copyWith(
        status: SplashStatus.error,
        errorMessage: e.toString(),
      );
      return '/error';
    }
  }

  Future<bool> _checkAuthToken() async {
    // اینجا منطق چک کردن توکن رو بذار
    return false;
  }
}