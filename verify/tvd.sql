-- Verify tvd:tvd on pg

BEGIN;

SELECT id,name,freeway_dir,lanes,length,cal_pm,abs_pm,
       latitude,longitude,
       last_modified,gid,geom,freeway_id,vdstype,district
  FROM newtbmap.tvd
 WHERE FALSE;


ROLLBACK;
