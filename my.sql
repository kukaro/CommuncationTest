create table mi_user(
    email VARCHAR(30) PRIMARY KEY,
    password VARCHAR(30) NOT NULL,
    username VARCHAR(30) NOT NULL
);

desc mi_user;

select * from mi_user;
select * from mi_user WHERE username like '%김%'
select * from mi_user WHERE username = '김태정';
select * from mi_user WHERE username = '김태정' or password = '1234';

insert into mi_user (email,password,username) values('kukaro4515@gmail.com','123456','태정');

insert into mi_user values('justkukaro@naver.com','1234','김태정');

insert into mi_user values('justkukaro@naver.com', 'qwer', '박유진');

/*일반적으로 잘 안씀*/
update mi_user set username='김태정정'; 

/*모든 데이터삭제*/
delete from mi_user;

delete from mi_user where username='김태정';

drop table mi_user;

SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = SCHEMA();

SELECT default_character_set_name
FROM information_schema.SCHEMATA S
WHERE schema_name = database();

/*##########*/
create TABLE music_template(
    music_template_id int PRIMARY KEY AUTO_INCREMENT,
    owner varchar(30) not null,
    music_title varchar(30) not null,
    musician varchar(30),
    CONSTRAINT fk_musictemplate_miuser_email FOREIGN KEY (owner) REFERENCES mi_user(email) on DELETE CASCADE
);

drop table music_template;

insert into music_template(owner,music_title,musician) values('justkukaro@naver.com', '학교종이 땡땡땡', '대한민국 누군가');
insert into music_template (owner,music_title,musician) values('just@naver.com', '아리랑', '대한민국 민요');

select * from music_template;

/*##########*/
create TABLE music_template_guide(
    music_template_id int,
    play_time time,
    comment text(255),
    CONSTRAINT pk_musictemplateguide_templateid_playtime PRIMARY KEY (music_template_id,play_time),
    CONSTRAINT
    fk_musictemplateguide_templateid_playtime FOREIGN KEY (music_template_id) REFERENCES music_template(music_template_id) on DELETE CASCADE
);

drop table music_template_guide;

insert into music_template_guide(music_template_id,play_time,comment) VALUES(1,"00:00:10","대충 치라능!");

select * from music_template_guide;