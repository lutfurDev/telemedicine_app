import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';
import 'package:telemedicine_app/utils/app_color.dart';
import 'package:telemedicine_app/utils/app_string.dart';
import 'package:telemedicine_app/utils/app_style.dart';
import 'package:uuid/uuid.dart';

import '../utils/app_layout.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../widgets/auth_view_widget.dart';
import '../widgets/custom_spacer.dart';
import '../widgets/custom_text_field.dart';
import 'doctor_list.dart';
//
// class MessageUIScreen extends StatelessWidget {
//   const MessageUIScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body:ChatScreen() ,
//
//     );
//   }
// }
// class ChatScreen extends StatelessWidget {
//   const ChatScreen({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [const SearchDoctorLayout(), sliverToBoxAdapterLayout(context)],
//       ),
//
//     );
//   }
// }
//
// SliverAppBar sliverAppBar(context) {
//   return SliverAppBar(
//     expandedHeight: AppLayout.getHeight(50),
//     elevation: 0,
//     leading: IconButton(
//       onPressed: () => Get.back(),
//       icon: const Icon(Icons.arrow_back_ios),
//     ),
//     title: Text(
//       AppString.text_doctors,
//       style: AppStyle.title_text.copyWith(
//           color: AppColor.normalTextColor,
//           fontSize: Dimensions.fontSizeMid + 2),
//     ),
//     pinned: true,
//     backgroundColor: AppColor.primaryColor,
//     flexibleSpace: FlexibleSpaceBar(
//       background: Image.asset(
//         Images.bg_2,
//         fit: BoxFit.cover,
//       ),
//     ),
//   );
// }
//
// class SearchDoctorLayout extends StatelessWidget {
//   const SearchDoctorLayout({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       expandedHeight: AppLayout.getWidth(40),
//       elevation: 0,
//       leading: Row(
//         children: [
//           customSpacerWidth(width: 20),
//           GestureDetector(
//             onTap: () => Get.back(),
//             child: const Icon(
//               Icons.arrow_back_ios,
//             ),
//           ),
//           customSpacerWidth(width: 12),
//           Text(
//             AppString.text_message.tr,
//             style: AppStyle.title_text.copyWith(
//                 fontSize: Dimensions.fontSizeMid + 1,
//                 color: Theme.of(context).colorScheme.onPrimary),
//           )
//         ],
//       ),
//       leadingWidth: AppLayout.getWidth(400),
//       bottom: _subAppbar(context),
//       pinned: true,
//       backgroundColor: AppColor.primaryColor,
//       flexibleSpace: FlexibleSpaceBar(
//         background: Stack(
//           fit: StackFit.expand,
//           children: [
//             Image.asset(
//               Images.bg_2,
//               fit: BoxFit.cover,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _subAppbar(context) {
//     return PreferredSize(
//       preferredSize: const Size.fromHeight(44),
//       child: Stack(
//         children: [
//           Positioned(
//             bottom: 0,
//             child: Container(
//               height: 40,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                   color: Theme.of(context).backgroundColor,
//                   borderRadius: const BorderRadius.only(
//                       topRight: Radius.circular(20),
//                       topLeft: Radius.circular(20))),
//               padding: const EdgeInsets.only(top: 9, bottom: 0),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 15.0),
//             child: Container(height: 30,),
//           ),
//         ],
//       ),
//     );
//   }
//
// }
//
//
//
// SliverToBoxAdapter sliverToBoxAdapterLayout(context) {
//   return SliverToBoxAdapter(
//     child: SizedBox(
//       height: MediaQuery.of(context).size.height,
//       child: Padding(
//         padding: marginLayout.copyWith(bottom: 0),
//         child: const ViewLayout(),
//       ),
//     ),
//   );
// }






class MessageUIScreen extends StatefulWidget {
  const MessageUIScreen({super.key});

  @override
  State<MessageUIScreen> createState() => _ViewLayoutState();
}

class _ViewLayoutState extends State<MessageUIScreen> {
  final List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cardColor ,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: ()=>Get.back(),
            child: Icon(Icons.arrow_back_ios,color: Theme.of(context).colorScheme.onPrimary,)),
        title: Text(AppString.text_message,style: AppStyle.mid_large_text.copyWith(color: Theme.of(context).colorScheme.onPrimary),),

        backgroundColor: AppColor.primaryColor,elevation: 0,shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(Dimensions.radiusMid),bottomLeft: Radius.circular(Dimensions.radiusMid))
      ),),
      body: Chat(
        messages: _messages,
        user: _user,
        onSendPressed: _handleSendPressed,
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }
}
