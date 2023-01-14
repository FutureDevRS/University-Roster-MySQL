USE school_of_hard_knocks;



-- Average grade that is given by each professor
SELECT professors_last_name,
AVG(grades_final_grade)
FROM grades
JOIN professors
ON grades_professors_id = professors_id
GROUP BY professors_last_name
ORDER BY AVG(grades_final_grade) ASC;
-- Learn how to add a column from another table to this query!

-- Top grades for each student
SELECT students_last_name AS "Last Name", students_first_name AS "First Name", grades_final_grade AS "Final Grade", students_email AS "Email"
FROM students
JOIN grades
ON grades_students_id = students_id
ORDER BY grades_final_grade DESC;

-- Group students by the courses that they are enrolled in.
SELECT students_last_name AS "Last Name", students_first_name AS "First Name", courses_name AS "Course", grades_final_grade
FROM students
JOIN grades
ON grades_students_id = students_id
JOIN courses
ON grades_courses_id = courses_id
ORDER BY courses_name, students_last_name;

-- Create a summary report of courses and their average grades, sorted by the most challenging course. (course with the lowest avg grade to the easiest)
SELECT courses_name AS "Course Name", ROUND(AVG(grades_final_grade), 0) AS "Average Grade"
FROM courses
JOIN grades
ON grades_courses_id = courses_id
GROUP BY courses_name
ORDER BY AVG(grades_final_grade) ASC;

-- Finding which student and professor have the most courses in common.
SELECT students_last_name AS "Student", professors_last_name AS "Professor", courses_name AS "Course Name"
FROM students
JOIN grades
ON grades_students_id = students_id
JOIN professors
ON grades_professors_id = professors_id
JOIN courses
ON grades_courses_id = courses_id
ORDER BY courses_name;