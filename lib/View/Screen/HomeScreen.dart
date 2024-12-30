import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:offline_service/Controller/Riverpod/DataProvider.dart';
import 'package:offline_service/View/Widget/Posts.dart';

class Homescreen extends ConsumerWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataProvider);

    return Scaffold(
       appBar: AppBar(
        title:Text('Online to Ofline'),
       ),
       floatingActionButton: FloatingActionButton(onPressed: (){
        ref.refresh(dataProvider);
       },child: Icon(Icons.restart_alt),),
      body: data.when(
        data: (data) {
          if (data.isEmpty) {
            return Center(
              child: Text(
                'No data available. Please connect to the internet to fetch data.',
                textAlign: TextAlign.center,
              ),
            );
          }

          // Display the data in a ListView
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return posts(data: data[index]);
            },
          );
        },
        error: (err, s) => Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text('Error: $err'),
          ),
        ),
        loading: () => const Center(child: Text('Loading....')),
      ),
    );
  }
}
