# Stillroom — Photo Studio

A lightweight, responsive photo gallery you can host for free with GitHub Pages.

## Publish with GitHub Pages
1. Sign in to GitHub and create a new repository (for example, `stillroom-photo-studio`).
2. Upload `index.html` to the repository's root. You can also upload this README.
3. Open **Settings → Pages** in the repository.
4. Under **Build and deployment**, choose **Deploy from a branch**.
5. Choose branch **main** and folder **/(root)**, then click **Save**.
6. After GitHub finishes publishing, your site URL will appear in the Pages section, usually `https://YOUR-USERNAME.github.io/REPOSITORY-NAME/`.

## Features
- Add multiple photos from your device
- Rotate photos in 90-degree increments
- Resize their displayed scale with a slider
- Add and edit text captions under each photo
- Remove photos, reset edits, sort newest/oldest
- Export captions and edit notes as a text file
- Responsive layout for desktop, tablet, and mobile

## Important storage note
This is a static site: photo files and edits are saved in the browser on the device where you add them (using IndexedDB). They are **not uploaded to GitHub** and won't automatically sync across browsers or devices. Clearing browser site data can remove the collection, so keep your original photo files backed up. A public GitHub Pages URL does not make the photos themselves public; only the website code is hosted in the repository.
