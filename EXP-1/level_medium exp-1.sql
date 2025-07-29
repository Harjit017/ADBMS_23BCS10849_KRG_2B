-- Department table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

-- Course table with a foreign key to Department
CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Insert into Department
INSERT INTO Department (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Mechanical Engineering'),
(3, 'Electrical Engineering'),
(4, 'Mathematics'),
(5, 'Physics');

-- Insert into Course
INSERT INTO Course (course_id, course_name, dept_id) VALUES
(101, 'Data Structures', 1),
(102, 'Algorithms', 1),
(103, 'Operating Systems', 1),
(104, 'Thermodynamics', 2),
(105, 'Fluid Mechanics', 2),


-- Departments with more than 2 courses
SELECT dept_name
FROM Department
WHERE dept_id IN (
    SELECT dept_id
    FROM Course
    GROUP BY dept_id
    HAVING COUNT(course_id) > 2
);


-- Grant SELECT access 
GRANT SELECT ON Course TO readonly_user;
