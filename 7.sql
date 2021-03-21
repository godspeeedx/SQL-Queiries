--7. Сформировать отчет, описывающий изучаемые на кафедре предметы: 
--    название подразделения – название предмета - признак изучения «+»/«-».
--

SELECT DISTINCT
  struct.univer_str_name kafedra,
  obj.obj_name predmet,
  (CASE WHEN obj2.obj_name IS NOT NULL THEN '+'
	ELSE '-'
	END) nalichie
From tuniver_obj rasp
  CROSS JOIN tuniver_obj rasp2
  INNER JOIN tuniver_str struct on (rasp.univer_str_id = struct.univer_str_id)
  INNER JOIN tcl_obj obj on (rasp2.obj_id = obj.obj_id)
  LEFT JOIN tuniver_obj on_kaf on
  (
    on_kaf.univer_str_id = rasp.univer_str_id AND
    on_kaf.obj_id = rasp2.obj_id
  )
  LEFT JOIN tcl_obj obj2 on (on_kaf.obj_id = obj2.obj_id)