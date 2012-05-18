# create db
# alter table simple_shiro_web_app.ROLES_PERMISSIONS drop foreign key RP_1;
# alter table simple_shiro_web_app.ROLES_PERMISSIONS drop foreign key RP_2;
# alter table simple_shiro_web_app.USERS_ROLES drop foreign key UR_1;
# alter table simple_shiro_web_app.USERS_ROLES drop foreign key UR_2;
drop table if exists simple_shiro_web_app.PERMISSIONS;
drop table if exists simple_shiro_web_app.ROLES;
drop table if exists simple_shiro_web_app.ROLES_PERMISSIONS;
drop table if exists simple_shiro_web_app.USERS;
drop table if exists simple_shiro_web_app.USERS_ROLES;
create table simple_shiro_web_app.PERMISSIONS (name varchar(30) not null, description varchar(255), primary key (name));
create table simple_shiro_web_app.ROLES (name varchar(20) not null, description varchar(255), primary key (name));
create table simple_shiro_web_app.ROLES_PERMISSIONS (role_name varchar(20) not null, permission_name varchar(30) not null);
create table simple_shiro_web_app.USERS (username varchar(15) not null, email varchar(100), name varchar(65), password varchar(255) not null, primary key (username));
create table simple_shiro_web_app.USERS_ROLES (username varchar(15) not null, role_name varchar(20) not null);
alter table simple_shiro_web_app.ROLES_PERMISSIONS add index RP_1 (role_name), add constraint RP_1 foreign key (role_name) references simple_shiro_web_app.ROLES (name);
alter table simple_shiro_web_app.ROLES_PERMISSIONS add index RP_2 (permission_name), add constraint RP_2 foreign key (permission_name) references simple_shiro_web_app.PERMISSIONS (name);
alter table simple_shiro_web_app.USERS_ROLES add index UR_1 (username), add constraint UR_1 foreign key (username) references simple_shiro_web_app.USERS (username);
alter table simple_shiro_web_app.USERS_ROLES add index UR_2 (role_name), add constraint UR_2 foreign key (role_name) references simple_shiro_web_app.ROLES (name);

-- insert users
-- The password values are the output of Shiro's command line hasher:
-- java -jar shiro-tools-hasher-1.2.0-cli.jar -p
-- using a plaintext password of 123qwe
INSERT INTO simple_shiro_web_app.USERS (username, name, email, password) VALUES('admin', 'Administrator', 'admin@example.com', '$shiro1$SHA-256$500000$QmLtx8PaCMe72i+yVuqH+A==$P5ohK5uWi30u38ujuTnmmeUK2gPwqhxTnke2wd9fZXw=');
INSERT INTO simple_shiro_web_app.USERS (username, name, email, password) VALUES('u1', 'User P1', 'u1@example.com', '$shiro1$SHA-256$500000$QmLtx8PaCMe72i+yVuqH+A==$P5ohK5uWi30u38ujuTnmmeUK2gPwqhxTnke2wd9fZXw=');
INSERT INTO simple_shiro_web_app.USERS (username, name, email, password) VALUES('u2', 'User P2', 'u2@example.com', '$shiro1$SHA-256$500000$QmLtx8PaCMe72i+yVuqH+A==$P5ohK5uWi30u38ujuTnmmeUK2gPwqhxTnke2wd9fZXw=');

# insert roles
INSERT INTO simple_shiro_web_app.ROLES (name, description) VALUES('ADMIN', 'Administrator role');
INSERT INTO simple_shiro_web_app.ROLES (name, description) VALUES('USER_P1', 'Perfil 1');
INSERT INTO simple_shiro_web_app.ROLES (name, description) VALUES('USER_P2', 'Perfil 2');

# insert relationships
INSERT INTO simple_shiro_web_app.USERS_ROLES (username, role_name) VALUES('admin', 'ADMIN');
INSERT INTO simple_shiro_web_app.USERS_ROLES (username, role_name) VALUES('u1', 'USER_P1');
INSERT INTO simple_shiro_web_app.USERS_ROLES (username, role_name) VALUES('u2', 'USER_P2');
