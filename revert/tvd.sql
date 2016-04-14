-- Revert tvd:tvd from pg

BEGIN;

drop table newtbmap.tvd;

COMMIT;
