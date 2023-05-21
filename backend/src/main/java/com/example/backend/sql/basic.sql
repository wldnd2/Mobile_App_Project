-- 데이터베이스 생성
drop database TEST_DB;
create database TEST_DB;
use TEST_DB;

-- 사용자 생성 및 데이터베이스 권한 부여
drop user 'test'@'localhost';
create user test@localhost identified by "123!@#";
GRANT ALL PRIVILEGES ON TEST_DB.* TO test@localhost;

-- 확인
show tables;