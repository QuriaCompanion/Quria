// import 'package:flutter/material.dart';
// import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
// import 'package:oauth2/oauth2.dart' as oauth2;

// class LoginService {
 
//   void authorizeClick(BuildContext context) async {
//     try {
//       String clientId = BungieApiService.clientId!;
//       final authorizationEndpoint = Uri.parse(
//           "https://www.bungie.net/fr/OAuth/Authorize?client_id=$clientId&response_type=code");
//       final tokenEndpoint =
//           Uri.parse("https://www.bungie.net/Platform/App/OAuth/Token/");
//       var grant = oauth2.AuthorizationCodeGrant(
//           clientId, authorizationEndpoint, tokenEndpoint,
//           secret: BungieApiService.clientSecret);

//       if (await canLaunch(authorizationEndpoint.toString())) {
//         await launch(authorizationEndpoint.toString());
//       }

//       final streamlink =
//       final redirectUrl = Uri.parse('https://quriacompanion.app');
//       Navigator.pushNamed(context, routeProfile);
//     } on OAuthException catch (e) {
//       bool isIOS = Platform.isIOS;
//       String platformMessage =
//           "If this keeps happening, please try to login with a mainstream browser.";
//       if (isIOS) {
//         platformMessage =
//             "Please dont open the auth process in another safari window, this could prevent you from getting logged in.";
//       }
//     //   showDialog(
//     //       context: context,
//     //       builder: (context) => AlertDialog(
//     //             actions: <Widget>[
//     //               MaterialButton(
//     //                 textColor: Colors.blueGrey.shade300,
//     //                 child: const Text("OK"),
//     //                 onPressed: () {
//     //                   Navigator.of(context).pop();
//     //                 },
//     //               )
//     //             ],
//     //             title: Text(e.error),
//     //             content: Container(
//     //                 padding: const EdgeInsets.all(16),
//     //                 child: Column(mainAxisSize: MainAxisSize.min, children: [
//     //                   Text(
//     //                     e.errorDescription ?? "error",
//     //                     textAlign: TextAlign.center,
//     //                   ),
//     //                   Text(
//     //                     platformMessage,
//     //                     textAlign: TextAlign.center,
//     //                   )
//     //                 ])),
//     //           ));
//     // }
//     // WidgetsBinding.instance!.renderView.automaticSystemUiAdjustment = false;
//     // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//     //     statusBarColor: Colors.transparent,
//     //     statusBarBrightness: Brightness.dark));
//   }

//   authCode(String code) async {
//     try {
//       await widget.auth.requestToken(code);
//       checkMembership();
//     } catch (e) {
//       inspect(e);
//     }
//   }

//   void checkMembership() async {
//     GroupUserInfoCard? membership = await widget.account.getMembership();
//     if (membership == null) {
//       showSelectMembership();
//     }
//     loadProfile();
//   }

//   loadProfile() async {
//     await widget.profile.loadProfile();
//   }

//   void showSelectMembership() async {
//     UserMembershipData? membershipData = await widget.api.getMemberships();

//     if (membershipData?.destinyMemberships?.length == 1) {
//       await widget.account.saveMembership(
//           membershipData!, membershipData.destinyMemberships![0].membershipId!);
//       await loadProfile();
//     }
//   }

//   void yannisooLogin() async {
//     final AuthService auth = AuthService();
//     final AccountService account = AccountService();
//     final ProfileService profile = ProfileService();
//     BungieNetToken token = BungieNetToken.fromJson({
//       'access_token':
//           'CMraAxKGAgAg7dI+0TkMGh2uh5L3BF4tvx/zOmVisBiea6PBQf/lm4zgAAAAnCkNEwBf6Lsvtc6BbSSDmCObyW6vaLiISD453n7Fyy9nbQxiCwK5DqyxBCbsyjiEGe1OZBkiDKwQ345UObPGivziNHHOFaSo9tele6rSu8WqILkkfajnmABN5W3/VNHfkauDmocu4IPBa7ObnHwCQhJ3X0cshmisE+M5UqisIYy3ppOrfHqGnNxxsX5/P1LsjR0Vc8cd1W6eaDZoSAOHlMedKs/XkwIYPOUFcDQChqWk1JdxFaVJ/ycQCG641FDdnS6qfikNvgC6vwaZm6JkkxcrmBQMHNpcr40Z+IJ5oOo=',
//       'expires_in': 3600,
//       'refresh_token':
//           'CMraAxKGAgAgQpzRp7QWUtRVShDD4ebDYWnMQVHHWl1dnZevpWwv6XPgAAAAyHZqrwzy3ymqmzQAKZY5kqYBEtfU1BPAJq19gbF486zsq+lWy3CfAwnra/Gpfg6TkjFonIaYpdbSFLdZ/ij+JWsiRefHapizhxjmztiCB2ML8mnhwMYu6Fnm0bOhkjvIq6kKuEkSR0b5Tk0UcvG/x+wPxWjQvBkakujHmzKaraUa+++wU/YuCP6ZuV9p60tXRS8s4PGKAV3RKHSppsC/pxYHs00lShOd/EJcA5jeCwC6pBFdbUv7mOuTaK4Nk/aQkCzuKJSI5GnawJCMw/VXkwHBAWwb9svUsIBOygOXO0o=',
//       'refresh_expires_in': 3600,
//       'membership_id': '11319478',
//     });

//     if (await auth.getToken() == null) await auth.saveToken(token);
//     await account.getMembership();
//     await profile.loadProfile();
//     Navigator.pushNamed(context, routeProfile);
//   } 
// }