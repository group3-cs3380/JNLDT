CREATE TABLE student (
	id INT PRIMARY KEY,
	username VARCHAR(16),
	email VARCHAR(255),
	name_first VARCHAR(30)
	name_last VARCHAR(45)
);

CREATE TABLE location (
	id INT PRIMARY KEY,
	name VARCHAR(250)
);

CREATE TABLE employee (
	id INT PRIMARY KEY,
	username VARCHAR(16),
	email VARCHAR(255),
	name_first VARCHAR(30)
	name_last VARCHAR(45)
);

CREATE TABLE employee_permissions (
	id INT PRIMARY KEY,
	name VARCHAR(250)
);

CREATE TABLE waiver (
	id INT PRIMARY KEY,
	name VARCHAR(250)
);

CREATE TABLE item_condition (
	id INT PRIMARY KEY,
	name VARCHAR(250)
);

CREATE TABLE item (
	id INT PRIMARY KEY,
	name VARCHAR(250)
);

CREATE TABLE item_category (
	id INT PRIMARY KEY,
	name VARCHAR(250)
);

CREATE TABLE student_has_waiver (
    student_id INT NOT NULL,  
    waiver_id INT NOT NULL,  
    PRIMARY KEY (student_id, waiver_id),  
    FOREIGN KEY (student_id) REFERENCES student(id) ON UPDATE CASCADE,  
    FOREIGN KEY (waiver_id) REFERENCES waiver(id) ON UPDATE CASCADE
);  

CREATE TABLE item_condition_update (
    item_condition_id INT NOT NULL,  
    item_id INT NOT NULL,  
    PRIMARY KEY (item_condition_id, item_id),  
    FOREIGN KEY (item_condition_id) REFERENCES item_condition(id) ON UPDATE CASCADE,  
    FOREIGN KEY (item_id) REFERENCES item(id) ON UPDATE CASCADE
);

CREATE TABLE item_has_category (
    item_category_id INT NOT NULL,  
    item_id INT NOT NULL,  
    PRIMARY KEY (item_category_id, item_id),  
    FOREIGN KEY (item_category_id) REFERENCES item_category(id) ON UPDATE CASCADE,  
    FOREIGN KEY (item_id) REFERENCES item(id) ON UPDATE CASCADE
);

CREATE TABLE employee_has_permissions (
    employee_id INT NOT NULL,  
    employee_permissions_id INT NOT NULL,  
    PRIMARY KEY (employee_id, employee_permissions_id),  
    FOREIGN KEY (employee_id) REFERENCES employee(id) ON UPDATE CASCADE,  
    FOREIGN KEY (employee_permissions_id) REFERENCES employee_permissions(id) ON UPDATE CASCADE
);

CREATE TABLE student_item_transaction (
    student_id INT NOT NULL,  
    location_id INT NOT NULL,
    employee_id INT NOT NULL,
    item_id INT NOT NULL,
    item_condition_id INT NOT NULL,
    PRIMARY KEY (student_id, location_id, employee_id, item_id, item_condition_id),  
    FOREIGN KEY (student_id) REFERENCES student(id) ON UPDATE CASCADE,  
    FOREIGN KEY (location_id) REFERENCES location(id) ON UPDATE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES employee(id) ON UPDATE CASCADE,    
    FOREIGN KEY (item_category_id) REFERENCES item_category(id) ON UPDATE CASCADE,  
    FOREIGN KEY (item_id) REFERENCES item(id) ON UPDATE CASCADE
);

