-- Create a public Storage bucket named portfolio-photos before running these policies.
create table if not exists public.photos (
 id text primary key, original_name text not null, storage_path text not null unique,
 public_url text not null, caption text not null default '',
 rotation integer not null default 0 check (rotation in (0,90,180,270)),
 scale integer not null default 100 check (scale between 50 and 150),
 created_at timestamptz not null default now(),
 sort_order integer not null default 0
);
alter table public.photos add column if not exists sort_order integer not null default 0;
alter table public.photos enable row level security;
drop policy if exists "Anyone can view published photos" on public.photos;
create policy "Anyone can view published photos" on public.photos for select to anon, authenticated using (true);
drop policy if exists "Signed-in editors can add photos" on public.photos;
create policy "Signed-in editors can add photos" on public.photos for insert to authenticated with check (true);
drop policy if exists "Signed-in editors can update photos" on public.photos;
create policy "Signed-in editors can update photos" on public.photos for update to authenticated using (true) with check (true);
drop policy if exists "Signed-in editors can delete photos" on public.photos;
create policy "Signed-in editors can delete photos" on public.photos for delete to authenticated using (true);
drop policy if exists "Public can view portfolio photos" on storage.objects;
create policy "Public can view portfolio photos" on storage.objects for select to anon, authenticated using (bucket_id = 'portfolio-photos');
drop policy if exists "Signed-in editors can upload portfolio photos" on storage.objects;
create policy "Signed-in editors can upload portfolio photos" on storage.objects for insert to authenticated with check (bucket_id = 'portfolio-photos');
drop policy if exists "Signed-in editors can update portfolio photos" on storage.objects;
create policy "Signed-in editors can update portfolio photos" on storage.objects for update to authenticated using (bucket_id = 'portfolio-photos') with check (bucket_id = 'portfolio-photos');
drop policy if exists "Signed-in editors can delete portfolio photos" on storage.objects;
create policy "Signed-in editors can delete portfolio photos" on storage.objects for delete to authenticated using (bucket_id = 'portfolio-photos');