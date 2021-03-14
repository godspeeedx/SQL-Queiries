--7. Сформировать отчет, описывающий изучаемые на кафедре предметы: 
--    название подразделения – название предмета - признак изучения «+»/«-».
--

-- select distinct
--   struct.univer_str_name kafedra,
--   --rasp.obj_id,
--   --rasp2.univer_str_id,
--   rasp2.obj_id
-- from tuniver_obj rasp
--   CROSS join tuniver_obj rasp2
--   INNER JOIN tuniver_str struct on (rasp.univer_str_id = struct.univer_str_id)

-- select * from tuniver_obj
-- select * from tuniver_str

select DISTINCT
  struct.univer_str_name kafedra,
  obj.obj_name predmet,
  coalesce(obj2.obj_name, '-') predmet
From tuniver_obj rasp
  CROSS join tuniver_obj rasp2
  INNER JOIN tuniver_str struct on (rasp.univer_str_id = struct.univer_str_id)
  INNER JOIN tcl_obj obj on (rasp2.obj_id = obj.obj_id)
  LEFT join tuniver_obj on_kaf on
  (
    on_kaf.univer_str_id = rasp.univer_str_id AND
    on_kaf.obj_id = rasp2.obj_id
  )
  left JOIN tcl_obj obj2 on (on_kaf.obj_id = obj2.obj_id)