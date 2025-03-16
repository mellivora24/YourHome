import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:yourhome_web/screen/login/provider/login_notifier.dart';

class ProviderSetup {
  static List<SingleChildWidget> getProviders() {
    return [
      ChangeNotifierProvider(create: (_) => LoginNotifier()),
      // Thêm các Provider khác ở đây
    ];
  }
}
