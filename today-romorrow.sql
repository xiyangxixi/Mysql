# 使用今天的日期创建明天的表 如今天是2018-06-26，则表名为2018-06-27
delimiter //
create procedure test()
BEGIN
	 declare the_date date default CURDATE();
		declare cd date;
		declare ld date;
		select curdate() into cd;
		select last_day(curdate()) into ld;
		#set the_date="2018-06-30";
	if the_date=cd and the_date!=ld THEN
    #select the_date;
		SET @sqlstr = CONCAT('create table TABLE_',DATE_FORMAT(CURDATE(),'%Y%m%d'),' (id int)');
 
    PREPARE stmt1 FROM @sqlstr ;
 
    EXECUTE stmt1 ;
	ELSE
		SET @sqlstr = CONCAT('create table TABLE_',DATE_FORMAT(date_add(curdate() - day(curdate()) + 1, interval 1 month),'%Y%m%d'),' (id int)');
 
    PREPARE stmt1 FROM @sqlstr ;
 
    EXECUTE stmt1 ; 
	end if;
END //
