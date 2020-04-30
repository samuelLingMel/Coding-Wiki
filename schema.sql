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
