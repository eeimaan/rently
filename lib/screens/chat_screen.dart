import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomChatAppBar(
        characterImage: AppImages.characterImage,
        titleName: 'Brooklyn Simmons',
        status: 'Online',
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChatUserContainer(
                    message: 'What do you mean?',
                    time: '11:02PM',
                  ),
                  ChatContainer(
                    message:
                        'I think the idea that things are\nchanging isn’t good',
                    time: '11:02PM',
                  ),
                  ChatUserContainer(
                    message: 'Is the property still available',
                    time: '11:02PM',
                  ),
                  ChatContainer(
                    message:
                        'I think the idea that things are\nchanging isn’t good',
                    time: '11:02PM',
                    image: AppImages.roomImage,
                  ),
                  CustomSize(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomContainer(
              decoration: const BoxDecoration(color: AppColors.paleAqua),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CustomSize(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    AppImages.camIcon,
                    width: 24,
                    height: 24,
                  ),
                  const CustomSize(
                    width: 10,
                  ),
                  CustomTextField(
                    height: 45,
                    width: mq.width * 0.69,
                    hintText: 'Type a message',
                    fillColor: AppColors.white,
                    borderColor: AppColors.pastelBlue,
                    borderRadius: 12,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        AppImages.emojiIcon,
                      ),
                    ),
                  ),
                  const CustomSize(
                    width: 10,
                  ),
                  CustomContainer(
                    width: mq.width * 0.11,
                    height: mq.height * 0.05,
                    shapeDecoration: BoxDecoration(
                      color: AppColors.turquoise,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        AppImages.sendIcon,
                        width: 14,
                        height: 14,
                      ),
                    ),
                  ),
                  const CustomSize(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
