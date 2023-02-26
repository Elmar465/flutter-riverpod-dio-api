// ignore: file_names
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_api2/provider/api_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../service/api_service.dart';
import '../model/user_model.dart';

class MainPage extends ConsumerWidget {
  const  MainPage({super.key});
  static const routeName = '/';
    
  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final userData =  ref.watch(userDataProvider.future);
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: userData,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<User> user = snapshot.data!;
            return ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(user[index].username),
                  subtitle: Text(user[index].email),
                  leading: Text(user[index].id.toString()),
                  children: [
                    Text(user[index].password)
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.hasError.toString());
          }
          else {
            return CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}