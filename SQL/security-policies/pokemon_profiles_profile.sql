ALTER TABLE public.pokemon_profiles_profile ENABLE ROW LEVEL SECURITY;

/* SELECT */
DROP POLICY IF EXISTS pokemon_profiles_profile_select on public.pokemon_profiles_profile;
CREATE POLICY pokemon_profiles_profile_select
ON public.pokemon_profiles_profile
AS PERMISSIVE
FOR SELECT TO authenticated USING (
  auth.uid() = "profileId"
);

/* INSERT */
DROP POLICY IF EXISTS pokemon_profiles_profile_insert on public.pokemon_profiles_profile;
CREATE POLICY pokemon_profiles_profile_insert
ON public.pokemon_profiles_profile
AS PERMISSIVE
FOR INSERT TO authenticated WITH CHECK (
  auth.uid() = "profileId"
);

/* DELETE */
DROP POLICY IF EXISTS pokemon_profiles_profile_delete on public.pokemon_profiles_profile;
CREATE POLICY pokemon_profiles_profile_delete
ON public.pokemon_profiles_profile
AS PERMISSIVE
FOR DELETE TO authenticated USING (
  auth.uid() = "profileId"
);

