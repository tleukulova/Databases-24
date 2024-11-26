--task1
CREATE FUNCTION INCREASEBY10(A INTEGER) RETURNS INTEGER AS
$$
BEGIN
    RETURN A + 10;
END;
$$
LANGUAGE PLPGSQL;

SELECT INCREASEBY10(15);

--task2
CREATE FUNCTION COMPARE_NUMBERS(A INTEGER, B INTEGER)
RETURNS TEXT AS $$
DECLARE RESULT TEXT;
BEGIN
    IF A > B THEN
        RESULT := 'GREATER';
    ELSIF A = B THEN
        RESULT := 'EQUAL';
    ELSE
        RESULT := 'LESSER';
    END IF;
    RETURN RESULT;
END;
$$ LANGUAGE PLPGSQL;

SELECT COMPARE_NUMBERS(18, 20);

--task3
CREATE FUNCTION NUMBER_SERIES(N INTEGER)
RETURNS SETOF INTEGER AS
$$
DECLARE
    I INTEGER := 1;
BEGIN
    WHILE I <= N LOOP
        RETURN NEXT I;
        I := I + 1;
    END LOOP;
END;
$$
LANGUAGE PLPGSQL;

SELECT NUMBER_SERIES(8);

--task4
CREATE OR REPLACE FUNCTION FIND_EMPLOYEE(EMP_NAME VARCHAR)
RETURNS TABLE(
    FIRST_NAME VARCHAR,
    LAST_NAME VARCHAR,
    EMAIL VARCHAR,
    SALARY INTEGER
) AS
$$
BEGIN
    RETURN QUERY
    SELECT
        EMPLOYEES.FIRST_NAME,
        EMPLOYEES.LAST_NAME,
        EMPLOYEES.EMAIL,
        EMPLOYEES.SALARY
    FROM EMPLOYEES
    WHERE EMPLOYEES.FIRST_NAME = EMP_NAME;
END;
$$
LANGUAGE PLPGSQL;

SELECT * FROM FIND_EMPLOYEE('PAKITA');

--task5
CREATE OR REPLACE FUNCTION LIST_PRODUCTS(CATEGORY_NAME VARCHAR)
RETURNS TABLE(P_ID INTEGER, P_NAME VARCHAR, PRICE INTEGER) AS
$$
BEGIN
    RETURN QUERY
    SELECT ID, NAME, PRICE
    FROM PRODUCTS
    WHERE CATEGORY = CATEGORY_NAME;
END;
$$
LANGUAGE PLPGSQL;

--task6
CREATE OR REPLACE FUNCTION CALCULATE_BONUS(SALARY DOUBLE PRECISION, PERCENTAGE INT)
RETURNS FLOAT AS
$$
BEGIN
    RETURN SALARY * (1 + (PERCENTAGE::FLOAT / 100));
END;
$$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION UPDATE_SALARY(EMP_NAME VARCHAR(50), PERCENTAGE INT)
RETURNS FLOAT AS
$$
DECLARE
    CURRENT_SAL FLOAT;
    BONUS FLOAT;
BEGIN
    SELECT SALARY INTO CURRENT_SAL
    FROM EMPLOYEES
    WHERE NAME = EMP_NAME;

    BONUS = CALCULATE_BONUS(CURRENT_SAL, PERCENTAGE);

    RETURN BONUS;
END;
$$
LANGUAGE PLPGSQL;

SELECT CALCULATE_BONUS(300000, 50);

--task7
CREATE OR REPLACE FUNCTION COMPLEX_CALCULATION(NUM INTEGER, STR VARCHAR)
RETURNS TEXT AS
$$
DECLARE
    NUMERIC_RESULT INTEGER;
    STRING_RESULT VARCHAR;
BEGIN
    NUMERIC_RESULT := NUM * NUM;

    STRING_RESULT := 'HELLO, ' || STR || '!';

    RETURN 'NUMERIC RESULT: ' || NUMERIC_RESULT || ', MESSAGE: ' || STRING_RESULT;
END;
$$
LANGUAGE PLPGSQL;

SELECT COMPLEX_CALCULATION(5, 'WORLD');