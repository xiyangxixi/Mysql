# 创建当前日期15天后的表

delimiter //
create procedure table_fif()
BEGIN



SET @sqlstr = CONCAT('create table TABLE_',DATE_FORMAT(DATE_SUB(curdate(), interval -15 DAY),'%Y%m%d'),' (id int)');
 
    PREPARE stmt1 FROM @sqlstr ;
 
    EXECUTE stmt1 ; 

END //
