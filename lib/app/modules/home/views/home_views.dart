import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Top Anime')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.animeList.length,
          itemBuilder: (_, index) {
            final anime = controller.animeList[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(anime.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Type: ${anime.type}'),
                    Text('Episodes: ${anime.episodes ?? '-'}'),
                    Text('Score: ${anime.score ?? '-'}'),
                    Text('Rank: #${anime.rank}'),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
