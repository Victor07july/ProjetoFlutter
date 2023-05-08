import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spotify/spotify.dart' as Spotify;
import 'package:projeto_app/home/spotify_artist_screen.dart';

void main() {
  group('Artist Screen', () {
    late Spotify.SpotifyApi spotifyApi;
    const artistId = '2pH3wEn4eYlMMIIQyKPbVR';

    setUpAll(() {
      spotifyApi = Spotify.SpotifyApi(
        Spotify.SpotifyApiCredentials(
          '980bc4a100a64c40b0149076375a35c1',
          'fe2b290fda5348dfaeb08f414a71b12f',
        ),
      );
    });

    testWidgets('Testa a tela do artista', (WidgetTester tester) async {
      final artist = await spotifyApi.artists.get(artistId);
      final artistGenres = artist.genres ?? [];

      await tester.pumpWidget(
        MaterialApp(
          home: SpotifyStateful(
            artistName: artist.name!,
            artistGenres: artistGenres,
          ),
        ),
      );

      expect(find.text(artist.name!), findsOneWidget);
      expect(find.text(artistGenres.join(', ')), findsOneWidget);
    });
  });
}
