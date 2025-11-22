-- جدول المدرسين
CREATE TABLE teachers (
    teacher_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    subject VARCHAR(50) NOT NULL
);

-- جدول الطلاب
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    teacher_id INT,
    CONSTRAINT fk_teacher
        FOREIGN KEY (teacher_id)
        REFERENCES teachers(teacher_id)
);

-- جدول الصفوف
CREATE TABLE classes (
    class_id SERIAL PRIMARY KEY,
    class_name VARCHAR(20) NOT NULL,
    grade_level INT NOT NULL
);

-- جدول وسيط لطالب ↔ صف
CREATE TABLE student_classes (
    student_id INT,
    class_id INT,
    PRIMARY KEY (student_id, class_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

-- بيانات المدرسين
INSERT INTO teachers (name, subject)
VALUES 
  ('Ali', 'Math'),
  ('Sara', 'English');

-- بيانات الطلاب
INSERT INTO students (name, grade, teacher_id)
VALUES
  ('Omar', 10, 1),
  ('Laila', 9, 1),
  ('Youssef', 11, 2);

-- بيانات الصفوف
INSERT INTO classes (class_name, grade_level)
VALUES
  ('Class A', 10),
  ('Class B', 11);

-- ربط الطلاب بالصفوف
INSERT INTO student_classes (student_id, class_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 2);
