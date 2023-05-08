import 'package:flutter/material.dart';
import 'package:projeto_app/home/spotify_artist_screen.dart';
import 'package:spotify/spotify.dart';

void main() async {
  final credentials = SpotifyApiCredentials(
    '980bc4a100a64c40b0149076375a35c1',
    'fe2b290fda5348dfaeb08f414a71b12f',
  );

  final spotify = SpotifyApi(credentials);
  final artist = await spotify.artists.get('2pH3wEn4eYlMMIIQyKPbVR'); // DragonForce

  var token = await spotify.getCredentials();

  // artista, como gênero
  // musical, nome, foto, e número de seguidores0
  
  final artistName = artist.name;
  final artistGenres = artist.genres;

  runApp(MyApp(artistName!, artistGenres!));
}

class MyApp extends StatelessWidget {
  final String artistName;
  final List<String> artistGenres;


  const MyApp(this.artistName, this.artistGenres, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpotifyStateful(artistName: artistName, artistGenres: artistGenres),
    );
  }
}
