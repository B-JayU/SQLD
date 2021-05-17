- SQLD 기출문제 모음 1회독
  - 기출문제 모음 풀이를 통해서 챕터별, 학습내용별 부족한 부분을 찾아내어 남은 기간동안 추가학습을 할 수 있도록 한다.
# 1. 데이터 모델의 이해
## 데이터 모델링의 이해
  - 관계 (Relationship)

# 2. SQL 기본 및 활용
## SQL 기본
  ### DDL
  ### TCL
  ### where절 
   - identity 컬럼과 check 조건 / NVL
  ### 함수 
  -  문자형 함수 ( 문자 결합, length(), len(), COALESCE, CASE WHEN THEN, DECODE )
  ### Group By, Having 절 
  - Group by + having (조건)
  ### Order By 절 
  - 실행순서 , WITH TIES (rank()와 관련), 순위함수 + over )

## SQL 활용
  ### 표준 조인 
  -  SQL-> 표준 ANSI SQL 
  ### ERD 이해하기
  ### 계층형 질의와 셀프조인
  ### 서브질의 
  - select 'X' ... / NOT EXIST와 동일한 결과 / EXIST NULL / 서브쿼리에서의 컬럼사용
  ### 그룹함수 
  - Rollup, Cube, Grouping sets 
  ### 윈도우 함수 
  - 함수 + over / 순위함수 rank(), dense_rank(), row_number() / (partition 정렬 -> 범위) / 비율함수 / 함수 syntax
  ### 절차형 SQL
  - TRIGGER
  
# 3. SQL 최적화 기본 원리
## 옵티마이저와 실행계획
  ### 실행계획
  - 실행계획 해석, 순서
  ### 인덱스 기본
  - 인덱스 사용 조건절
  ### 조인 수행 원리
  - 조인의 기본 원리, SQL JOIN Mechanism
