import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:money_buddy_mobile/controllers/document_feed_controller.dart';
import 'package:money_buddy_mobile/ui/empty_splash_page.dart';
import 'package:money_buddy_mobile/widgets/progress_indicators.dart';

class DocumentFeed extends StatelessWidget {
  const DocumentFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    /// Get controllers
    final DocumentFeedController _docFeedController =
        Get.put(DocumentFeedController());

    return Obx(
      () => _docFeedController.docs.value != null
          ? _docFeedController.docs.value!.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: _mediaQuery.size.height * 0.02),
                  itemCount: _docFeedController.docs.value!.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            _docFeedController.docs.value![index].photoUrl),
                      ),
                      title: Text(_docFeedController.docs.value![index].name),
                      subtitle: Text(
                          _docFeedController.docs.value![index].description),
                    );
                  },
                )
              : EmptySplashPage(
                  iconData: FontAwesomeIcons.trophy,
                  title: 'No Loyalty Cards',
                  subtitle: "Start earning trophies by ordering "
                      "with your friends!",
                )
          : Center(child: circularProgressIndicator(context: context)),
    );
  }
}
