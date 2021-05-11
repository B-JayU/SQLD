# order by 절
## 1. ORDER BY 절
- SQL 문장으로 조회된 데이터들을 다양한 목적에 맞게 특정 칼럼 기준으로 정렬하여 출력하는데 사용
- 칼럼 대신에 select 절에서 사용한 ALIAS 명이나 칼럼 순서를 나타내는 정수도 사용 가능
- 별도로 정렬 방식을 지정하지 않으면 오름차순이 적용
- SQL 문장의 제일 마지막에 위치

- ORDER BY 절 사용 특징
	- 기본적인 정렬 : 오름차순
	- 숫자형 데이터 오름차순 : 가장 작은 값부터 출력
	- 날짜형 데이터 오름차순 : 날짜 값이 가장 빠른 값이 먼저 출력 (시간 순서대로)
	- Oracle : NULL 값을 가장 큰 값으로 간주
	- SQL Server : NULL 값을 가장 작은 값으로 간주
	- 칼럼명이나 ALIAS 명을 대신해서 SELECT 절의 칼럼 순서를 정수로 매핑하여 사용할 수도 있다.
		- SELECT 절의 칼럼명이 길거나 정렬 조건이 많을 경우 편리하게 사용할 수 있으나, 유지보수성이나 가독성이 떨어짐.

## 2. SELECT 문자 실행 순서 ( 옵티마이저가 SQL 문장의 SYNTAN, SEMANTIC 에러를 점검하는 순서 )
- "5." SELECT 칼럼명 [ALIAS명] / 1. FROM 테이블명 / 2. WHERE 조건식 / 3. GROUP BY 칼럼 이나 표현식 / 4. HAVING 그룹조건식 / 6. ORDER BY 칼럼 이나 표현식;
- 풀이
	- 1. 발췌 대상 테이블을 참조 (FROM)
	- 2. 발췌 대상 데이터가 아닌 것은 제거 (WHERE)
	- 3. 행들을 소그룹 (Group BY)
	- 4. 그룹핑된 값의 조건에 맞는 것만을 출력 (HAVING)
	- 5. 데이터 값을 출력/계산 (SELECT)
	- 6. 데이터를 정렬 (ORDER BY)

## 3. Top N 쿼리
- ROWNUM
	- ORDER BY 절이 없는 경우 : ORACLE의 ROWNUM 조건과 SQL SERVER의 TOP 절은 같은 결과를 보인다.
	- ORDER BY 절이 있는 경우 : ORACLE의 ROWNUM 조건을 ORDER BY 절보다 먼저 처리되는 WHERE 절에서 처리
- TOP() 
	- SQL SERVER는 TOP 조건을 사용하게 되면 별도 처리 없이 관련 Order By 절의 데이터 정렬 후 원하는 일부 데이터만 쉽게 출력할 수 있다
	- TOP (Expression) [PERCENT] [WITH TIES]
		- TOP 절을 사용하여 결과 집합으로 반환되는 행 수를 제한할 수 있다.
		- WITH TIES 옵션은 ORDER BY 절의 조건 기준으로 TOP N의 마지막 행으로 표시되는 추가 행의 데이터가 같은 경우 N+ 동일 정렬 순서 데이터를 추가 반하도록 지정하는 옵션
