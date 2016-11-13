drop table if exists xademo.test_hive;
create table xademo.test_hive 
as 
select * from xademo.call_detail_records;