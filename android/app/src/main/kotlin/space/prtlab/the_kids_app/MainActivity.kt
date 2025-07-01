package space.prtlab.the_kids_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import space.prtlab.the_kids_app.BuildConfig

class MainActivity : FlutterActivity() {
    private val CHANNEL = "space.prtlab.the_kids_app/flavor"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "getFlavor") {
                // Get the flavor from the Android build configuration (BuildConfig.FLAVOR)
                val flavor = BuildConfig.FLAVOR
                result.success(flavor)
            } else {
                result.notImplemented()
            }
        }
    }
}
