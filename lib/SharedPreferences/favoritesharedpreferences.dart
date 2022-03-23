import '../data_fetching/articles.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Future saveArticlesSetting(Articles articles) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('title', articles.urlToImage.toString());
    Fluttertoast.showToast(
        msg: "${articles.urlToImage} Saved",
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0
    );
  }
  Future<Articles> getSetting() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? titles = prefs.getString('title');
    return Articles(urlToImage: titles);
  }
  cleanArtical() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
