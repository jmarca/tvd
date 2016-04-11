SET client_min_messages TO warning;
CREATE EXTENSION IF NOT EXISTS pgtap;
RESET client_min_messages;

BEGIN;
SELECT no_plan();
-- SELECT plan(1);

SELECT pass('Test populate_tvd!');

SELECT is(
    (SELECT count(*)
          FROM newtbmap.tvd
    )::integer,
    17929,
    'The data got loaded okay'
);

SELECT finish();
ROLLBACK;
