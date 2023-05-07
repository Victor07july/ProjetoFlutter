import 'dart:io';
import 'package:http/http.dart';
import 'package:test/test.dart';
import 'package:http/testing.dart';
import 'package:spotify/spotify.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';

class SpotifyApi {
  final Client _httpClient;
  final String _accessToken;

  SpotifyApi(this._accessToken, {Client? httpClient})
      : _httpClient = httpClient ?? Client();

  Future<Map<String, dynamic>> getArtist(String artistId) async {
    final response = await _httpClient.get(
      Uri.parse('https://api.spotify.com/v1/artists/$artistId'),
      headers: {
        'Authorization': 'Bearer $_accessToken',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get artist with id $artistId');
    }
  }
}

void main() {
  test('Pegar artista usando uma resposta API Mock', () async {
    // Define a resposta mock
    const artistId = '2pH3wEn4eYlMMIIQyKPbVR';
    final responseMap = {
      'id': artistId,
      'name': 'DragonForce',
      'genres': ['Power Metal'],
      'popularity': 70,
    };

    // Cria u cliente mock para retornar a resposta mock
    final mockClient = MockClient(
          (request) async {
        expect(
          request.headers['Authorization'],
          'Bearer mock_access_token',
        );
        expect(request.url, Uri.parse('https://api.spotify.com/v1/artists/$artistId'));
        return Response(jsonEncode(responseMap), 200);
      },
    );

    // Instancia SpotifyApi com o cliente mock
    final spotifyApi = SpotifyApi('mock_access_token', httpClient: mockClient);

    // Chama getArtist com o ID artista mock
    final artist = await spotifyApi.getArtist(artistId);
    
    // Verifica se o objeto artista possui a resposta esperada
    expect(artist['id'], responseMap['id']);
    expect(artist['name'], responseMap['name']);
    expect(artist['genres'], responseMap['genres']);
    expect(artist['popularity'], responseMap['popularity']);
  });
}