import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hookup4u2/common/constants/colors.dart';
import 'package:hookup4u2/features/chat/domain/models/chat_message.dart';
import 'package:provider/provider.dart';
import '../../../../common/providers/theme_provider.dart';
import '../../../../common/utils/custom_toast.dart';

class SenderMessage extends StatelessWidget {
  const SenderMessage({super.key, required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return GestureDetector(
      onLongPress: () {
        Clipboard.setData(ClipboardData(text: message.message));
        CustomToast.showToast('Message Copied'.tr().toString());
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          width: MediaQuery.of(context).size.width * 0.65,
          // margin: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0, right: 10),
          decoration: BoxDecoration(
              color: themeProvider.isDarkMode
                  ? secondaryColor.withOpacity(.5)
                  : primaryColor.withOpacity(.1),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                message.message,
                style: TextStyle(
                  color:
                      themeProvider.isDarkMode ? Colors.white : Colors.black87,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    message.formattedTime,
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ],
          )),
    );
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.end,
    //   children: <Widget>[
    //     Container(
    //       child: documentSnapshot.get('image_url') != ''
    //           ? InkWell(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.end,
    //                 children: <Widget>[
    //                   Container(
    //                     margin: const EdgeInsets.only(top: 2.0, bottom: 2.0, right: 15),
    //                     height: 150,
    //                     width: 150.0,
    //                     color: secondaryColor.withOpacity(.5),
    //                     padding: const EdgeInsets.all(5),
    //                     child: Stack(
    //                       children: <Widget>[
    //                         CustomCNImage(
    //                           fit: BoxFit.fitWidth,
    //                           height: MediaQuery.of(context).size.height * .65,
    //                           width: MediaQuery.of(context).size.width * .9,
    //                           imageUrl: documentSnapshot.get('image_url') ?? '',
    //                         ),
    //                         Container(
    //                           alignment: Alignment.bottomRight,
    //                           child: documentSnapshot.get('isRead') == false
    //                               ? Icon(
    //                                   Icons.done,
    //                                   color: secondaryColor,
    //                                   size: 15,
    //                                 )
    //                               : Icon(
    //                                   Icons.done_all,
    //                                   color: primaryColor,
    //                                   size: 15,
    //                                 ),
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.only(right: 10),
    //                     child: Text(
    //                         documentSnapshot.get('time') != null
    //                             ? DateFormat.yMMMd('en_US')
    //                                 .add_jm()
    //                                 .format(documentSnapshot.get('time').toDate())
    //                                 .toString()
    //                             : "",
    //                         style: TextStyle(
    //                           color: secondaryColor,
    //                           fontSize: 13.0,
    //                           fontWeight: FontWeight.w600,
    //                         )),
    //                   )
    //                 ],
    //               ),
    //               onTap: () {
    //                 Navigator.pushNamed(context, RouteName.largeImageScreen,
    //                     arguments: documentSnapshot.get('image_url'));
    //               },
    //             )
    //           : GestureDetector(
    //               onLongPress: () {
    //                 Clipboard.setData(ClipboardData(text: message.text));
    //                 CustomToast.showToast('Message Copied'.tr().toString());
    //               },
    //               child: Container(
    //                   padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    //                   width: MediaQuery.of(context).size.width * 0.65,
    //                   margin: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0, right: 10),
    //                   decoration: BoxDecoration(
    //                       color: themeProvider.isDarkMode
    //                           ? secondaryColor.withOpacity(.5)
    //                           : primaryColor.withOpacity(.1),
    //                       borderRadius: BorderRadius.circular(15)),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: <Widget>[
    //                       Text(
    //                         documentSnapshot.get('text'),
    //                         style: TextStyle(
    //                           color: themeProvider.isDarkMode ? Colors.white : Colors.black87,
    //                           fontSize: 16.0,
    //                           fontWeight: FontWeight.w400,
    //                         ),
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.end,
    //                         children: <Widget>[
    //                           Text(
    //                             documentSnapshot.get('time') != null
    //                                 ? DateFormat.MMMd('en_US')
    //                                     .add_jm()
    //                                     .format(documentSnapshot.get('time').toDate())
    //                                     .toString()
    //                                 : "",
    //                             style: TextStyle(
    //                               color: secondaryColor,
    //                               fontSize: 13.0,
    //                               fontWeight: FontWeight.w600,
    //                             ),
    //                           ),
    //                           const SizedBox(
    //                             width: 5,
    //                           ),
    //                           documentSnapshot.get('isRead') == false
    //                               ? Icon(
    //                                   Icons.done,
    //                                   color: secondaryColor,
    //                                   size: 15,
    //                                 )
    //                               : Icon(
    //                                   Icons.done_all,
    //                                   color: primaryColor,
    //                                   size: 15,
    //                                 )
    //                         ],
    //                       ),
    //                     ],
    //                   )),
    //             ),
    //     ),
    //   ],
    // );
  }
}