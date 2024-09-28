import 'package:flutter/foundation.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';

class BottomBarProvider with ChangeNotifier {
  List<SMIInput<bool>?> inputs = [];
  List<Artboard> artboards = [];
  bool isLoading = true;

  int _currentActiveIndex = 0; // Start with the first tab (index 0) as active
  int get currentActiveIndex => _currentActiveIndex;

  Future<void> initializeArtboard() async {
    List<String> assetPaths = [
      "assets/animations/home.riv",
      "assets/animations/doctor.riv",
      "assets/animations/chat.riv",
    ];

    try {
      for (int i = 0; i < assetPaths.length; i++) {
        final data = await rootBundle.load(assetPaths[i]);
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;

        final controller =
            StateMachineController.fromArtboard(artboard, "State Machine 1");

        SMIInput<bool>? input;
        if (controller != null) {
          artboard.addController(controller);
          input = controller.findInput<bool>("isactive");

          // Set 0th index (Home) to active and the rest to inactive
          if (i == 0) {
            input!.value = false; // Active for Home tab
          } else {
            input!.value = true; // Inactive for others
          }
        }
        inputs.add(input);
        artboards.add(artboard);
      }
      isLoading = false; // Mark the loading as done
      notifyListeners(); // Notify listeners to update the UI
    } catch (e) {
      // Handle error (print to console, log, etc.)
      print("Error loading Rive assets: $e");
    }
  }

  void updateAnimation(int index) {
    if (index == currentActiveIndex) return;

    if (index == 4) {
      for (var input in inputs) {
        input!.value = true;
      }
      _currentActiveIndex = index;
      notifyListeners();
    } else {
      // Set the current active item to inactive
      for (var input in inputs) {
        input!.value = true;
      }

      // Set the new active item to active
      inputs[index]?.value = false;

      _currentActiveIndex = index;
      notifyListeners();
    }
  }
}
