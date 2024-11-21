use quanlysinhvien;

select * from subject;

select subid, subname, status, MAX(credit) "highest credit"
from subject
group by subid
HAVING MAX(credit) >= ALL (SELECT MAX(credit) FROM subject GROUP BY subid);

select * from mark;

select sub.subid, sub.subname, sub.credit, sub.status, MAX(m.mark) "highest mark"
from subject sub
join mark m on m.subid = sub.subid
group by sub.subid
having MAX(m.mark) >= all (select MAX(mark) from mark group by subid);

select * from student;

select s.studentid, s.studentname, s.address, s.phone, s.status, c.classname, AVG(m.mark) "Avarage mark"
from student s
join class c on c.classid = s.classid
join mark m on m.studentid = s.studentid
group by s.studentid
order by "Avarage mark" desc;

