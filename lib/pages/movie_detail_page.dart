import 'package:flutter/material.dart';
import 'package:kuis_h/model/movie_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailPage extends StatelessWidget {
  MovieModel movie;
  MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: ListView(
        children: [
          Column(
            children: [ 
              Image.network(movie.imgUrl, width: 250,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title + " (" + movie.year.toString() + ")", 
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("Directer by" + movie.director),
                    Text("Genre : " + movie.genre),
                    Text("Cast : " + movie.casts.join(", ")),
                    SizedBox(height: 10),
                    Text(movie.synopsis),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Text(
                    movie.rating.toString() + "/10",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async{
                  await launchUrl(Uri.parse(movie.movieUrl));}, 
                child: Text("Wikipedia")
              ),
            ],
          )
        ],
      ),
    );
  }
}