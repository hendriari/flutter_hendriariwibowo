import 'package:praktikum/src/model/api/user_api.dart';
import 'package:praktikum/src/model/model/user_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'user_api_test.mocks.dart';

@GenerateMocks([UserApi])
void main() {
  group('UserApi', () {
    UserApi userApi = MockUserApi();

    test('Get all user data', () async {
      when(userApi.fetchUserData()).thenAnswer((_) async => <UserModel>[
            UserModel(
              id: 1,
              email: "george.bluth@reqres.in",
              firstName: "George",
              lastName: "Bluth",
              avatar: "https://reqres.in/img/faces/1-image.jpg",
            ),
          ]);

      var users = await userApi.fetchUserData();
      expect(users.isNotEmpty, true);

    });
  });
}
