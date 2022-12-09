import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopee/components/widgets/animated_snackbar.dart';
import 'package:shopee/data/models/category_model.dart';
import 'package:shopee/view_models/admin/categories_view_model.dart';

// ignore: must_be_immutable
class AddCategoryDialog extends StatelessWidget {
  TextEditingController categoryController;
  AddCategoryDialog({required this.categoryController,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
    );
  }
}
