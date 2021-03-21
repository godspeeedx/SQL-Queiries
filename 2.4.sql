--select * from tcl_stud_time
--select * from tuniver_stud_time
--select * from tuniver_str
--select * from tperson
--select * from tcl_status

--Для каждой формы обучения вывести ее название, количество кафедр с соответствующей формой обучения,
--название кафедры с максимальным количеством студентов в рамках данной формы обучения, количество студентов этой кафедры,
--название кафедры с минимальным количеством студентов в рамках данной формы обучения, количество студентов этой кафедры.

select tmp.forma_obucheniya,
  count(tmp.kafedri) kolvo_kafedr,
    --tmp.imya nazvanie_max,
  max(tmp.stud_na_kaf) max_kolvo_stud,
    --tmp.imya nazvanie_min,
  min(tmp.stud_na_kaf) min_kolvo_stud
  from
(
select forma.stud_time_name forma_obucheniya,
  --groups.univer_str_id,
  kaf.univer_str_parent kafedri,
  univer_facult.univer_str_name imya,
  --kaf.univer_str_name,
  --stud.person_family,
  --count(kaf.univer_str_name),
  --count(groups.univer_str_id) kolvo_kafedr,
  count(stud.person_family) stud_na_kaf
from tcl_stud_time forma
  LEFt join tuniver_stud_time groups on (groups.stud_time_id = forma.stud_time_id)
  LEFT join tuniver_str kaf on (kaf.univer_str_id = groups.univer_str_id)
  left join tperson stud on (stud.status_id = 7 and stud.univer_str_id = kaf.univer_str_id)
  left join tuniver_str univer_facult on (univer_facult.univer_str_id = kaf.univer_str_parent)
  group by forma.stud_time_name, kaf.univer_str_parent, univer_facult.univer_str_name
  ) tmp
  
  group by tmp.forma_obucheniya--, tmp.imya
