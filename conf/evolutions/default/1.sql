# --- First database schema

# --- !Ups

create table company (
  id                        bigint not null auto_increment,
  name                      varchar(255) not null,
  constraint pk_company primary key (id))
;

create table computer (
  id                        bigint not null auto_increment,
  name                      varchar(255) not null,
  introduced                datetime null,
  discontinued              datetime null,
  company_id                bigint,
  constraint pk_computer primary key (id))
;


alter table computer add constraint fk_computer_company_1 foreign key (company_id) references company (id) on delete restrict on update restrict;
create index ix_computer_company_1 on computer (company_id);


# --- !Downs

SET FOREIGN_KEY_CHECKS = 0

drop table if exists company;

drop table if exists computer;

SET FOREIGN_KEY_CHECKS = 1

