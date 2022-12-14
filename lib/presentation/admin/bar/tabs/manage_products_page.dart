import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopee/presentation/admin/bar/tabs/widgets/edit_category_dialog.dart';
import 'package:shopee/view_models/admin/products_view_model.dart';

import '../../../../data/models/book_model.dart';

class ManageProductsPage extends StatelessWidget {
  const ManageProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Provider.of<ProductsViewModel>(context,listen: false).listenCategories(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<Book> categories= snapshot.data!;
            return ListView(
              children: List.generate(categories.length, (index) {
                Book book = categories[index];
                return ListTile(
                  title: Text(book.name),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              await context.read<ProductsViewModel>().deleteByDocId(book.productId);
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
