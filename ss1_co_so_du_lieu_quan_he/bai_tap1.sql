create database student_management;
use student_management;
CREATE TABLE Class (
  `id` INT primary key auto_increment,
  `name` VARCHAR(45)
  );
  CREATE TABLE Teacher (
  `id` INT primary key auto_increment ,
  `name` VARCHAR(45),
  `age` INT,
  `country` VARCHAR(100)
  );
  


  