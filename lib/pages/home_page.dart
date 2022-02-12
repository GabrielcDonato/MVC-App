import 'package:flutter/material.dart';
import 'package:movie_app/controllers/home_controller.dart';
import 'package:movie_app/models/post_model.dart';
import 'package:movie_app/repositories/home_repository_impl.dart';
import 'package:movie_app/services/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImpl());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          "Home",
        ),
        actions: [
          IconButton(
            onPressed: () => _controller.fetch(),
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              PrefsServices.logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (_) => true);
              // .pushNamedAndRemoveUntil('/login', (route) => true);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts,
        builder: (_, list, __) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, idx) => ListTile(
              leading: Text(list[idx].id.toString()),
              trailing: const Icon(Icons.arrow_forward),
              title: Text(list[idx].title),
              // onTap: () => print(list[idx]),
              onTap: () => Navigator.of(context)
                  .pushNamed('/details', arguments: list[idx]),
            ),
            separatorBuilder: (_, __) => const Divider(),
          );
        },
      ),
    );
  }
}
