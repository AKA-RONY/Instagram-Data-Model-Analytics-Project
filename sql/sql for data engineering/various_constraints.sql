--insert into cus1(c_id,c_name) values
--(1,'rony'),
--(2,'jonny'),
--(3,'tony') 
--;
select * from cus1;
select* from order1;
alter table order1 drop constraint order1_pkey
alter table cus1 add constraint pk_cus_id primary key(c_id);
alter table order1 add constraint fk_cus_id foreign key(c_id) references cus1(c_id);
delete from order1 where c_id=5;
insert into order1(o_id,c_id,order_date)  values
(1,1,'2002-4-2');
alter table order1 add constraint check_date check(order_date<'2003-04-02')

alter table employee add constraint ck_salary check(salary>50000)
alter table student add constraint uique_student unique(sid)
alter table order1 add constraint  fk_order2 foreign key(c_id) references cus1(c_id) on delete cascade
alter table order1 drop constraint fk_order2

select* from order1;
select* from cus1;
delete from cus1 where c_id=1;
insert into order1 values(1,1,'2002-4-4')
alter table order1 add constraint  ck_ord check()

