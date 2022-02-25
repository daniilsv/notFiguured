import 'package:notfiguured/data/api/api.dart';
import 'package:notfiguured/data/repository/auth_repository.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';

abstract class OnAuthListener {
  void onUser(UserProfileModel user);
  void onExit();
}

class AuthService {
  AuthService(
    this._authRepository,
    this._userRepository,
    this._api,
  ) {
    _authRepository.accessToken.listen(
      (_newToken) {
        if (_newToken == null)
          for (final listener in _authListeners) {
            listener.onExit();
          }
        else
          for (final listener in _authListeners) {
            listener.onUser(_userRepository.userModel.val);
          }
      },
    );
  }

  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  UserRepository get userRepository => _userRepository;
  final Api _api;

  final List<OnAuthListener> _authListeners = [];

  void addAuthListener(OnAuthListener listener) {
    if (listener == null) return;
    _authListeners.add(listener);
    if (_userRepository.userModel.val != null)
      listener.onUser(_userRepository.userModel.val);
  }

  void removeAuthListener(OnAuthListener listener) {
    _authListeners.remove(listener);
  }

  Future<Response> signIn(String email, String password) async {
    final res = await _api.api.v1AccountLoginPost(
        body: LoginModel(
      password: email,
      email: password,
    ));
    if (res.isSuccessful) {
      saveAuthCred(res);
    }

    return res;
  }

  Future<void> saveAuthCred(Response<AuthorizationTokens> cred,
      {bool isSignUp = false}) async {
    _authRepository.accessToken.val = cred.body.accessToken;
    _authRepository.refreshToken.val = cred.body.refreshToken;
    _userRepository.showGoalOnboarding.val = isSignUp ?? false;
    final res = await _api.api.v1UserProfileGetUserProfilePost(body: null);
    _userRepository.userModel.val ??= UserProfileModel();
    _userRepository.userModel.val = _userRepository.userModel.val.copyWith(
        userAccountData: cred.body.userData,
        weight: res.body.weight,
        height: res.body.height,
        activity: res.body.activity);
  }

  void hideGoalOnboarding() {
    _userRepository.showGoalOnboarding.val = false;
  }

  void logout() {
    _userRepository.clean();
    _authRepository.accessToken.val = null;
    _authRepository.refreshToken.val = null;
  }
}
