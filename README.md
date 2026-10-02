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
