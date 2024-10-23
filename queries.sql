
-- create
CREATE TABLE EMPLOYEE (
employee_id NUMBER PRIMARY KEY,
employee_name VARCHAR2(50) NOT NULL,
manager_id NUMBER
);

-- insert
INSERT INTO EMPLOYEE VALUES (1, 'John Doe', null);
INSERT INTO EMPLOYEE VALUES (2, 'Jane Smith', 1);
INSERT INTO EMPLOYEE VALUES (3, 'Michael Lee', 1);
INSERT INTO EMPLOYEE VALUES (4, 'Alice Wong', 2);
INSERT INTO EMPLOYEE VALUES (5, 'Bob Brown', 6);
INSERT INTO EMPLOYEE VALUES (6, 'David Lee', null);

-- fetch

SELECT employee_id,
employee_name,
manager_id
FROM employee
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;

SELECT employee_id, employee_name, manager_id, LEVEL
FROM employee
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;

SELECT employee_id, employee_name, manager_id, CONNECT_BY_ISLEAF AS is_leaf
FROM employee
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;

SELECT employee_id, employee_name, manager_id, CONNECT_BY_ROOT employee_name AS root_name
FROM employee
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;

SELECT employee_id, employee_name, SYS_CONNECT_BY_PATH(employee_name, ' -> ') AS path
FROM employee
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;