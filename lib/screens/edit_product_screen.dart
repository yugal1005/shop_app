import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = "/edit-product";
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct =
      Product(description: "", title: "", price: 0, imgUrl: "", id: null);

  @override
  void initState() {
    _imageFocusNode.addListener(_updateImgUrl);
    super.initState();
  }

  void _saveForm() {
    _form.currentState.save();
    print(_editedProduct.description);
    print(_editedProduct.id);
    print(_editedProduct.imgUrl);
    print(_editedProduct.price);
    print(_editedProduct.title);
  }

  void _updateImgUrl() {
    if (!_imageFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _descriptionFocusNode.dispose();
    _priceFocusNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: Icon(Icons.save),
          ),
        ],
        title: Text("Edit Product"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Title"),
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (newValue) {
                  _editedProduct = Product(
                    description: _editedProduct.description,
                    title: newValue,
                    price: _editedProduct.price,
                    imgUrl: _editedProduct.imgUrl,
                    id: _editedProduct.id,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Price"),
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (newValue) {
                  _editedProduct = Product(
                    description: _editedProduct.description,
                    title: _editedProduct.title,
                    price: double.parse(newValue),
                    imgUrl: _editedProduct.imgUrl,
                    id: _editedProduct.id,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Description"),
                ),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (newValue) {
                  _editedProduct = Product(
                    description: newValue,
                    title: _editedProduct.title,
                    price: _editedProduct.price,
                    imgUrl: _editedProduct.imgUrl,
                    id: _editedProduct.id,
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Image Url",
                      ),
                      controller: _imageUrlController,
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      focusNode: _imageFocusNode,
                      onFieldSubmitted: (_) => _saveForm,
                      onSaved: (newValue) {
                        _editedProduct = Product(
                          description: _editedProduct.description,
                          title: _editedProduct.title,
                          price: _editedProduct.price,
                          imgUrl: newValue,
                          id: _editedProduct.id,
                        );
                      },
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 6, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Text("Enter a URL")
                        : FittedBox(
                            child: Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
