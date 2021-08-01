import 'package:flutter/material.dart';
import 'package:wtt_test_app/utils/strings.dart';
import 'package:wtt_test_app/utils/styles.dart';

enum LoginService { facebook, google, instagram }

extension IconImages on LoginService {
  Image get image {
    switch (this) {
      case LoginService.facebook:
        return Image(image: AssetImage(kFacebookIconPath));
      case LoginService.google:
        return Image(image: AssetImage(kGoogleIconPath));
      case LoginService.instagram:
        return Image(image: AssetImage(kInstagramIconPath));
      default:
        return throw Exception("Неизвестная иконка");
    }
  }

  String get name {
    switch (this) {
      case LoginService.facebook:
        return "Facebook";
      case LoginService.google:
        return "Google";
      case LoginService.instagram:
        return "Instagram";
      default:
        return throw Exception("Неизвестное имя");
    }
  }
}

class ServiceButton extends StatelessWidget {
  final LoginService service;
  final String actionType;

  const ServiceButton(
      {Key? key, required this.service, required this.actionType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () {},
          style: Theme.of(context)
              .elevatedButtonTheme
              .style!
              .copyWith(backgroundColor: kServiceButtonColor),
          child: Row(
            children: [
              _serviceIconContainer(service),
              Expanded(
                child: Center(
                  child: Text("$actionType with ${service.name}"),
                ),
              )
            ],
          )),
    );
  }
}

Widget _serviceIconContainer(LoginService service) => Container(
    width: kServiceButtonIconWidth,
    height: kServiceButtonIconHeight,
    margin: kMediumButtonLeftMargin,
    child: FittedBox(
      fit: BoxFit.cover,
      child: service.image,
    ));
