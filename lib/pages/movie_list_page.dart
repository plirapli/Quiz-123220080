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
      body: ListView(
        children: movieList.map((movie) {
          return MovieContainer(movie: movie);
        }).toList(),
      ),
    );
  }
}


// class MovieContainer extends StatefulWidget {
//   final MovieModel movie;
//   MovieContainer({super.key, required this.movie});

//   @override
//   State<MovieContainer> createState() => _MovieContainerState();
// }

// class _MovieContainerState extends State<MovieContainer> {
//   bool isBookmarked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.all(30.0),
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10)
//               ),
//             ),
//             onPressed: (){
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context)=>MovieDetailPage(movie: widget.movie)
//               ));
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Image.network(widget.movie.imgUrl, width: 100,),
//                 Column(
//                   children: [
//                     ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         Text(widget.movie.title + " (" + widget.movie.year.toString() + ")",),
//                       ],
//                     ),
//                     Text(widget.movie.genre),
//                     Row(
//                       children: [
//                         Text(widget.movie.rating.toString()),
//                         Icon(Icons.star, color: Colors.yellow),
//                       ],
//                     )
//                   ],
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     isBookmarked ? Icons.bookmark : Icons.bookmark_border,
//                     color: isBookmarked ? Colors.blue : Colors.black,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       isBookmarked = !isBookmarked;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class MovieContainer extends StatelessWidget {
  MovieModel movie;
  MovieContainer({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(30.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>MovieDetailPage(movie: movie)
              ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(movie.imgUrl, width: 100,),
                Column(
                  children: [
                    Text(movie.title + " (" + movie.year.toString() + ")"),
                    Text(movie.genre),
                    Row(
                      children: [
                        Text(movie.rating.toString()),
                        Icon(Icons.star, color: Colors.yellow),
                      ],
                    )
                  ],
                ),
                Icon(Icons.bookmark_border, color:Colors.black,),
                Icon(Icons.bookmark, color:Colors.blue,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}