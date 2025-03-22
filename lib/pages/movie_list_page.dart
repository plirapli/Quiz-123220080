import 'package:flutter/material.dart';
import 'package:kuis_h/data/movie_data.dart';
import 'package:kuis_h/model/movie_model.dart';
import 'package:kuis_h/pages/movie_detail_page.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: ListView(
          children: movieList.map((movie) {
            return MovieContainer(movie: movie);
          }).toList(),
        ),
      ),
    );
  }
}

class MovieContainer extends StatelessWidget {
  final MovieModel movie;
  const MovieContainer({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MovieDetailPage(movie: movie)));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    movie.imgUrl,
                    width: 100,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${movie.title} (${movie.year})"),
                      Text(movie.genre),
                      Row(
                        children: [
                          Text(movie.rating.toString()),
                          Icon(Icons.star, color: Colors.yellow),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.bookmark_border,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12)
      ],
    );
  }
}
