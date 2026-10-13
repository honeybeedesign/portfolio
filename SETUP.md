# Honeybee Designs — Melissa Bullitt Portfolio

This GitHub Pages website uses Supabase for shared photo storage and a password-protected editor.

## Setup
1. Confirm config.js contains the Supabase project URL and publishable/anon key. Never use a service-role or secret key in browser code.
2. In Supabase Storage, create a **public** bucket named portfolio-photos.
3. Run supabase-setup.sql in the Supabase SQL Editor.
4. In Supabase Authentication, disable public sign-ups and manually create your editor user with email and password.
5. In this repository, open **Settings → Pages**, choose **Deploy from a branch**, then **main** and **/(root)**.

## Use
- Visitors can view published photos and captions.
- Use **Editor sign in** near the bottom of the page to access upload, rotate, resize, caption, and remove controls.
- Photo captions and adjustments are shared for all visitors.

## Privacy
Uploaded images are public: anyone with the site or direct image URL can view them. Do not upload private images. Keep the Supabase service-role/secret key private.