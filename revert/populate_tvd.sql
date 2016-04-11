-- Revert tvd:populate_tvd from pg

BEGIN;

truncate newtbmap.tvd;

COMMIT;
