import 'package:infinimesh_timeseries_app/app/constant/storage.dart';
import 'package:infinimesh_timeseries_app/app/models/panel_model.dart';
import 'package:http/http.dart' as http;

class DashboardRepositories {
  static var client = http.Client();
  Future<List<Panels>> getPanels() async {
    List<Panels> panel = [];

    String? serverEndpoint =
        (box.read('endpoint') != null) ? box.read('endpoint') : null;
    String? apiKey = (box.read('apiKey') != null) ? box.read('apiKey') : null;
    if (serverEndpoint != null && apiKey != null) {
      final uri = Uri.parse('$serverEndpoint/api/search?query=%');
      final response = await client.get(uri, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      });
      panel = panelsFromJson(response.body);
    }

    return panel;
  }

  Future postLogout() async {
    String? serverEndpoint =
        (box.read('endpoint') != null) ? box.read('endpoint') : null;
    String? apiKey = (box.read('apiKey') != null) ? box.read('apiKey') : null;
    if (serverEndpoint != null && apiKey != null) {
      final uri = Uri.parse('$serverEndpoint/api/admin/settings');
      final response = await client.get(uri, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      });
      print(response.body);
    }
  }
}
