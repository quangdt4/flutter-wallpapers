import 'package:flutter/material.dart';
import '../../routes/routes.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final marginWidget = (screenWidth - screenWidth * 0.9) / 2;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black87,
                  size: 24,
                ),
                onPressed: () {
                  AppNavigator.pop();
                },
              ),
              searchBar(),
              const SizedBox(width: 12)
            ],
          ),
        ]),
      ),
    );
  }

  Widget searchBar() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10)),
        child: Align(
          alignment: Alignment.center,
          child: TextField(
            cursorColor: Colors.black87,
            controller: inputController,
            cursorWidth: 1,
            autofocus: true,
            maxLines: 1,
            enableSuggestions: false,
            autocorrect: false,
            onSubmitted: (keyWord) {
              print(keyWord);
              onInputListener(keyWord);
            },
            style: const TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            decoration: const InputDecoration.collapsed(
              border: InputBorder.none,
              hintText: 'Search',
            ),
          ),
        ),
      ),
    );
  }

  onInputListener(String keyWord) {}
}
