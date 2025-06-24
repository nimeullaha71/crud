import 'package:crud/style/style.dart';
import 'package:flutter/material.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  Map<String,String>FormValues = {

    "ProductName": "",
    "ProductCode": "",
    "Img": "",
    "Qty": "",
    "UnitPrice": "",
    "TotalPrice": ""
  };

  InputOnChange(MapKey,Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit(){

    if(FormValues['Img']!.length==0){
      ErrorToast('Image Link Required !');
    }
    else if (FormValues['Qty']!.length == 0){
      ErrorToast('Product Quantity Required');
    }
    else if (FormValues['ProductName']!.length == 0){
      ErrorToast('Product Name Required');
    }
    else if (FormValues['ProductCode']!.length == 0){
      ErrorToast('Product Code Required');
    }
    else if (FormValues['UnitPrice']!.length == 0){
      ErrorToast('UnitPrice Required');
    }
    else if (FormValues['TotalPrice']!.length == 0){
      ErrorToast('Total price Required');
    }

    else{

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Product'),
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnChange("ProductName",Textvalue);
                    },
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnChange("ProductCode",Textvalue);
                    },
                    decoration: AppInputDecoration('Product Code'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnChange("Img",Textvalue);
                    },
                    decoration: AppInputDecoration('Product Image'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnChange("UnitPrice",Textvalue);
                    },
                    decoration: AppInputDecoration('Unit Price'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnChange("TotalPrice",Textvalue);
                    },
                    decoration: AppInputDecoration('Total price'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppDropDownStyle(
                    DropdownButton(
                      value: FormValues['Qty'],
                      items: [
                        DropdownMenuItem(
                          child: Text('Select Qty'),
                          value: '',
                        ),
                        DropdownMenuItem(
                          child: Text('1 pcs'),
                          value: '1 pcs',
                        ),
                        DropdownMenuItem(
                          child: Text('2 pcs'),
                          value: '2 pcs',
                        ),
                        DropdownMenuItem(
                          child: Text('3 pcs'),
                          value: '3 pcs',
                        ),
                        DropdownMenuItem(
                          child: Text('4 pcs'),
                          value: '4 pcs',
                        ),
                      ],
                      onChanged: (Textvalue) {
                        InputOnChange("Qty",Textvalue);
                      },
                      isExpanded: true,
                      underline: Container(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child:
                        ElevatedButton(
                            style: AppButtonStyle(),
                            onPressed: () {
                              FormOnSubmit();
                              print('Error message');

                        },
                            child: SuccessButtonChild('Submit')
                        ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
