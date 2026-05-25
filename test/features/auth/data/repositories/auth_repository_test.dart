import 'package:flutter_test/flutter_test.dart';
import 'package:mamlakat_alabtal/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mamlakat_alabtal/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:mamlakat_alabtal/features/auth/data/models/auth_dto.dart';
import 'package:mamlakat_alabtal/features/auth/data/models/user_dto.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@GenerateMocks([AuthRemoteDataSource, FlutterSecureStorage])
import 'auth_repository_test.mocks.dart' as mocks;
import 'auth_repository_test.mocks.dart';

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late MockFlutterSecureStorage mockSecureStorage;

  setUp(() {
    mockRemoteDataSource = mocks.MockAuthRemoteDataSource();
    mockSecureStorage = mocks.MockFlutterSecureStorage();
    repository = AuthRepositoryImpl(mockRemoteDataSource, mockSecureStorage);
  });

  group('login', () {
    test('should return UserEntity when login is successful', () async {
      // Arrange
      final authDto = AuthDto(
        accessToken: 'test_token',
        refreshToken: 'test_refresh_token',
        user: UserDto(
          id: 1,
          name: 'Test User',
          email: 'test@example.com',
          age: 8,
          gender: 'boy',
        ),
      );

      when(mockRemoteDataSource.login('test@example.com', 'password123'))
          .thenAnswer((_) async => authDto);
      when(mockSecureStorage.write(
        key: anyNamed('key'),
        value: anyNamed('value'),
      )).thenAnswer((_) async => {});

      // Act
      final result = await repository.login('test@example.com', 'password123');

      // Assert
      expect(result.id, 1);
      expect(result.name, 'Test User');
      expect(result.email, 'test@example.com');
      verify(mockSecureStorage.write(
        key: 'access_token',
        value: 'test_token',
      )).called(1);
    });
  });
}
