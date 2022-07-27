drop table subject;


CREATE TABLE Teacher (
    Teacher_ID  INT  UNIQUE ,
    Teacher_Name VARCHAR(255),
    Subject_Name varchar(255) UNIQUE,
    PRIMARY KEY(Teacher_ID),
        FOREIGN KEY(Subject_Name) REFERENCES Subject(Subject_Name)

);

-- ALTER TABLE Course
-- ADD CONSTRAINT Course_ID UNIQUE (Course_ID);

CREATE TABLE Subject(
   -- Subject_ID INT ,
    Subject_Name VARCHAR(255) ,
    PRIMARY KEY(Subject_Name)
);


CREATE TABLE Course(
    Course_ID INT UNIQUE,
    Course_Name VARCHAR(255) ,
    PRIMARY KEY(Course_Name,Course_ID),
    Subject_Name VARCHAR(255),
    FOREIGN KEY(Subject_Name) REFERENCES Subject(Subject_Name)
);
-- Many to Many realation between the teacher and the course table
CREATE TABLE teacherAssignedCourse(
    
    Teacher_ID INT,
    Course_ID INT,
    -- constraints are used to specify rules for the data in a table
    CONSTRAINT Teacher_Course_PK PRIMARY KEY (Teacher_ID ,Course_ID),
    CONSTRAINT Teacher_FK FOREIGN KEY (Teacher_ID) REFERENCES Teacher(Teacher_ID),
    CONSTRAINT Course_FK FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);


CREATE TABLE Student(
   
    Student_ID INT UNIQUE,
    Student_Name VARCHAR(255),
    Phone INT,
    Course_ID INT,
    DOB DATE, 
    PRIMARY KEY(Student_ID),
    FOREIGN KEY(Course_ID) REFERENCES Course(Course_ID)
);

CREATE TABLE TeacherTeachesStudents(
    

)



SELECT Teacher_ID,teacherAssignedCourse.Course_ID, Course.Course_Name,Course.Subject_Name  FROM teacherAssignedCourse JOIN Course ON Course.Course_ID =teacherAssignedCourse.Course_ID;
SELECT * FROM Course;




INSERT INTO teacherAssignedCourse VALUES (1,1);
INSERT INTO teacherAssignedCourse VALUES (1,2);

INSERT INTO teacherAssignedCourse VALUES (2,4);
INSERT INTO teacherAssignedCourse VALUES (2,5);



INSERT INTO Subject VALUES ('OOP');
INSERT INTO Subject VALUES ('Data Structure');

INSERT INTO Course VALUES(1,'Java','OOP');
INSERT INTO Course VALUES(2,'Java','Data Structure');
INSERT INTO Course VALUES(3,'C','Data Structure');
INSERT INTO Course VALUES(4,'Python','Data Structure');
INSERT INTO Course VALUES(5,'Python','OOP');
-- Show how does the relation work 
SELECT  Course.Course_Name , Course.Subject_Name, Course_ID   FROM  Subject JOIN Course  ON Course.Subject_Name  = Subject.Subject_Name ;


-- SELECT *  FROM teacher join subject ON teacher.Subject_Name = subject.Subject_Name;
-- SELECT * FROM subject;

-- INSERT INTO teacher VALUES(1,'Munther','ENCS'
                           
-- ),(2,'Tareq','ENCC');

-- INSERT INTO subject VALUES('ENCS'
-- ),('ENfg'),('ENCC');

