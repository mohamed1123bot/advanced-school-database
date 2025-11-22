-- View: عدد الطلاب لكل مدرس
CREATE VIEW students_per_teacher AS
SELECT t.name AS teacher_name,
       COUNT(s.student_id) AS student_count
FROM teachers t
LEFT JOIN students s ON t.teacher_id = s.teacher_id
GROUP BY t.name;

-- View: متوسط درجات كل صف
CREATE VIEW avg_grade_per_class AS
SELECT c.class_name,
       AVG(s.grade) AS avg_grade
FROM classes c
JOIN student_classes sc ON c.class_id = sc.class_id
JOIN students s ON sc.student_id = s.student_id
GROUP BY c.class_name;

-- Trigger: تنبيه عند إضافة طالب جديد
CREATE OR REPLACE FUNCTION new_student_notification()
RETURNS TRIGGER AS $$
BEGIN
  RAISE NOTICE 'تم إضافة طالب جديد: %', NEW.name;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_new_student
AFTER INSERT ON students
FOR EACH ROW
EXECUTE FUNCTION new_student_notification();
