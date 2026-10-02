# Brandon Partin Ministries Bible Study

## Bible version
This build uses the **King James Version (standardized 1769 text) with Apocrypha/Deuterocanon**. The Bible data is loaded from the public-domain KJVA source at getBible/eBible lineage and cached by the app after it loads.

## GitHub Pages upload
Upload the **contents of this folder** to the root of your existing GitHub repository. Do not upload the ZIP file itself.

The repository root should contain:
- index.html
- manifest.json
- sw.js
- logo.png
- apple-touch-icon.png
- icon-192.png
- icon-512.png
- favicon-32.png
- .nojekyll

Then enable GitHub Pages from **Settings → Pages → Deploy from a branch → main → / (root)**.

## Updating an installed copy
After uploading new files, open the app once while online, then close and reopen it. The new version replaces the old cached one automatically. If a phone still shows old behavior, remove the app from the Home Screen and add it again.


## iPhone controls and study lesson uploads
This build includes fixes for the Home Continue button, Bible Clear/Previous/Next/A−/A+ controls, Settings theme/notification/import/clear controls, and iPhone touch handling.

### Add your own study lessons
On the **Studies** tab, tap **Add study lesson** and choose a JSON file from the iPhone Files app.

A single lesson uses this format:
```json
{
  "title": "Walking by Faith",
  "ref": "2 Corinthians 5:7",
  "text": "A short description of the lesson.",
  "qs": [
    "What does this passage teach?",
    "How can you apply it today?",
    "What will you pray about?"
  ]
}
```

You can also import an array of lessons in one JSON file. If a lesson has the same title as an existing imported lesson, it is updated.

Imported lessons are saved on the device. **Export lessons** creates a backup JSON file you can keep in Files and import on another device.
