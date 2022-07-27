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

SELECT * FROM  Teacher,CourseTakePlaceInClass,Classes,Student,teacherAssignedCourse,Subject;

CREATE TABLE Student(
   
    Student_ID INT UNIQUE,
    Student_Name VARCHAR(255),
    Phone INT,
     Course_ID INT,
    DOB DATE, 
    PRIMARY KEY(Student_ID),
    FOREIGN KEY(Course_ID) REFERENCES Course(Course_ID)
);


CREATE TABLE Classes(
    Class_ID VARCHAR(32) UNIQUE PRIMARY KEY
    
);

-- Many to Many realtion between the teacher and the student tabels
drop table Classes;
CREATE TABLE CourseTakePlaceInClass(
    Course_ID INT,
    Class_ID VARCHAR(32),
    -- constraints are used to specify rules for the data in a table
    CONSTRAINT Course_Class_PK PRIMARY KEY ( Course_ID,Class_ID ),
    CONSTRAINT Course_FK FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
    CONSTRAINT Class_FK FOREIGN KEY (Class_ID) REFERENCES Classes(Class_ID)
);

INSERT INTO classes VALUES ('Masri304');
INSERT INTO classes VALUES ('Masri302');
INSERT INTO classes VALUES ('Masri103');
INSERT INTO classes VALUES ('Masri204');
INSERT INTO classes VALUES ('Masri306');


INSERT INTO CourseTakePlaceInClass VALUES (1,'Masri304');
INSERT INTO CourseTakePlaceInClass VALUES (2,'Masri302');
INSERT INTO CourseTakePlaceInClass VALUES (5,'Masri103');
INSERT INTO CourseTakePlaceInClass VALUES (3,'Masri204');
INSERT INTO CourseTakePlaceInClass VALUES (4,'Masri306');



-- Show all student with assigned courses.--
SELECT  Student.Student_id, Student.Course_ID,Student.Student_Name,Student.Phone, Student.DOB, Course.Subject_Name
FROM Student
INNER JOIN  Course  ON Student.Course_ID = Course.Course_ID; 

SELECT  Student.Student_id, Student.Course_ID,Student.Student_Name,Student.Phone, Student.DOB, Course.Subject_Name, teacherAssignedCourse.Course_ID
FROM Student
INNER JOIN  Course  ON Student.Course_ID = Course.Course_ID 
JOIN teacherAssignedCourse ON Course.Course_ID =  teacherAssignedCourse.Course_ID 
INNER JOIN Teacher ON Teacher.Teacher_ID =teacherAssignedCourse.Teacher_ID ; 


SELECT * FROM Teacher
INNER JOIN teacherAssignedCourse ON Teacher.Teacher_ID =teacherAssignedCourse.Teacher_ID ; 


-- Find all information for each course, student, class, and Teacher
SELECT * --  Course.Course_Name,Course.Subject_Name,Teacher.Teacher_ID, Teacher.Teacher_Name, CourseTakePlaceInClass.Class_ID,Student.Student_Name,  Student.phone, Student.dob
FROM Course
INNER JOIN Student
ON Student.Course_ID = Course.Course_ID
INNER JOIN teacherAssignedCourse
ON Course.Course_ID =teacherAssignedCourse.Course_ID
INNER JOIN Teacher
ON teacherAssignedCourse.Teacher_ID = Teacher.Teacher_ID
INNER JOIN CourseTakePlaceInClass
ON Course.Course_ID =CourseTakePlaceInClass.Course_ID
;




-- Find the course id for each class Room
SELECT  cl.Class_ID,cl.Course_ID
FROM CourseTakePlaceInClass
as Cl
INNER JOIN Classes
ON Classes.Class_ID =Cl.Class_ID ; 

-- Find the class Room for each student with assigned course--
SELECT * FROM Student,Course
INNER JOIN CourseTakePlaceInClass
ON Course.Course_ID = CourseTakePlaceInClass.Course_ID
WHERE Student.Course_ID =  Course.Course_ID;






SELECT Teacher_ID,teacherAssignedCourse.Course_ID, Course.Course_Name,Course.Subject_Name  FROM teacherAssignedCourse JOIN Course ON Course.Course_ID =teacherAssignedCourse.Course_ID;


SELECT * FROM Student ;
SELECT * FROM Teacher ;
SELECT * FROM Course ;


SELECT * FROM teacherAssignedCourse;



-- Student go to class  to take course with  the teacher
-- teaher go to class to givae a course with the students

INSERT INTO teacherAssignedCourse VALUES (1,1);
INSERT INTO teacherAssignedCourse VALUES (1,2);

INSERT INTO teacherAssignedCourse VALUES (2,4);
INSERT INTO teacherAssignedCourse VALUES (2,5);
INSERT INTO teacherAssignedCourse VALUES (2,1);
INSERT INTO teacherAssignedCourse VALUES (2,2);



INSERT INTO Subject VALUES ('OOP');
INSERT INTO Subject VALUES ('Data Structure');

INSERT INTO Course VALUES(1,'Java','OOP');
INSERT INTO Course VALUES(2,'Java','Data Structure');
INSERT INTO Course VALUES(3,'C','Data Structure');
INSERT INTO Course VALUES(4,'Python','Data Structure');
INSERT INTO Course VALUES(5,'Python','OOP');


INSERT INTO Student VALUES(118,'Munther Anati',0591111111,1,'2000-04-14');
INSERT INTO Student VALUES(119,'Munther Anati',0591111111,2,'2000-04-14');

INSERT INTO Student VALUES(117,'Yazan Abu Nasser',0591234567,1,'2000-08-28');
INSERT INTO Student VALUES(116,'Yasmin Shadi',0591122334,2,'2000-07-18');
INSERT INTO Student VALUES(115,'Rawan Yassin',0592233445,3,'2001-06-19');
INSERT INTO Student VALUES(114,'Thaer Siam',0593344556,3,'1998-02-04');



-- Show how does the relation work 
SELECT  Course.Course_Name , Course.Subject_Name, Course_ID   FROM  Subject JOIN Course  ON Course.Subject_Name  = Subject.Subject_Name ;


-- SELECT *  FROM teacher join subject ON teacher.Subject_Name = subject.Subject_Name;
-- SELECT * FROM subject;

-- INSERT INTO teacher VALUES(1,'Munther','ENCS'
                           
-- ),(2,'Tareq','ENCC');

-- INSERT INTO subject VALUES('ENCS'
-- ),('ENfg'),('ENCC');

