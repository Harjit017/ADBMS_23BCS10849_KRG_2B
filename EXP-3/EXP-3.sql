-- 1. Create Table A
CREATE TABLE A (
    EmpID INT,
    Ename VARCHAR(50),
    Salary INT
);

-- 2. Insert data into Table A
INSERT INTO A (EmpID, Ename, Salary) VALUES
(1, 'AA', 1000),
(2, 'BB', 300);

-- 3. Create Table B
CREATE TABLE B (
    EmpID INT,
    Ename VARCHAR(50),
    Salary INT
);

-- 4. Insert data into Table B
INSERT INTO B (EmpID, Ename, Salary) VALUES
(2, 'BB', 400),
(3, 'CC', 100);

-- 5. Final Query: Find lowest salary per EmpID with correct Ename
SELECT EmpID, Ename, Salary AS LowestSalary
FROM (
    SELECT EmpID, Ename, Salary,
           ROW_NUMBER() OVER (PARTITION BY EmpID ORDER BY Salary ASC) AS rn
    FROM (
        SELECT EmpID, Ename, Salary FROM A
        UNION ALL
        SELECT EmpID, Ename, Salary FROM B
    ) AS Combined
) AS Ranked
WHERE rn = 1;
