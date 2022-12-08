import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopee/data/models/category_model.dart';
import 'package:shopee/view_models/admin/categories_view_model.dart';

class ManageCategoriesPage extends StatelessWidget {
  const ManageCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Provider.of<CategoriesViewModel>(context,listen: false).listenCategories(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<CategoryModel> categories= snapshot.data!;
            return ListView(
              children: List.generate(categories.length, (index) {
                CategoryModel category = categories[index];
                return ListTile(
                  title: Text(category.categoryName),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {

                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {

                            },
                            icon: const Icon(Icons.delete)),
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
            return Center(child: CircularProgressIndicator(),);
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
