import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopee/data/models/user_model.dart';
import 'package:shopee/view_models/admin/auth_view_model.dart';

import '../../../../data/models/book_model.dart';
import '../../../../data/services/notification_servise.dart';
import '../../../../view_models/admin/products_view_model.dart';

class ManageUsersPage extends StatelessWidget {
  const ManageUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Provider.of<UsersViewModel>(context,listen: false).getAllUsers(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<UserModel> categories= snapshot.data!;
            return ListView(
              children: List.generate(categories.length, (index) {
                UserModel user = categories[index];
                return ListTile(
                  title: Text(user.name),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                int? sendSuccess = await NotificationApiService
                    .sendNotificationToUser(
                fcmToken: user.fcmToken,
                message: "Salom",
                );
                print("NOTIF SUCESS:$sendSuccess");
                },
                            icon: const Icon(Icons.notification_add)),
                      ],
                    ),
                  ),
                );
              }),
            );
          }
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white

          );
        },
      ),
    );
  }
}
