-- الطلاب لكل مدرس
SELECT * FROM students_per_teacher;

-- متوسط درجات كل صف
SELECT * FROM avg_grade_per_class;

-- الطلاب اللي درجاتهم أعلى من المتوسط
SELECT s.name, s.grade, c.class_name
FROM students s
JOIN student_classes sc ON s.student_id = sc.student_id
JOIN classes c ON sc.class_id = c.class_id
WHERE s.grade > (
    SELECT AVG(grade) FROM students
);
