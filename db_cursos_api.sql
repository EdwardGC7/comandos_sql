CREATE TABLE "users" (
  "user_id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE,
  "password" varchar NOT NULL,
  "age" int,
  "role_fk" int
);

CREATE TABLE "courses" (
  "course_id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "title" varchar NOT NULL,
  "description" text,
  "level" varchar NOT NULL,
  "teacher" int NOT NULL,
  "category_fk" int
);

CREATE TABLE "course_videos" (
  "video_id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL,
  "course_fk" int
);

CREATE TABLE "categories" (
  "category_id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL
);

CREATE TABLE "roles" (
  "role_id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL
);

CREATE TABLE "courses_teachers" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "teacher_fk" int,
  "course_fk" int
);

ALTER TABLE "users" ADD FOREIGN KEY ("role_fk") REFERENCES "roles" ("role_id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_fk") REFERENCES "courses" ("course_id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_fk") REFERENCES "categories" ("category_id");

ALTER TABLE "courses_teachers" ADD FOREIGN KEY ("teacher_fk") REFERENCES "users" ("user_id");

ALTER TABLE "courses_teachers" ADD FOREIGN KEY ("course_fk") REFERENCES "courses" ("course_id");



insert into roles (
	name
) values (
  'Teacher'
), (
  'Student'
), (
  'Admin'
);


insert into users (
	name,
	email,
	password,
  age,
  role_fk 
) values (
  'Francisco Medina',
	'fmedina@gmail.com',
	'123456',
	24,
  2
), (
	'Rosaura Hernandez',
	'rhernandez@gmail.com',
	'123456',
	31,
  1
);

insert into categories (
	name
) values (
  'Programming'
), (
	'Cooking'
);

insert into courses (
	title,
  description,
  level,
  teacher,
  category_fk
) values (
  'Linkedin para programadores',
  'Rapido tutorial de como usar Linkedin para programadores',
  'midlevel',
  2,
  1
), (
  'Tacos al pastor',
  'Tutorial de como preparar unos tacos al pastor de Pork Belly',
  'advanced',
  2,
  2
);

insert into course_videos (
	title,
  url,
  course_fk
) values (
  'Linkedin para programadores',
  'https://www.youtube.com/watch?v=YfmjIuDUiss',
  1
), (
  'Tacos al pastor',
  'https://www.youtube.com/watch?v=nqXc8hYJbd8',
  2
);

insert into courses_teachers (
	teacher_fk,
  course_fk
) values (
  2,
  1
), (
  2,
  2
); 