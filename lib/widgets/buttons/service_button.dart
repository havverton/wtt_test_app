import 'package:flutter/material.dart';
import 'package:wtt_test_app/strings.dart';
import 'package:wtt_test_app/styles.dart';

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
      height: kMediumButtonHeight,
      decoration: kServiceButtonDecoration,
      child: InkWell(
          onTap: () => {print('lolKek')},
          child: Row(
            children: [
              ServiceIconContainer(service: service),
              Expanded(
                child: Center(
                  child: Text(
                    "$actionType with ${service.name}",
                    style: kLoginServiceButtonTextStyle,
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class ServiceIconContainer extends StatelessWidget {
  final LoginService service;

  const ServiceIconContainer({Key? key, required this.service})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: kServiceButtonIconWidth,
        height: kServiceButtonIconHeight,
        margin: kMediumButtonLeftMargin,
        child: FittedBox(
          fit: BoxFit.cover,
          child: service.image,
        ));
  }
}
