
/*
select * from author
*/

SELECT book_id, title, published_year FROM Book;


SELECT title, published_year
FROM Book
WHERE published_year > 2005;


SELECT title, published_year
FROM Book
WHERE published_year < 2000 OR published_year IS NULL;


SELECT name, email, join_date
FROM Member
WHERE email IS NOT NULL
  AND join_date > '2025-01-01';


SELECT name, email
FROM Author
WHERE name LIKE 'S%';


SELECT title
FROM Book
WHERE title LIKE '%Malar%';


SELECT title, published_year
FROM Book
WHERE published_year BETWEEN 2000 AND 2010;


SELECT member_id, name, join_date
FROM Member
ORDER BY join_date DESC;


SELECT title, published_year
FROM Book
ORDER BY published_year DESC
LIMIT 5;


SELECT published_year, COUNT(*) AS total_books
FROM Book
WHERE published_year IS NOT NULL
GROUP BY published_year
ORDER BY published_year;


SELECT
    l.member_id, 
    COUNT(l.loan_id)  AS total_loans,
    MAX(l.loan_date) AS last_loan_date
FROM Loan AS l
WHERE l.loan_date BETWEEN '2025-01-01' AND CURRENT_DATE   
GROUP BY l.member_id
HAVING COUNT(l.loan_id) >= 1                              
ORDER BY last_loan_date DESC
LIMIT 5;                                      


SELECT
    m.name,
    COUNT(m.member_id) AS total_records,  
    MAX(m.join_date)   AS last_join_date
FROM Member AS m
WHERE
      m.join_date BETWEEN '2025-01-01' AND CURRENT_DATE  
  AND m.name LIKE '%a%'
GROUP BY m.name
HAVING COUNT(m.member_id) >= 1                           
ORDER BY last_join_date DESC
LIMIT 5;                              


SELECT
    b.book_id,
    b.title,
    COUNT(b.book_id) AS book_count,        
    MAX(b.published_year) AS latest_year   
FROM Book AS b
WHERE b.published_year BETWEEN 2000 AND YEAR(CURRENT_DATE)  
GROUP BY b.book_id, b.title
HAVING COUNT(b.book_id) >= 1
ORDER BY latest_year DESC
LIMIT 5;


