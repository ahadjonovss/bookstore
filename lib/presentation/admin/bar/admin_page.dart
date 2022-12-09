
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopee/components/widgets/animated_snackbar.dart';
import 'package:shopee/data/models/category_model.dart';
import 'package:shopee/presentation/admin/bar/tabs/manage_categories_page.dart';
import 'package:shopee/presentation/admin/bar/tabs/manage_products_page.dart';
import 'package:shopee/presentation/admin/bar/tabs/manage_users_page.dart';
import 'package:shopee/view_models/admin/categories_view_model.dart';

class AdminPage extends StatelessWidget {
  AdminPage({Key? key}) : super(key: key);

  int currentPage = 0;
  TextEditingController categoryController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    List pages = [
      ManageCategoriesPage(),
      ManageProductsPage(),
      ManageUsersPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Page"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(context: context, builder: (context) => Dialog(
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
                        const Text("Create a Category",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
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
                                decoration:  const InputDecoration(
                                    hintText: "Enter the name of new Category",
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(onPressed: (){Navigator.pop(context);}, child: const  Text("Cancel",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600,fontSize: 20),)),
                                TextButton(onPressed: () async {
                                  if(categoryController.text.length<5){
                                    MySnackBar(context, notification: "Name of Category must include\ncharacters more than 5", color: Colors.red, icon: const Icon(Icons.warning,color: Colors.white,));
                                  }
                                  else{
                                    CategoryModel category=CategoryModel(categoryName: categoryController.text, docId: '');
                                    await context.read<CategoriesViewModel>().addCategory(category);
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
                                    // ignore: use_build_context_synchronously
                                    MySnackBar(context, notification: "New category created successfully!", color: Colors.green, icon: const Icon(Icons.info_rounded,color: Colors.white,));
                                  }
                                }, child: const Text("Save",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600,fontSize: 20),))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.verified_user), label: ""),
        ],
      ),
    );
  }
}
