# Keep MainActivity
-keep class com.khk.pocketbook.** { *; }

# Keep WebView JavaScript interface (if any added later)
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
