-- system 用户之下执行如下脚本，会创建 vip 用户，并建立 account/emp

grant dba to vip identified by vip;

drop table vip.account;
drop table vip.types;

create table vip.types(
   tid number primary key,
   tname varchar2(30)
);

insert into vip.types(tid,tname) values(1,'学生');
insert into vip.types(tid,tname) values(2,'老师');
insert into vip.types(tid,tname) values(3,'校长');
commit;



create table vip.account(
	username varchar2(20) primary key,
	password varchar2(20) not null,
	acctype int not null,
	lastlogin timestamp,
	status int default 1, 
    constraint fk_acctype foreign key (acctype) references vip.types(tid)
);



insert into vip.account values ('aaa', 'aaa', 1, null, 1);
insert into vip.account values ('bbb', 'bbb', 2, null, 1);
insert into vip.account values ('ccc', 'ccc', 2, null, 1);
insert into vip.account values ('ddd', 'ddd', 3, null, 1);
commit;


create table vip.emp as select * from scott.emp;


alter table vip.account add birthday Date;
alter table vip.account add sex number(1);
alter table vip.account add phone varchar2(11);
alter table vip.account add email varchar2(20);








-- 创建序列，用于商品表的主键
create sequence vip.seq_items start with 1000;

drop table vip.items_info;

-- 按照题目要求，创建商品信息表
create table vip.items_info
(
	id number primary key,
	name varchar2(50) not null,
	price number(9,2) not null,
	ctime timestamp not null,
	status number(1) not null
);

-- 插入几行测试数据
insert into vip.items_info (id, name, price, ctime, status) values (vip.seq_items.nextval, 'IPhone7', 7280, to_date('20160908', 'yyyymmdd'), 0);
insert into vip.items_info (id, name, price, ctime, status) values (vip.seq_items.nextval, 'IPhone6', 5380, to_date('20140409', 'yyyymmdd'), 0);
insert into vip.items_info (id, name, price, ctime, status) values (vip.seq_items.nextval, 'IPhone4', 2500, to_date('20120408', 'yyyymmdd'), 0);
commit;