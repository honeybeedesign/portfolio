# Stillroom public photography portfolio

This is a static GitHub Pages website with Supabase-backed public photo storage and a password-protected editor. Visitors can see published images and captions; only authenticated accounts can upload, edit captions, rotate/scale, or delete.

## 1. Create Supabase project
1. Create a project at https://supabase.com/ and save the database password somewhere safe.
2. In **Project Settings → API** (or **Connect**), copy the Project URL and the publishable/anon key. Never use a `service_role` or secret key in a browser app.
3. Open **SQL Editor → New query**, paste all of `supabase-setup.sql`, and run it.
4. Open **Storage** and create a bucket named `portfolio-photos`. Set it to **Public** so the public portfolio can display images. The SQL file adds policies so public visitors can read objects, but only signed-in users can upload/update/delete.
5. In **Authentication → Providers / Sign In**, keep Email enabled. Turn off public sign-ups if that option is available. Then use **Authentication → Users → Add user** to create your editor account with an email and password. Confirm the user if prompted.

## 2. Connect the website
1. Open `config.js`.
2. Replace `https://YOUR-PROJECT.supabase.co` with your Supabase Project URL.
3. Replace `YOUR_SUPABASE_PUBLISHABLE_OR_ANON_KEY` with the publishable/anon key.
4. Keep bucket name as `portfolio-photos`.
5. Save the file. The URL and publishable/anon key are intended to be public. Never paste a `service_role` key into this site.

## 3. Publish with GitHub Pages
1. Create a repository, e.g. `stillroom-portfolio`.
2. Upload `index.html`, `style.css`, `app.js`, `config.js`, and `supabase-setup.sql` (plus this guide).
3. In the repository, open **Settings → Pages**.
4. Select **Deploy from a branch**, branch `main`, folder `/(root)`, and save.
5. Wait for GitHub Pages to publish; the URL appears in the Pages settings.

## 4. Use it
- Open the published URL. Visitors see the public portfolio.
- Select **Editor sign in** and use the account you created in Supabase.
- Upload photos. They become public on the site after upload.
- Rotate, adjust scale, edit captions, or remove images while signed in.
- Sign out to view the visitor experience.

## Security and behavior notes
- The bucket is public for reads: anyone who has the site or direct image URL can view uploaded photographs. Do not upload private or sensitive images.
- The publishable/anon key is not a password. Security depends on the Row Level Security and Storage policies in `supabase-setup.sql`; keep the service-role/secret key private.
- This setup allows any authenticated Supabase user to edit the gallery. Keep public sign-ups disabled and create editor accounts manually. If you later need multiple roles or client-specific private galleries, use stricter per-user policies.
- This version persists image metadata in the database. The displayed rotate/scale values and captions persist for everyone. Images are served from Supabase Storage.
- Deleting a photo removes its database row and attempts to remove the storage object too.
