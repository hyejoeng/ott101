import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ott101/presentation/provider/tmdb_proider.dart';

// 전역으로 사용
final Client client = Client();

final apiToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYTg1OTFjN2U0YzVjYWVjYjRlMDhhNzI3ODA2YWYxOSIsInN1YiI6IjY1OGQyYThmNTVjMWY0NjFkNDM5YTM3ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.t7K3U8egkt_gYmvaCGC9Hdc9OjDRzLtl0l4XA3i1_o4';

 int movieId = 695721;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    callApi();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  void callApi() async {
    final response = await client.get(
        Uri.https('api.themoviedb.org', '3/movie/$movieId', {"language": "ko-KR"}),
        headers: {'Authorization': 'Bearer $apiToken'}
    );

    print(response.body);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  final TMDBProvider provider = TMDBProvider();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.provider.addListener(() => setState(() {}));
    // widget.provider.getMainMovie(695721);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
    );
  }
}
