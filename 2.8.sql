
-- select * from tperson

--Для заданного факультета вывести его название, названия относящихся к нему кафедр,
--количество преподавателей кафедр, количество студентов кафедр, и сформировать результирующий кортеж,
--cодержащий в качестве значений атрибутов «количество преподавателей и «количество студентов» суммарные
--количества преподавателей и студентов по факультету соответственно. Упорядочить итоговый набор кортежей.

select faculty.univer_str_name  faculty_name,
  kaf.univer_str_name,
  count(DISTINCT prep.person_name) preps,
  count(DISTINCT kaf_students.univer_str_id) studs

From public.tuniver_str faculty 
Join public.tuniver_str kaf on (kaf.univer_str_parent = faculty.univer_str_id)
JOIN public.tperson prep on (prep.status_id = 5 and prep.univer_str_id = kaf.univer_str_id)
Left Join public.tuniver_str spec on(spec.univer_str_parent = kaf.univer_str_id)
Left JOIN public.tperson kaf_students on (kaf_students.univer_str_id = faculty.univer_str_id 
  and kaf_students.status_id = 7)

where faculty.univer_str_id = '10'
group by rollup ((faculty.univer_str_name, kaf.univer_str_name))
