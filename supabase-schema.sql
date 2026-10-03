-- Brandon Partin Ministries Bible Study cloud content
-- Run this in Supabase SQL Editor.
create extension if not exists pgcrypto;

create table if not exists public.admin_users (
  user_id uuid primary key references auth.users(id) on delete cascade,
  created_at timestamptz not null default now()
);

create table if not exists public.study_lessons (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  ref text not null,
  text text not null,
  qs jsonb not null default '[]'::jsonb,
  published boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists public.devotionals (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  ref text not null,
  text text not null,
  prayer text not null default '',
  series text not null default '',
  published boolean not null default true,
  created_at timestamptz not null default now()
);

alter table public.admin_users enable row level security;
alter table public.study_lessons enable row level security;
alter table public.devotionals enable row level security;

create or replace function public.is_bpm_admin()
returns boolean language sql stable security definer set search_path = public
as $$ select exists(select 1 from public.admin_users where user_id = auth.uid()); $$;

drop policy if exists "published lessons readable" on public.study_lessons;
create policy "published lessons readable" on public.study_lessons for select using (published = true or public.is_bpm_admin());
drop policy if exists "admins manage lessons" on public.study_lessons;
create policy "admins manage lessons" on public.study_lessons for all using (public.is_bpm_admin()) with check (public.is_bpm_admin());

drop policy if exists "published devotionals readable" on public.devotionals;
create policy "published devotionals readable" on public.devotionals for select using (published = true or public.is_bpm_admin());
drop policy if exists "admins manage devotionals" on public.devotionals;
create policy "admins manage devotionals" on public.devotionals for all using (public.is_bpm_admin()) with check (public.is_bpm_admin());

-- After creating your administrator account in Supabase Authentication,
-- replace the UUID below with that user's Auth UID and run:
-- insert into public.admin_users(user_id) values ('YOUR-AUTH-USER-UUID');
