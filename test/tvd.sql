SET client_min_messages TO warning;
CREATE EXTENSION IF NOT EXISTS pgtap;
RESET client_min_messages;

BEGIN;
-- SELECT no_plan();
SELECT plan(3);

SELECT pass('Test tvd!');
SELECT has_schema( 'newtbmap' ,'has newtbmap schema');
SELECT has_table( 'newtbmap','tvd','has tvd table' );

SELECT finish();
ROLLBACK;
