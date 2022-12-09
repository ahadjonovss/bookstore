import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  // String dateOfPublish;
  TextEditingController description = TextEditingController();

  // String mainImage;
  TextEditingController mainImage = TextEditingController();

  // List<String> images;
  TextEditingController count = TextEditingController();

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
                      if (value!.length < 100) {
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
                AddBookInput(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "You have to enter url for main image of the book";
                    } else {
                      return null;
                    }
                  },
                  controller: mainImage,
                  hintText: "Enter url for main image of the book",
                  label: "Main Image",
                ),
                ExpansionTile(
                  key: _formKey,
                  title: const Text("Category"),
                  children: [
                    StreamBuilder(
                      stream: context.read<CategoriesViewModel>().categories,
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => InkWell(
                                onTap: (){
                                  // _formKey.currentState.collapse();

                                },
                                child: Container(
                            padding: const EdgeInsets.all(2),
                           margin: const EdgeInsets.all(4),
                            height: 40,child: Text(snapshot.data![index].categoryName),),
                              ));
                        }
                        return Container();
                      },
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {
                      _formKey.currentState!.validate();
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
