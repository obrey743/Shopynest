import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PostItemPage extends StatefulWidget {
  @override
  _PostItemPageState createState() => _PostItemPageState();
}

class _PostItemPageState extends State<PostItemPage> {
  final TextEditingController _descriptionController = TextEditingController();
  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }
  
  void _postItem() {
    // Implement the logic to post the item to your database
    String description = _descriptionController.text;
    // Image file: _image
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            _image == null
                ? Text('No image selected.')
                : Image.file(File(_image!.path)),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _postItem,
              child: Text('Post Item'),
            ),
          ],
        ),
      ),
    );
  }
}
