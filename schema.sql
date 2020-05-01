create database coding_summary;

create table articles (
    id serial primary key,
    title text,
    body text,
    diagram_url text,
    user_id integer
);
    -- stretch
    -- xcoords_diagram integer,
    -- ycoords_diagram integer

create table users (
    email text,
    password_digest text,
    user_id serial primary key,
    username text
);

insert into users (email, password_digest, username) values ("admin@incharge.com", "poweroverwhelming", "admin") 

select * from articles;

select * from articles where id = $1;

create_user("admin@incharge.com", "poweroverwhelming", "admin")

email admin@incharge.com
username = admin
password = poweroverwhelming

insert into articles (title, body, diagram_url, user_id) values ('Datatypes', 'Oh misty eye of the mountain below. Keep careful watch of my brothers souls. And should the sky be filled with fire and smoke,. Keep watching over Durans son. I see fire inside the mountain. I see fire, burning the trees. I see fire hollowing souls and I see fire burning debris', 'https://d2vlcm61l7u1fs.cloudfront.net/media%2Fcac%2Fcace308b-042c-4c3c-811b-f1a100e23e39%2FphpzFFNCx.png', 1);

update articles where id = id set title = new_title, body = new_body, diagram_url = new diagram_url;


insert into articles (title, body, diagram_url, user_id) values ($1, $2, $3, $4);

select * from articles where user_id = 1 and title = 'Datatypes';

delete from articles where id = $1

delete from users where id = $1;

delete from articles where user_id = $1;

email lingofthesam@gmail.com
username Samuel lingofthesam
password scII

title: 'Programatic thinking' body:
The title programatic thinking might be a little misleading but this is about knowing how a machine thinks and in particular giving them instructions. We are starting here because machines think very different from humans. 

I'd like to start with an example of how we give instructions to take a step. For people would be "hey you, take a step forward"

With a machine you would have to be far more explicit. 
Lift your foot forward bending at the hip and the knee.
Lean forward and lower foot.

Imagine the smartest person you have ever met but they dont understand context at all or have any commonsense. 

When we are giving commands to machine we will use code.
Machines will read code in the same way humans read english: start at the top left read each line then move on to the next line.

Datatypes 

You can think of datatypes as the most basic block of coding.

String are an array of characters generally words and sentences.
Numbers are numbers which can be integers or decimals.
Boolean can be true or false.
Null or Nil have no value.
Object are key-value pairs which can be used to store data where if you know the key you can get the value.
Arrays are used to list or store multiple items.

Generally languages will have similar datatypes although names might change. Just keep strings, numbers, boolean, objects & arrays in mind going forward because methods or functions will take specific datatypes. 




Flow Control
As talked about in programtic thinking, computers executes a page from top to bottom. In coding flow control is the manipulation of the way the computer is executing the code. 
The main statements of flow control inlcude:
If statement used to put a condition on code will not execute the else if else in the same statement.
Else if statement puts different condition after the initial if has not been met an additional branch for it to follow.
Else when none of the conditions have been met it will run what is under else.
Loops can execute the same code multiple times.
Functions can be used to store a block of code to be called later or multiple times.

Scope

