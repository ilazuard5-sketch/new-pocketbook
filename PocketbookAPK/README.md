# Bilingual Pocketbook — Android APK Build Guide
## Kampung Heritage Kayutangan | Ticket Attendant Reference App

---

## ABOUT THIS APP
- Fully offline — no internet needed after install
- No login required — anyone can open and use
- Exact same UI as the HTML pocketbook
- Works on low-spec Android phones (Android 5.0+)
- Target SDK 34 (Android 14)
- 5 topics × 3 subtopics × 15 entries each

---

## QUICKEST WAY TO BUILD THE APK

### Option A — Android Studio (Recommended, 5 minutes)

1. Download and install **Android Studio** (free):
   https://developer.android.com/studio

2. Open Android Studio → **File → Open** → select this folder

3. Wait for Gradle sync (first time downloads ~500 MB)

4. Click **Build → Build Bundle(s) / APK(s) → Build APK(s)**

5. Your APK will be at:
   `app/build/outputs/apk/debug/app-debug.apk`

6. Transfer `app-debug.apk` to any Android phone → tap to install
   (Enable "Install from unknown sources" in phone settings first)

---

### Option B — Command Line (if you have Android SDK installed)

```bash
# On Windows:
gradlew.bat assembleDebug

# On Mac/Linux:
chmod +x gradlew
./gradlew assembleDebug
```

APK output: `app/build/outputs/apk/debug/app-debug.apk`

---

### Option C — Online Build (no local tools needed)

1. Upload this entire folder to **GitHub** as a repository
2. Go to **Actions** tab → create a workflow:
   ```yaml
   name: Build APK
   on: [push]
   jobs:
     build:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v3
         - uses: actions/setup-java@v3
           with: { java-version: '17', distribution: 'temurin' }
         - run: chmod +x gradlew && ./gradlew assembleDebug
         - uses: actions/upload-artifact@v3
           with:
             name: pocketbook.apk
             path: app/build/outputs/apk/debug/app-debug.apk
   ```
3. Download the APK from GitHub Actions artifacts

---

## INSTALLING ON ANDROID PHONE

1. Transfer the `.apk` file to your phone (USB, WhatsApp, email, etc.)
2. On your phone: **Settings → Security → Unknown Sources → Enable**
   (or Settings → Apps → Special Access → Install Unknown Apps)
3. Tap the `.apk` file to install
4. App name: **Bilingual Pocketbook**
5. Open the app — no internet, no login, ready to use!

---

## PROJECT STRUCTURE

```
PocketbookAPK/
├── app/
│   ├── src/main/
│   │   ├── java/com/khk/pocketbook/
│   │   │   └── MainActivity.java       ← WebView host activity
│   │   ├── res/
│   │   │   ├── layout/activity_main.xml
│   │   │   ├── values/strings.xml
│   │   │   ├── values/colors.xml
│   │   │   ├── values/themes.xml
│   │   │   └── mipmap-*/ic_launcher.png
│   │   ├── assets/
│   │   │   └── index.html             ← The full bilingual pocketbook
│   │   └── AndroidManifest.xml
│   ├── build.gradle
│   └── proguard-rules.pro
├── gradle/wrapper/
│   └── gradle-wrapper.properties
├── build.gradle
├── settings.gradle
├── gradle.properties
└── README.md
```

---

## APP SPECIFICATIONS

| Property           | Value                        |
|--------------------|------------------------------|
| Package name       | com.khk.pocketbook           |
| Min Android        | 5.0 (API 21) — low-spec OK   |
| Target Android     | 14 (API 34)                  |
| Internet required  | ❌ None — fully offline       |
| Login required     | ❌ None — open to all         |
| App size (approx)  | ~500 KB                      |
| Orientation        | Portrait                     |
| Languages          | English + Bahasa Indonesia   |

---

## TOPICS INSIDE THE APP

1. 🎫 Greetings & Selling Tickets
2. 🗺️ Giving Directions
3. 📋 Information & Rules
4. 🏛️ Describing Places & Events
5. 🔢 Reading Numbers

Each topic has:
- 15 Vocabulary entries (EN ↔ ID)
- 15 Practical Sentences (EN ↔ ID)
- 15 Frequently Asked Questions (EN ↔ ID)

**Total: 225 bilingual entries**

---

## TROUBLESHOOTING

**"App not installed" error:**
→ Enable "Install from unknown sources" in Android settings

**Blank white screen:**
→ The HTML file must be in `app/src/main/assets/index.html`

**Gradle sync fails (proxy/firewall):**
→ Use Android Studio with a VPN, or use Option C (GitHub Actions)

**Text too small on phone:**
→ The app uses viewport meta — text scales automatically

---

Kampung Heritage Kayutangan Bilingual Pocketbook v1.0
