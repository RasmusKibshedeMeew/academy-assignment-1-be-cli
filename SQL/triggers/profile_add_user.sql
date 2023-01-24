CREATE OR REPLACE FUNCTION profile_add_user()
    RETURNS TRIGGER AS $$
BEGIN
INSERT INTO public.profile(id) VALUES (new.id);
return new;
END
$$ language 'plpgsql';

DROP TRIGGER IF EXISTS profile_add_user_trigger ON auth.users;

CREATE TRIGGER profile_add_user_trigger
AFTER INSERT
ON auth.users
FOR EACH ROW
EXECUTE PROCEDURE profile_add_user();