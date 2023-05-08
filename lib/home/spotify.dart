import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/spotify.dart';

// classe principal
class SpotifyStateful extends StatefulWidget {
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
            Text(widget.artistName),
            Text(widget.artistGenres.join(', '),)
          ],
        ),
      ),
    );
  }
}