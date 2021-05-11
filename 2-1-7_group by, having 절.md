# group by, having 절
## 1. 집계 함수
- 집계함수의 특성
	- 여러 행들의 그룹이 모여서 그룹당 단 하나의 결과를 반환하는 함수
	- GROUP BY 절은 행들을 소그룹화
	- select, having, order by 절에서 사용할 수 있다

- 집계 함수명 ([DISTINCT | ALL] 칼럼이나 표현식) 
	- ALL : Default 옵션이므로 생략 가능함.
	- DISTINCT : 같은 값을 하나의 데이터로 간주할 때 사용하는 옵션임

- 집계 함수의 종류
<table>
	<th> 
		집계함수
	<th> 사용목적
	<tr>
		<td> COUNT(*)
		<td> NULL 값을 포함한 행의 수를 출력
	<tr>
		<td> COUNT(표현식)
		<td> 표현식의 값이 NULL 값을 제외한 행의 수를 출력
	<tr>
		<td> SUM([DISTINCT | ALL] 표현식)
		<td> 표현식의 NULL 값을 제외한 합계를 출력
	<tr>
		<td> AVG([DISTINCT | ALL] 표현식)
		<td> 표현식의 NULL 값을 제외한 평균을 출력
	<tr>
		<td> MAX([DISTINCT | ALL] 표현식)
		<td> 표현식의 최대값을 출력 (문자, 날짜 데이터 타입도 사용가능)
	<tr>
		<td> MIN([DISTINCT | ALL] 표현식)
		<td> 표현식의 최소값을 출력 (문자, 날짜 데이터 타입도 사용가능)
			<tr>
		<td> STDDEV([DISTINCT | ALL] 표현식)
		<td> 표현식의 표준 편차 출력
	<tr>
		<td> VARIAN([DISTINCT | ALL] 표현식)
		<td> 표현식의 분산을 출력
</table>
			
## 2. GROUP BY 절
- SQL 문에서 FROM 절과 WHERE 절 뒤에 오며, 데이터들은 작은 그룹으로 분류하여 소그룹에 대한 항목별로 통계 정보를 얻을 때 추가로 사용
- SELECT [DISTINCT] 칼럼명 [ALIAS명] FROM 테이블명 [WHERE 조건식] [GROUP BY 칼럼(Column)이나 표현식] [HAVING 그룹조건식];
- Group by 절과 Having 절의 특성
	- Group by 절을 통해 소그룹별 기준을 정한 후, select 절에 집계 함수를 사용 ( group by 절에서 그룹 단위를 표시하지 않으면 에러 발생 )
	- 집계 함수의 통계정보는 NULL을 제외하고 수행
	- Group by 절에서는 select 절과 달리 ALIAS 명 사용불가
	- 집계함수는 where 절에 올 수 없음.
	- where 절은 전체 데이터를 Group으로 나누기 전에 행들을 미리 제거시킨다.
	- Having 절은 group by 절의 기준 항목이나 소그룹의 집계 함수를 이용한 조건을 표시할 수 있다.
	- Group by 절에 의한 소그룹별로 만들어진 집계 데이터 중, Having 절에서 제한 조건을 두어 조건을 만족하는 내용만 출력한다.
	- Having 절은 일반적으로 group by 절 뒤에 위치한다.

## 3. HAVING 절
- WHERE 절과 HAVING 절의 차이점
	- WHERE 절에는 집계 함수를 사용할 수 없다.
	- FROM 절에 정의된 집합의 개별 행에 WHERE 절의 조건절이 먼저 적용
	- WHERE 절의 조건에 맞는 행이 GROUP BY 절의 대상이 됨.
	- HAVING 절은 그룹을 나타내는 결과 집합의 행에 조건이 적용된다
- GROUP BY 절로 소그룹 그룹핑하고, 적용된 결과 값에 대한 HAVING 절의 제한 조건에 맞는 데이터를 출력
- GROUP BY 소그룹의 데이터 중 일부만 필요한 경우, WHERE 절에서 조건절을 적용하여 GROUP BY의 계산 대상을 줄이는 것이 효율적인 자원 사용측면에서 바람직

## 4. CASE 표현을 활용한 월별 데이터 집계
- "집계 함수 (CASE()) ~ GROUP BY" : 모델링의 제1정규화로 인해 반복되는 칼럼의 경우, 구분 칼럼을 두고 여러 개의 레코드로 만들어진 집합을, 정해진 칼럼 수만큼 확장해서 집계 보고서를 만드는 유용한 기법
- EX) 부서별로 월별 입사자의 평균 급여
	- STEP1. 개별 데이터 확인
		- 개별 입사정보에서 월별 데이터를 추출
	- STEP2. 월별 데이터 구분
		- 추출된 MONTH 데이터를 12개의 컬럼으로 구분
	- STEP3. 부서별 데이터 집계
		- 부서별 평균갑슬 구하기 위해 GROUP BY 절과 AVG 집계 함수를 사용

## 5. 집계 함수와 NULL
- 다중 행 함수는 입력 값으로 전체 건수가 NULL 값인 경우만 함수의 결과가 NULL이 나오고 전체 건수 중에서 일부만 NULL인 경우는 NULL인 행을 다중 행 함수의 대상에서 제외.
- CASE 표현 사용시 ELSE 절을 생략하게 되면 Default 값이 NULL이다. 
- NULL은 연산의 대상이 아님
