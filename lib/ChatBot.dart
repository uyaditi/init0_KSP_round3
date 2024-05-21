import 'package:kj/services/constants.dart';
import 'feature_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:rive_animation/constants.dart';
// import 'package:rive_animation/screens/prompt_input_screen/components/feature_list_item.dart';
import 'message_baloon.dart';
import 'services/api_service.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  final openAIAPI = OpenAIAPI();
  final scrollController = ScrollController();
  final textEditingController = TextEditingController();

  String? generatedContent;
  String? generatedImageUrl;
  String? searchText;
  int animDelay = 129;
  List<MessageBaloon> messageList = <MessageBaloon>[];

  void clearInputBox() {
    setState(() {
      searchText = ''; // Clear the text
      controller.clear(); // Clear the text field controller
    });
  }

  void scrollDown() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  void getAnswer() async {
    Future.delayed(const Duration(milliseconds: 392), () {
      setState(() {
        scrollDown();
      });
    });

    setState(() {});
    final searchTextRes = await openAIAPI.makeAPICall(prompt: searchText!);
    if (searchTextRes.contains('http')) {
      generatedImageUrl = searchTextRes;
      generatedContent = null;
      messageList.add(MessageBaloon(
        backgroundColor: bg_light_grey1,
        imageUrl: generatedImageUrl,
        isAI: true,
        text: '',
      ));
      setState(() {
        scrollDown();
      });
    } else {
      generatedContent = searchTextRes;
      generatedImageUrl = null;
      setState(() {});
      messageList.add(MessageBaloon(
        backgroundColor: darker_grey,
        isAI: true,
        text: generatedContent!,
      ));
      scrollDown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bg_light_grey1,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text(
          'Karnataka State Police',
          style: TextStyle(
              color: darkest_grey,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: mf),
        ),
      ),
      backgroundColor: bg_light_grey1,
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: DecoratedBox(
          decoration: const BoxDecoration(
              color: bg_light_grey1,
              image: DecorationImage(
                  image: AssetImage('assets/bakcgroundSeamless.png'),
                  fit: BoxFit.cover,
                  opacity: 0.5)),
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.only(bottom: 129),
                child: Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 14.0, right: 14, left: 14),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          const FeatureListItem(
                            backgroundColor: darkest_grey,
                            titleText: 'Your Easy Legal Guide:)',
                            descriptionText:
                                "Try `how to file a FIR` or `how to get a police report`",
                          ),
                          Column(
                            children: messageList,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(bottom: 20),
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontFamily: mf, color: lightest_green),
                        onTap: () => scrollController.animateTo(
                            scrollController.position.maxScrollExtent,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease),
                        onTapAlwaysCalled: true,
                        controller: controller,
                        onChanged: (text) {
                          setState(() {
                            searchText = text;
                          });
                        },
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 20.0),
                          filled: true,
                          labelText: "Type a message...",
                          labelStyle: TextStyle(
                              fontSize: 16.0,
                              fontFamily: mf,
                              color: lightest_green),
                          fillColor: darkest_grey,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              borderSide: BorderSide(color: lighter_green)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              borderSide: BorderSide(color: dark_green)),
                        ),
                        cursorColor: lightest_green,
                      ),
                    ),
                    SizedBox(width: 8),
                    FloatingActionButton(
                      onPressed: () async {
                        if (searchText.toString().isNotEmpty &&
                            searchText != null) {
                          messageList.add(MessageBaloon(
                              backgroundColor: dark_green,
                              text: searchText.toString(),
                              isAI: false));
                          getAnswer();
                          clearInputBox();
                        } else {
                          // Use the text from the input box as a prompt for the API call
                          final response = await openAIAPI.makeAPICall(
                              prompt: textEditingController.text);

                          // Process the API response and add it to the messageList
                          messageList.add(MessageBaloon(
                            backgroundColor: dark_green,
                            text: response,
                            isAI: true,
                          ));
                          setState(() {
                            scrollDown();
                          });
                        }
                      },
                      backgroundColor: lighter_green,
                      child: Icon(
                        Icons.send,
                        color: darkest_grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
