--- cut from '~/repos/jem/osm/sql/views/update_spatialvds_tvd.sql'
--- also look at '~/repos/jem/osm/sql/views/dump_updated_vds_to_osm.sh'

insert into newtbmap.tvd
select  id, name, freeway_dir, lanes , length, cal_pm, abs_pm,
latitude, longitude, version as last_modified , gid, geom, freeway_id, vdstype, district
from (

 SELECT v.*,
        vv.lanes,  vv.segment_length as length, vv.version,
 	vf.freeway_id ,
        vf.freeway_dir,
        vt.type_id as vdstype,
        vd.district_id as district,
	g.gid as gid,
        g.geom as geom
 FROM vds_id_all v
 JOIN vds_versioned vv using (id)
 JOIN vds_points_4326 on (id=vds_id)
 JOIN vds_vdstype vt using (vds_id)
 JOIN vds_district vd USING (vds_id)
 JOIN vds_freeway vf USING (vds_id)
 JOIN geom_points_4326 g using (gid)
 JOIN ( SELECT vvv.id, max(vvv.version) as version
        FROM vds_versioned vvv
        GROUP BY vvv.id) maxvv on (maxvv.version=vv.version
                                  and maxvv.id=vv.id)

left outer join newtbmap.tvd ntv on (ntv.id=vv.id)
where ntv.id is null
)big ;
drop table if exists tempseg.tvd;
select * into tempseg.tvd from ( select * from newtbmap.tvd )q;


--- cut from '~/repos/jem/osm/sql/views/tvd_osm_update.sql'
-- on osm, cleanup of new vds data from spatialvds
-- copy from the new temp table into the existing
insert into newtbmap.tvd
select  id, name, freeway_dir, lanes , length, cal_pm, abs_pm,
latitude, longitude, last_modified , gid, geom, freeway_id, vdstype, district
from
(select vv.*
 from tempseg.tvd vv
 left outer join newtbmap.tvd ntv on (ntv.id=vv.id)
 where ntv.id is null
)big ;
-- remove the temp table
drop table tempseg.tvd;
