-- Ejecuta este SQL una vez en Supabase > SQL Editor.
create table if not exists public.shared_app_data (
  id text primary key check (id = 'school'),
  payload jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.shared_app_data enable row level security;

drop policy if exists "Signed-in users can read school data" on public.shared_app_data;
create policy "Signed-in users can read school data"
  on public.shared_app_data for select to authenticated using (true);

drop policy if exists "Signed-in users can create school data" on public.shared_app_data;
create policy "Signed-in users can create school data"
  on public.shared_app_data for insert to authenticated with check (true);

drop policy if exists "Signed-in users can update school data" on public.shared_app_data;
create policy "Signed-in users can update school data"
  on public.shared_app_data for update to authenticated using (true) with check (true);

grant select, insert, update on public.shared_app_data to authenticated;

-- Activa los cambios en tiempo real para esta tabla (si la publicación existe).
do $$
begin
  if exists (select 1 from pg_publication where pubname = 'supabase_realtime')
     and not exists (
       select 1 from pg_publication_tables
       where pubname = 'supabase_realtime'
         and schemaname = 'public'
         and tablename = 'shared_app_data'
     ) then
    alter publication supabase_realtime add table public.shared_app_data;
  end if;
end
$$;
