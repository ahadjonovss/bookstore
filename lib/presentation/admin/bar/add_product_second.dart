import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopee/components/routes/app_routes.dart';
import 'package:shopee/data/models/book_model.dart';
import 'package:shopee/data/services/file_uploader.dart';

// ignore: must_be_immutable
class AddImagesToProduct extends StatefulWidget {
  Book newBook;
  AddImagesToProduct({required this.newBook, Key? key}) : super(key: key);

  @override
  State<AddImagesToProduct> createState() => _AddImagesToProductState();
}

class _AddImagesToProductState extends State<AddImagesToProduct> {
  final ImagePicker _picker = ImagePicker();
  String imageUrl = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController imgctrl = TextEditingController();
  bool isHasPhoto = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Images'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                      child: const TabBar(
                          indicator: BoxDecoration(color: Colors.transparent),
                          tabs: [
                            Tab(
                              child: Text("Photo from Internet"),
                            ),
                            Tab(
                              child: Text("Photo from Gallery/Camera"),
                            ),
                          ]),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      height: 260,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.orange),
                          borderRadius: BorderRadius.circular(8)),
                      child: TabBarView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                const Text(
                                  "Paste url for main image of the book",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                isHasPhoto
                                    ? InkWell(
                                        onTap: () {
                                          setState(() {
                                            isHasPhoto = false;
                                          });
                                        },
                                        child: Container(
                                          height: 60,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                'Main Image',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Form(
                                        key: _formKey,
                                        child: TextFormField(
                                          validator: (value) {
                                            if (Uri.parse(value!).isAbsolute ==
                                                false) {
                                              return "Invalid url";
                                            } else {
                                              return null;
                                            }
                                          },
                                          controller: imgctrl,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder()),
                                        ),
                                      ),
                                Visibility(
                                    visible: !isHasPhoto,
                                    child: GestureDetector(
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          widget.newBook.mainImage =
                                              imgctrl.text;
                                          isHasPhoto = true;
                                          setState(() {});
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.036,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.32),
                                        height: 40,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Center(
                                            child: Text(
                                          "Save",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                const Text(
                                  "Select an image for main image of the book",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                isHasPhoto
                                    ? InkWell(
                                        onTap: () {
                                          setState(() {
                                            isHasPhoto = false;
                                          });
                                        },
                                        child: Container(
                                          height: 60,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                'Main Image',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : InkWell(
                                  onTap: (){
                                    _showPicker(context);
                                    print(imageUrl);
                                  },
                                        child: Container(
                                          height: 60,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(
                                                Icons.photo,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                'Select',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                Visibility(
                                    visible: !isHasPhoto,
                                    child: GestureDetector(
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          widget.newBook.mainImage =
                                              imgctrl.text;
                                          isHasPhoto = true;
                                          setState(() {});
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.036,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.32),
                                        height: 40,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Center(
                                            child: Text(
                                          "Save",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                    )),
                                Visibility(
                                  visible: isHasPhoto,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.036,
                                          left: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.32),
                                      height: 40,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                          BorderRadius.circular(4)),
                                      child: const Center(
                                          child: Text(
                                            "Next",
                                            style: TextStyle(color: Colors.white),
                                          )),
                                    ) )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            Visibility(
                visible: isHasPhoto,
                child: InkWell(
                  onTap: (){
                    if(widget.newBook.mainImage.isNotEmpty){
                      Navigator.pushNamed(context, RouteName.addAllImagesToProduct,arguments: widget.newBook);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context)
                            .size
                            .height *
                            0.036,
                        left: MediaQuery.of(context)
                            .size
                            .height *
                            0.32),
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                        BorderRadius.circular(4)),
                    child: const Center(
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ) )
          ],
        ),
      ),
    );
  }


void _showPicker(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text("Gallery"),
                  onTap: () {
                    _getFromGallery();
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _getFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      });
}

_getFromGallery() async {
  XFile? pickedFile = await _picker.pickImage(
    maxWidth: 1000,
    maxHeight: 1000,
    source: ImageSource.gallery,
  );
  if (pickedFile != null) {
    if (!mounted) return;
    imageUrl = await FileUploader.imageUploader(pickedFile);
    setState(() {});
  }
}

_getFromCamera() async {
  XFile? pickedFile = await _picker.pickImage(
    maxWidth: 1920,
    maxHeight: 2000,
    source: ImageSource.camera,
  );
  if (pickedFile != null) {
    if (!mounted) return;
    imageUrl = await FileUploader.imageUploader(pickedFile);
    setState(() {});
  }
}
}

