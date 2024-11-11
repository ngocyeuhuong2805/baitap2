import 'package:flutter/material.dart';
import 'package:learn_getx/models/user_model.dart';

import '../untils/constant.dart';



class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.userModel});

  final UserModel userModel;

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {

  List<Color> colorList = [Colors.black, Colors.white, Colors.cyan];


  Color selectedColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back)),
      title: const Text('Information'),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _inForMations(context),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  const Text(
                    'Chọn màu',
                    style: kContentStyle,
                  ),
                  const SizedBox(width: 10,),
                  DropdownButton<Color>(
                    value: selectedColor,
                    items: colorList.map((color) {
                      return DropdownMenuItem<Color>(
                        value: color,
                        child: Container(
                          width: 100,
                          height: 40,
                          color: color,
                        ),
                      );
                    }).toList(),
                    onChanged: (Color? newColor) {
                      if (newColor != null) {
                        setState(() {
                          selectedColor = newColor;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inForMations(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 160,
          height: 160,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: selectedColor,
            borderRadius: BorderRadius.circular(80),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(75),
            child: Image.network(
              widget.userModel.image,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${widget.userModel.name}',
              style: kContentStyle,
            ),
            const SizedBox(height: 10),
            Text(
              'Age: ${widget.userModel.age}',
              style: kContentStyle,
            ),
            const SizedBox(height: 10),
            Text(
              'Job: ${widget.userModel.job}',
              style: kContentStyle,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}
