import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("app/keystore/key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
} else {
    println("WARNING: keystore.properties not found at project root. Using environment variables for debug signing.")
}

android {
    namespace = "space.prtlab.the_kids_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "space.prtlab.the_kids_app"
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 24
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            if (keystorePropertiesFile.exists()) {
                storeFile = file(keystoreProperties["storeFile"] as String)
                storePassword = keystoreProperties["storePassword"] as String
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
            } else {
                storeFile = rootProject.file("keystore/keystore.jks")
                storePassword = System.getenv("KEYSTORE_PASSWORD")
                keyAlias = System.getenv("KEY_ALIAS")
                keyPassword = System.getenv("KEY_PASSWORD")
            }
        }
        getByName("debug") {
            if (keystorePropertiesFile.exists()){
                storeFile = file(keystoreProperties["debugStoreFile"] as String)
                storePassword = keystoreProperties["debugStorePassword"] as String
                keyAlias = keystoreProperties["debugKeyAlias"] as String
                keyPassword = keystoreProperties["debugKeyPassword"] as String
            } else {
                storeFile = rootProject.file("keystore/debug.keystore")
                storePassword = System.getenv("DEBUG_KEYSTORE_PASSWORD")
                keyAlias = System.getenv("DEBUG_KEY_ALIAS")
                keyPassword = System.getenv("DEBUG_KEY_PASSWORD")
            }   
        }
    }

    buildTypes {
        getByName("release") {
            isDebuggable = false
            isMinifyEnabled = false
            isShrinkResources = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            signingConfig = signingConfigs.getByName("release")
        }

        getByName("debug") {
            isDebuggable = true
            isMinifyEnabled = false
            isShrinkResources = false
        }

        getByName("profile") {
            isDebuggable = false
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    buildFeatures {
        buildConfig = true
    }

    flavorDimensions += "app"

    productFlavors {
        create("dev") {
            dimension = "app"
            versionNameSuffix = "-dev"
            applicationIdSuffix = ".dev"
            resValue("string", "app_name", "Kids App (Dev)")
        }
        create("prod") {
            dimension = "app"
            resValue("string", "app_name", "Kids App")
        }
    }
}

flutter {
    source = "../.."
}
