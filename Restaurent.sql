drop database if exists Restaurent;
create database Restaurent;
use Restaurent;



create table Employee (
ID int primary Key,
Address  varchar(32),
birth date, 
gender varchar (32),
ename varchar(32),
designation varchar(32),
phone varchar(32),
salary int);




create table customer(
cust_id int primary key,
cname varchar(32),
email varchar(32),
address varchar(32));


create table ordert (
order_ID int primary Key,
e_ID int not null,
cust_ID int ,
order_date date,
Foreign key (e_ID) References Employee (ID),
Foreign key (cust_id) References customer (cust_id));



alter table ordert add Quantity int after cust_ID;

alter table ordert
drop Quantity;
select * from ordert;

show tables;


create Table Supplier(
ID int primary key,
Address varchar(32),
Phone varchar(32),
s_Name varchar(64)
);

insert into Supplier (ID,Address,Phone,S_Name) values 
(1,"Birzeit","0599877777","Tarek AlKhalili for Meat and poultry"),
(2,"Birzeit","05983111058","Nishan bakery"),
(3,"Ramallah","0598361134","Central Ramallah Market"),
(4,"Beitunia","0598361134","Tarifi company for drinks");
 
insert into Supplier (ID,Address,Phone,S_Name) values (5,"Ramllah","059567217","Hamoodeh Company");

create Table Ingredients(
ID int primary key,
supp_Id int,
ing_Name varchar(32),
Foreign key (supp_Id) References Supplier(ID)
);

select * from Ingredients;


insert into Ingredients (ID,supp_Id,ing_Name) values 
(1,3,"Lettuse"),
(2,3,"Tomatto"),
(3,3,"Onion"),
(4,3,"Mashroom"),
(5,3,"pickle"),
(6,3,"Hallapeno"),
(7,5,"Mayounase"),
(8,5,"Ketchup"),
(9,5,"Cheese Cheeder"),
(10,5,"Brown sauce"),
(11,5,"Cheese Toast"),
(12,1,"Chicken"),
(13,1,"Meet"),
(14,3,"Potato"),
(15,4,"CocaCola"),
(16,4,"7up"),
(17,4,"Water"),
(18,4,"Fanta");
select * from  Ingredients;
insert into Ingredients (ID,supp_Id,ing_Name) values 
(19,5,"Vinaigrette sause"),
(20,5,"Parmessan Cheese"),
(21,5,"Fried Bread"),
(22,1,"Grilled chicken breast"),
(23,3,"Cucumber"),
(24,3,"Capsicum"),
(25,3,"Black Olives"),
(26,5,"Oregano"),
(27,3,"Cherry Tomatto")
;

insert into Ingredients (ID,supp_Id,ing_Name) values (28,5,"Fetta Cheese");

create Table Meal(
ID int primary key,
m_Name varchar(32),
m_Type varchar(32),
price real
);

create Table Meal_Ing(
ing_ID int not null,
meal_ID int not null,
primary key (ing_ID,meal_ID),
foreign key (ing_ID) References Ingredients(ID),
foreign key (meal_ID) References Meal(ID)
);


insert into Meal (ID,m_Name,m_Type,price) values 
(1,"Ceaser Salad","Salad",23),
(2,"Greek Salad","Salad",23),
(3,"Chicken Salad","Salad",29),
(4,"Potato balls","Fries",12),
(5,"Potato widges","Fries",10),
(6,"Curly fries","Fries",12),
(7,"Frensh fries","Fries",7),
(8,"Sweet potato","Fries",12),
(9,"Spicy wings","Appetizeres",25),
(10,"Barbeque wings","Appetizeres",25),
(11,"Spicy wings","Appetizeres",25),
(12,"Onion rings","Appetizeres",10),
(13,"Mozarella sticks","Appetizeres",10),
(14,"Popcorn chicken","Appetizeres",20),
(15,"Cheese balls","Appetizeres",15),
(16,"Cheese sause","Appetizeres",7),
(17,"Classic Burger","Burger",32),
(18,"Hungers Burger","Burger",35),
(19,"Chicken Burger","Burger",32),
(20,"Chicken Burger","Burger",32),
(21,"Mashroom Burger","Burger",38),
(22,"Meat Burger","Burger",32);
delete from meal where id=20;
delete from meal where id=21;
delete from meal where id=22;
delete from meal where id=11;
insert into Meal (ID,m_Name,m_Type,price) values (20,"Mashroom Burger","Burger",38),
(21,"Crispy Burger","Burger",33),
(22,"Meat Burger","Burger",32),
(23,"CocaCola","Drinks",3),
(24,"7up","Drinks",3),
(25,"Water","Drinks",3),
(26,"Fanta","Drinks",3);


select * from Meal;
insert into  Meal_Ing (ing_ID,meal_ID) values 
(1,17),
(3,17),
(2,17),
(5,17),
(7,17),
(8,17),
(9,17),
(1,18),
(3,18),
(2,18),
(5,18),
(9,18),
(1,20),
(4,20),
(2,20),
(7,20),
(10,20),
(11,20),
(1,19),
(3,19),
(2,19),
(5,19),
(7,19),
(10,19),
(1,21),
(3,21),
(2,21),
(5,21),
(7,21),
(8,21),
(9,21)
;

#hala2 el salads
insert into  Meal_Ing (ing_ID,meal_ID) values 
(1,1),
(19,1),
(20,1),
(21,1),
(1,3),
(19,3),
(20,3),
(21,3),
(22,3),
(23,2),
(27,3),
(24,3),
(3,3),
(25,3),
(26,3),
(28,3)
;
insert into  Meal_Ing (ing_ID,meal_ID) values 
(27,2),
(24,2),
(3,2),
(25,2),
(26,2),
(28,2);


select * from Meal_Ing;

create Table Meal_Cust(
Cust_ID int not null,
meal_ID int not null,
Quantity int not null,
price double not null,
primary key (Cust_ID,meal_ID),
foreign key (Cust_ID) References Customer(cust_id),
foreign key (meal_ID) References Meal(ID)
);

select  * from Meal_Cust;
#weak realtionship


show tables;

insert into Employee (ID ,Address,birth,gender,ename,designation,phone,salary) values
(1,"Ramallah_Altehta",'1999-08-2',"male","Rami mostafa","cashier","0599796697",3000),
(2,"em_al_sharayet",'1996-04-9',"female","narmeen ahmad ","cashier","059944543",3000),
(3,"al_tera",'2000-04-9',"female","sara mousa ","Waiter","05621362",2500),
(4,"masyon",'2002-07-2',"male","abd tannous","Waiter","05994445",2500),
(5,"rafat",'2001-03-6',"male","ibraheem yousef","Waiter","059544354", 2500),
(6,"Beitonya",'1992-10-17',"male","Ali nasser","Waiter", "059849344",2500),
(7,"Ersal",'1996-04-11',"female","Zeina mohammed ","Waiter","059837573",2500),
(8,"masyon",'1991-08-13',"male","Abd dahbour","Chef","058939943",5500),
(9,"Ein_areek",'1994-04-9',"male","Ibraheem Wahab", "Chef" ,"059385738",5500),
(10,"al_tera",'1990-07-1',"male","Assem Barghouti ","Chef moderator","059385738",5500),
(11,"em_al_sharayet",'1993-11-11',"female","Roa jaber ","Clean Worker","059385738",2500),
(12,"jericho",'1999-05-8',"male","Basim izz ","Clean Worker","0544543554",2500),
(13,"jenin",'1998-06-7',"male"," islam Bazzar","Clean Worker","056589558",2500),
(14,"ramallah",'1995-01-1',"male","Yousef Fuqha ","Delivery","059323533",2700),
(15,"Jalzoun",'1993-06-12',"male","Mohammad Jamal ","Delivery","059864435",2700);


select * from Meal m,Meal_Ing mg,ingredients i where m.ID=mg.meal_ID And mg.ing_Id=i.ID order by m.ID;
select mg.meal_ID
 from Meal m,Meal_Ing mg,ingredients i 
where m.ID=mg.meal_ID
 And mg.ing_Id=i.ID 
GROUP BY mg.meal_ID;
 select e.ID ,e.ename,o.order_ID ,m.Cust_ID ,m.meal_ID,m.Quantity ,m.price  from Employee e,ordert o,Meal_Cust m 
 where e.ID=o.e_ID And o.cust_ID=m.Cust_ID ;

select e.ID ,e.ename,o.order_ID ,m.Cust_ID ,m.meal_ID,m.Quantity ,m.price  from Employee e,ordert o,Meal_Cust m  where e.ID=o.e_ID And o.cust_ID=m.Cust_ID ;

select * from Employee;
select * from customer;
select * from Meal;
select * from ordert;

  
   show tables;

   