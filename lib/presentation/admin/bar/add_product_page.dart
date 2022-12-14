import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopee/components/routes/app_routes.dart';
import 'package:shopee/data/models/book_model.dart';
import 'package:shopee/data/models/category_model.dart';
import 'package:shopee/presentation/admin/bar/widgets/text_form_fields.dart';
import 'package:shopee/view_models/admin/categories_view_model.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // String name;
  TextEditingController name = TextEditingController();

  // String categoryId;
  TextEditingController author = TextEditingController();

  // int price;
  TextEditingController price = TextEditingController();

  // String description;
  TextEditingController description = TextEditingController();

  // String mainImage;
  TextEditingController mainImage = TextEditingController();

  // List<String> images;
  TextEditingController count = TextEditingController();

  TextEditingController dateOfPublish = TextEditingController();

  String choosenCategory='Choose category';
  Book newBook=Book(categoryId: "", productId:  "", name:  "", author:  "", price: "1", dateOfPublish:  "", description:  "", mainImage:  "", images: [], bought: 0, rates: [], category:  "", count: 0);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 12,),
                const Center(child: Text("Add new Book",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                AddBookInput(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "You have to enter name of the book";
                    } else {
                      return null;
                    }
                  },
                  controller: name,
                  hintText: "Enter name of the book",
                  label: "Name",
                ),
                AddBookInput(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "You have to enter author of the book";
                    } else {
                      return null;
                    }
                  },
                  controller: author,
                  hintText: "Enter author of the book",
                  label: "Author",
                ),
                AddBookInput(
                    validator: (String? value) {
                      if (value!.length < 1) {
                        return "Description must include characters more than 100";
                      } else {
                        return null;
                      }
                    },
                    controller: description,
                    hintText: "Enter description of the book",
                    label: "Description",
                    maxLines: 8),
                AddBookInput(
                  validator: (String? value) {
                    if (value!.trim().contains(" ") ||
                        value.contains('-') ||
                        value.contains(',') ||
                        value.isEmpty) {
                      return "Invalid price";
                    } else {
                      return null;
                    }
                  },
                  controller: price,
                  hintText: "Enter price of the book",
                  label: "Price",
                  type: TextInputType.number,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 180,
                      child: TextFormField(
                        controller: dateOfPublish,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          hintText: "Date of Publish",
                          border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    StreamBuilder(
                      stream: context.read<CategoriesViewModel>().categories,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<CategoryModel>? categories=snapshot.data;
                          return DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint:  Text(choosenCategory),
                                items: categories?.map((e) => DropdownMenuItem(
                                    onTap: (){
                                      choosenCategory=e.categoryName;
                                      newBook.categoryId=e.docId!;
                                      setState((){});
                                    },
                                    value: categories,
                                    child: Text(e.categoryName))).toList(),
                                onChanged: (value) {},));
                        }
                        return Container();
                      },
                    ),
                  ],
                ), //category
                GestureDetector(
                  onTap: () {
                    if(_formKey.currentState!.validate()){
                      newBook.price=price.text;
                      newBook.description=description.text;
                      newBook.author=author.text;
                      newBook.name=name.text;
                      newBook.dateOfPublish=dateOfPublish.text;
                      Navigator.pushNamed(context, RouteName.addImagesToProduct,arguments: newBook);

                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.036,left: MediaQuery.of(context).size.height*0.32),
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: const Center(child: Text("Next",style: TextStyle(color: Colors.white),)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
