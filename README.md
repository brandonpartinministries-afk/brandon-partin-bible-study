# Brandon Partin Ministries Bible Study — Admin Publishing Edition

This version separates **content administration** from normal app use.

## What changed
- Regular users can read published Bible study lessons and devotionals.
- Regular users do **not** get Add/Import/Export content controls.
- An **Administration** screen is available only after a Supabase Auth login is verified against `admin_users`.
- Administrators can upload JSON collections of Bible study lessons and devotionals and publish them to the cloud database.
- Administrators can delete published lessons/devotionals.
- Published content is available to all users of the app.
- User notes, prayers, favorites, settings, and reading progress remain separate local user data.

## Supabase setup
1. Create a Supabase project.
2. Open the SQL Editor and run `supabase-schema.sql`.
3. In Supabase Authentication, create the administrator user with email/password.
4. Copy that user's Auth UID into the `admin_users` table using the SQL comment at the bottom of `supabase-schema.sql`.
5. This build already includes `supabase-config.js` with the project URL and public publishable key you supplied.
6. The app loads that configuration before the Supabase CDN client.
7. Publish the folder to GitHub Pages.
8. Never put a `service_role` or `sb_secret_...` key in the website.

## Lesson JSON
A lesson needs:
- `title`
- `ref`
- `text`
- `qs` — an array of discussion questions

You may upload one object, an array, or `{ "lessons": [...] }`.

## Devotional JSON
A devotional needs:
- `title`
- `ref`
- `text`

Optional:
- `series`
- `prayer`

You may upload one object, an array, or `{ "devotionals": [...] }`.

## Important security note
Do not put a Supabase **service-role key** in this website. Only use the public anon key. RLS and the `admin_users` table enforce administrator permissions.
