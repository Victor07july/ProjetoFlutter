import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/spotify.dart' as Spotify;

// classe principal
class SpotifyStateful extends StatefulWidget {
  final artistId = '2pH3wEn4eYlMMIIQyKPbVR';
  final String artistName;
  final List<String> artistGenres;

  const SpotifyStateful({required this.artistName, required this.artistGenres});

  @override
  State<StatefulWidget> createState() {
    return _SpotifyStatefulState();
  }
}

// estado
class _SpotifyStatefulState extends State<SpotifyStateful>{
  late String _imageURL; // atributo para armazenar a URL da imagem do artista

  @override
  void initState() {
    super.initState();
    _loadImage(); // carrega a imagem do artista
  }

  void _loadImage() async {
    final spotify = Spotify.SpotifyApi(Spotify.SpotifyApiCredentials('980bc4a100a64c40b0149076375a35c1', 'fe2b290fda5348dfaeb08f414a71b12f'));
    final artist = await spotify.artists.get(widget.artistId);
    if (artist.images!.isNotEmpty) {
      setState(() {
        _imageURL = artist.images![0].url!; // armazena a URL da primeira imagem do artista
      });
    }
  }

  String texto = "Spotify API!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(texto),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              widget.artistName,
              style: TextStyle (
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
                ),
            ),
            Text(
              widget.artistGenres.join(', '),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),

            ),
            if (_imageURL != null) // exibe a imagem apenas se a URL estiver disponível
              CircleAvatar(
                radius: 200,
                backgroundImage: NetworkImage(_imageURL),
              )
          ],
        ),
      ),
    );
  }
}
