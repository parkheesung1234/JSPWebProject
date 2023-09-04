/*************************
3차 프로젝트 - 웹사이트 만들기
****************************/
--system계정으로 접속한 후 새로운 계정을 등록한다.

alter session set "_ORACLE_SCRIPT"=true;
create user sua_project identified by 1234;
grant connect, resource, unlimited tablespace TO sua_project;

--접속창 -> +버튼을 눌러 등록
--등록이후 sua_project계정으로 연결한 후 작업 시작.

--회원관리 테이블 생성
create table member (
    name varchar2(30) not null,
    id varchar2(30) not null,
    pass varchar2(40) not null,
    tel varchar2(50) not null,
    mobile varchar2(50) not null,
    email varchar2(100) not null,
    zipcode varchar2(5),
	addr1 varchar2(100),
	addr2 varchar2(200),
    primary key (id)
    );

select * from member;

insert into member values (
 '더조은', 'test', '1234', '02-123-4567', '010-1234-5678', 'abc1234@naver.com','12345', '서울시 종로구', '대왕빌딩 9충'
);