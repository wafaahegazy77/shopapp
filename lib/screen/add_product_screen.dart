import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/product.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);
  static const routeName = '/add_product_screen';
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isFirst = true;
  Map<String, dynamic>? _args;
  Product prod =
      Product(id: '', title: '', description: '', imgUrl: '', price: 0);

  void onSaved() {
    if (!_formKey.currentState!.validate()) {
      return; //Means Stop this function
    }
    _formKey.currentState!.save();
    Provider.of<Products>(context, listen: false).addProduct(
      title: prod.title,
      price: prod.price,
      description: prod.description,
      imgUrl: prod.imgUrl,
    );
    Navigator.pop(context);
  }

  @override
  void didChangeDependencies() {
    if (_isFirst) {
      _args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
      if (_args != null) {
        Product _existedProd = Provider.of<Products>(context, listen: false)
            .findById(_args!['id']);
        prod = _existedProd;
      }
      _isFirst = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // _formKey.currentState.initState();

    return Scaffold(
      appBar: AppBar(
        title: Text(_args == null ? 'Add Product' : 'Edit Product'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  TextFormField(
                    initialValue: prod.title,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Product title can not be empty';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      prod.title = val!;
                    },
                  ),
                  TextFormField(
                    initialValue: prod.price.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Price',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Product Price can not be empty';
                      } else if (double.parse(val) <= 0) {
                        return 'Please enter valid price';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      prod.price = double.parse(val!);
                    },
                  ),
                  TextFormField(
                    initialValue: prod.description,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Product description can not be empty';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      prod.description = val!;
                    },
                  ),
                  TextFormField(
                    initialValue: prod.imgUrl,
                    decoration: const InputDecoration(
                      labelText: 'Image URL',
                    ),
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Product description can not be empty';
                      } else if (!val.startsWith('http')) {
                        return 'Please enter a valid URL';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      prod.imgUrl = val!;
                    },
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: onSaved,
            child: Text(_args == null ? 'Add Product' : 'Edit Product'),
            color: Colors.deepPurple,
            minWidth: double.infinity,
            height: 50,
          ),
        ],
      ),
    );
  }
}
