-- ============================================================
-- forecastiq — Migration 008: fix mutable search_path
-- Ejecutar en: Supabase Dashboard → SQL Editor
-- Resuelve el warning "function_search_path_mutable" del linter.
-- ============================================================

create or replace function update_chat_conversations_updated_at()
returns trigger
language plpgsql
set search_path = public
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;
