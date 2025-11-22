# School Database Advanced

مشروع قاعدة بيانات مدرسة متقدم للتعلم العملي على PostgreSQL.

## الجداول
- teachers: جدول المدرسين
- students: جدول الطلاب
- classes: جدول الصفوف
- student_classes: جدول وسيط لطالب ↔ صف

## Views
- students_per_teacher: عدد الطلاب لكل مدرس
- avg_grade_per_class: متوسط درجات كل صف

## Triggers
- trg_new_student: رسالة تلقائية عند إضافة طالب جديد

## Queries عملية
- استعلام عدد الطلاب لكل مدرس
- استعلام متوسط درجات كل صف
- استعلام الطلاب اللي درجاتهم أعلى من المتوسط

## كيفية التشغيل
1. نفذ `schema.sql` لإنشاء الجداول وإدخال البيانات
2. نفذ `views_and_triggers.sql` لإضافة الـViews والـTriggers
3. جرب `sample_queries.sql` لعرض البيانات والتحقق من النتائج

## ERD
- يوجد ملف ERD.png يوضح العلاقات بين الجداول
- العلاقات:
  - teachers --1--< students
  - students --M--< student_classes >--M-- classes
