import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_buddy_mobile/config/ui_helpers.dart';
import 'package:money_buddy_mobile/controllers/upload_document_controller.dart';
import 'package:money_buddy_mobile/widgets/custom_clippers/curved_design.dart';
import 'package:money_buddy_mobile/widgets/elongated_button.dart';
import 'package:money_buddy_mobile/widgets/text_form_field.dart';

class UploadDocumentPage extends StatelessWidget {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();

  UploadDocumentPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    /// GetX controllers
    final UploadDocumentController _uploadDocumentController =
        Get.put(UploadDocumentController());

    Widget _buildAddImageSection() {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: _mediaQuery.size.width * 0.10),
        child: GestureDetector(
          onTap: () => _uploadDocumentController.selectImageGallery(),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: GetBuilder<UploadDocumentController>(
              init: UploadDocumentController(),
              builder: (controller) => controller.selectedImage == null
                  ? Text(
                      'Tap to add image',
                      style: TextStyle(color: Colors.grey[400]),
                    )
                  : Image.file(controller.selectedImage!),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColour,
        elevation: 0.0,
        centerTitle: false,
        title: Text(
          'Upload document',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 25.0,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Stack(
        children: [
          CurvedDesign(),
          SingleChildScrollView(
            child: Column(
              children: [
                _buildAddImageSection(),
                SizedBox(height: _mediaQuery.size.height * 0.05),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _mediaQuery.size.width * 0.10),
                  child: CustomTextFormField(
                    header: 'Name',
                    hintText: 'Name it...',
                    textEditingController: _nameTextController,
                    textInputType: TextInputType.text,
                  ),
                ),
                SizedBox(height: _mediaQuery.size.height * 0.05),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _mediaQuery.size.width * 0.10),
                  child: CustomTextFormField(
                    header: 'Description',
                    hintText: 'Describe it...',
                    textEditingController: _descriptionTextController,
                    textInputType: TextInputType.text,
                  ),
                ),
                SizedBox(height: _mediaQuery.size.height * 0.03),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _mediaQuery.size.width * 0.10,
          vertical: _mediaQuery.size.height * 0.05,
        ),
        child: ElongatedButton(
          text: 'Upload',
          onPressed: () async {
            if (_descriptionTextController.text.isNotEmpty &&
                _nameTextController.text.isNotEmpty &&
                _uploadDocumentController.selectedImage != null) {
              _uploadDocumentController.uploadDocumentEntry(
                name: _nameTextController.text,
                description: _descriptionTextController.text,
              );

              Get.back();

              Get.snackbar(
                'Success'.tr,
                'Your Review has been uploaded!',
                snackPosition: SnackPosition.BOTTOM,
                duration: Duration(seconds: 5),
                backgroundColor: Colors.green,
                colorText: Get.theme.snackBarTheme.actionTextColor,
              );
            } else {
              Get.snackbar(
                'Could not list your Review'.tr,
                'There were fields left blank. Please fill them in and try again!',
                snackPosition: SnackPosition.BOTTOM,
                duration: Duration(seconds: 5),
                backgroundColor: Colors.red,
                colorText: Get.theme.snackBarTheme.actionTextColor,
              );
            }
          },
          buttonColour: kPrimaryColour,
          textColour: Colors.white,
        ),
      ),
    );
  }
}
