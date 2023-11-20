import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(String url) async {
  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

Future<void> sendEmail(String email) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: email,
    query: 'subject=Quizify App&body=', //add subject and body here
  );

  if (await canLaunchUrl(params)) {
    await launchUrl(params);
  } else {
    throw 'Could not launch $params';
  }
}

Future<void> callMe(String phoneNumber) async {
  final Uri params = Uri(
    scheme: 'tel',
    path: phoneNumber,
    //add subject and body here
  );
  if (await canLaunchUrl(params)) {
    await launchUrl(params);
  } else {
    throw 'Could not launch $params';
  }
}
