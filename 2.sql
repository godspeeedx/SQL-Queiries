
--2. Для каждого преподавателя вывести его имя, фамилию, наименование соответствующего подразделения и наименования всех преподаваемых предметов.
--   Если для преподавателя нет информации о преподаваемых предметах, вывести «-».
--

select pers.person_family surname,
  pers.person_name _name,
  struct.univer_str_name kafedra,
  COALESCE(obj.obj_name, '-') subject
from tperson pers
  INNER join tcl_status status on
	(
	  pers.status_id = status.status_id AND
	  status.status_name = 'Prepod'
	)
  INNER JOIN tuniver_str struct ON (pers.univer_str_id = struct.univer_str_id)
  LEFT join tperson_obj pred on (pers.person_id = pred.person_id)
  LEFT join tcl_obj obj on (pred.obj_id = obj.obj_id)