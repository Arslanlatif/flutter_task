import 'package:flutter_application_1/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('PostBloc', () {
    test('fetchPosts success', () async {
      final mockClient = MockClient();
      when(mockClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/posts')))
          .thenAnswer((_) async => http.Response('[]', 200));

      final bloc = PostBloc(client: mockClient);

      await bloc.fetchPosts();

      expect(bloc.state, isEmpty);
    });

    test('fetchPosts failure', () async {
      final mockClient = MockClient();
      when(mockClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/posts')))
          .thenAnswer((_) async => http.Response('Error', 400));

      final bloc = PostBloc(client: mockClient);

      expect(() => bloc.fetchPosts(), throwsException);
    });
  });
}
