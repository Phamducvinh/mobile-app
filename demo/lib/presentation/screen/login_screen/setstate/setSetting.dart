import 'package:flutter/material.dart';

class SettingsModal extends StatefulWidget {
  @override
  _SettingsModalState createState() => _SettingsModalState();
}

class _SettingsModalState extends State<SettingsModal> {
  bool light = false; // Biến lưu trạng thái của switch

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Switch(
                value: light,
                activeColor: Colors.blue,
                onChanged: (bool value) {
                  // Cập nhật trạng thái của switch
                  setState(() {
                    light = value;
                  });
                },
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Change display',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Language',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.white),
                  )
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                showTerms(context);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Terms and policies',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.white),
                  )
                ],
              ))
        ],
      ),
    );
  }

  void showTerms(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        useRootNavigator: true,
        context: context,
        builder: (builder) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.15,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black, // Màu sắc của đường viền dưới
                          width: 1.0, // Độ rộng của đường viền dưới
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Term and policies',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Welcome to our e-book reading and online book purchasing application! Before using our application, please read and understand the following terms and policies:'
                    'Ownership and Usage Rights:'
                    'This application is a product of developers: Nguyễn Đức Việt, Phạm Đức Vinh, and Vũ Thị Bích Ngọc. All intellectual property rights to the content and features of the application belong to this development team.'
                    'Privacy Policy:'
                    'We are committed to protecting the personal information of users. Any personal information you provide to us will be safeguarded and used only for specific purposes.'
                    'Payments and Transactions:'
                    'All online book purchasing transactions will be processed through secure and reliable payment gateways. We do not store your personal payment information on our system.'
                    'Content and Copyrights:'
                    'All content provided within this application is protected by copyright laws. You are not allowed to copy, distribute, or use the content unlawfully without our permission or the copyright owner\'s consent.'
                    'Feedback and Support:'
                    'If you have any questions, suggestions, or complaints about our application, please contact us through the provided contact information within the application.'
                    'Changes to Terms and Policies:'
                    'We reserve the right to adjust and change our terms and policies without prior notice. Continued use of the application will be considered as your acceptance of those changes.'
                    'Your use of our application signifies your acceptance of all the terms and policies outlined above. Thank you for using our application!',
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          );
        });
  }
}
