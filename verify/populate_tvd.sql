-- Verify tvd:populate_tvd on pg

BEGIN;


SELECT 1/COUNT(*)
  FROM newtbmap.tvd;


ROLLBACK;
