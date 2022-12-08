import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopee/components/widgets/animated_snackbar.dart';
import 'package:shopee/data/models/category_model.dart';
import 'package:shopee/view_models/admin/categories_view_model.dart';

class ManageCategoriesPage extends StatelessWidget {
  const ManageCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController categoryController=TextEditingController();

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
                              showDialog(context: context, builder: (context) {
                                return  Dialog(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.245,
                                    width: MediaQuery.of(context).size.width*0.8,
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  [
                                        const Text("Edit Category",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                        SizedBox(height: MediaQuery.of(context).size.height*0.028,),
                                        Column(
                                          children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color: Colors.black)
                                          ),
                                          padding: const EdgeInsets.only(left: 12),
                                          child:  TextField(
                                            controller: categoryController,
                                            decoration:  InputDecoration(
                                              hintText: category.categoryName,
                                              border: InputBorder.none
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancel",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600,fontSize: 20),)),
                                            TextButton(onPressed: () async {
                                              if(categoryController.text.length<5){
                                                MySnackBar(context, notification: "Name of Category must include\ncharacters more than 5", color: Colors.red, icon: Icon(Icons.warning,color: Colors.white,));
                                              }
                                              else{
                                                category.categoryName=categoryController.text;
                                                await context.read<CategoriesViewModel>().updateCategory(category.docId!, category);
                                                Navigator.pop(context);
                                                MySnackBar(context, notification: "Name of category changed succesfully!", color: Colors.green, icon: Icon(Icons.info_rounded,color: Colors.white,));

                                              }


                                            }, child: Text("Save",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600,fontSize: 20),))
                                          ],
                                        )



                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              );

                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () async {
                              await context.read<CategoriesViewModel>().deleteByDocId(category.docId!);


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



