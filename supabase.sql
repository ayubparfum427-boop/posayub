-- Supabase -> SQL Editor ga qo'yib RUN qiling (bir marta)
create table if not exists public.records (
  id text primary key,
  kind text not null,
  data jsonb not null,
  updated_at timestamptz default now()
);
create index if not exists records_kind_idx on public.records(kind);

alter table public.records enable row level security;
drop policy if exists "pos_all" on public.records;
create policy "pos_all" on public.records for all to anon using (true) with check (true);
