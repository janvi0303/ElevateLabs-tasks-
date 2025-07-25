CREATE DATABASE financetracker;

-- Users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Categories table
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Income table
CREATE TABLE income (
    income_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    amount NUMERIC(10, 2) NOT NULL,
    source VARCHAR(100),
    income_date DATE NOT NULL
);

-- Expenses table
CREATE TABLE expenses (
    expense_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    category_id INT REFERENCES categories(category_id),
    amount NUMERIC(10, 2) NOT NULL,
    description TEXT,
    expense_date DATE NOT NULL
);

--Inserting Users
INSERT INTO users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('David', 'david@example.com'),
('Emma', 'emma@example.com'),
('Farah', 'farah@example.com'),
('George', 'george@example.com'),
('Hina', 'hina@example.com'),
('Isha', 'isha@example.com'),
('John', 'john@example.com');


--Inserting categories
INSERT INTO categories (category_name) VALUES
('Groceries'),
('Rent'),
('Utilities'),
('Entertainment'),
('Transport'),
('Medical'),
('Education'),
('Dining Out');


--Inserting Income Records
INSERT INTO income (user_id, amount, source, income_date) VALUES
(1, 50000, 'Salary', '2025-07-01'),
(1, 2000, 'Freelance', '2025-07-10'),
(2, 45000, 'Salary', '2025-07-01'),
(2, 1500, 'Dividends', '2025-07-15'),
(3, 55000, 'Salary', '2025-07-01'),
(4, 52000, 'Salary', '2025-07-01'),
(5, 47000, 'Salary', '2025-07-01'),
(6, 60000, 'Salary', '2025-07-01'),
(7, 39000, 'Salary', '2025-07-01'),
(8, 43000, 'Salary', '2025-07-01'),
(9, 58000, 'Salary', '2025-07-01'),
(10, 48000, 'Salary', '2025-07-01'),
(1, 1500, 'Cashback', '2025-07-18'),
(2, 3000, 'Bonus', '2025-07-20'),
(3, 1000, 'Other', '2025-07-22'),
(4, 600, 'Side Gig', '2025-07-22'),
(5, 3500, 'Freelance', '2025-07-15'),
(6, 2200, 'Freelance', '2025-07-15'),
(7, 1700, 'Part-time', '2025-07-12'),
(8, 1500, 'Dividends', '2025-07-11'),
(9, 800, 'Other', '2025-07-10'),
(10, 2500, 'Bonus', '2025-07-05'),
(1, 7000, 'Rent Income', '2025-07-07'),
(2, 10000, 'Rent Income', '2025-07-08'),
(3, 1500, 'Reimburse', '2025-07-09'),
(4, 500, 'Freelance', '2025-07-16'),
(5, 2500, 'Bonus', '2025-07-13'),
(6, 3000, 'Bonus', '2025-07-14'),
(7, 1500, 'Other', '2025-07-17'),
(8, 1700, 'Other', '2025-07-18');


--Inserting Expense Records
INSERT INTO expenses (user_id, category_id, amount, description, expense_date) VALUES
(1, 1, 3200, 'Groceries at Big Bazaar', '2025-07-02'),
(1, 2, 15000, 'Monthly Rent', '2025-07-03'),
(1, 3, 2300, 'Electricity + Water', '2025-07-05'),
(1, 4, 1200, 'Movie night', '2025-07-08'),
(2, 1, 3100, 'Groceries', '2025-07-03'),
(2, 2, 14500, 'Rent', '2025-07-04'),
(2, 5, 700, 'Train Pass', '2025-07-06'),
(2, 6, 2200, 'Medicines', '2025-07-08'),
(3, 1, 3600, 'Groceries', '2025-07-02'),
(3, 2, 15500, 'Rent', '2025-07-03'),
(3, 4, 1100, 'Streaming services', '2025-07-09'),
(4, 1, 2900, 'Supermarket shopping', '2025-07-04'),
(4, 3, 2500, 'Water bill', '2025-07-06'),
(4, 5, 500, 'Bus fare', '2025-07-06'),
(4, 8, 1600, 'Dinner out', '2025-07-10'),
(5, 7, 4500, 'Online course fee', '2025-07-02'),
(5, 1, 2700, 'Daily groceries', '2025-07-03'),
(5, 2, 14000, 'Rent', '2025-07-05'),
(6, 3, 2100, 'Power bill', '2025-07-06'),
(6, 5, 400, 'Auto fare', '2025-07-07'),
(6, 6, 1200, 'Doctor visit', '2025-07-08'),
(7, 2, 13500, 'Monthly rent', '2025-07-03'),
(7, 1, 3000, 'Food', '2025-07-04'),
(7, 3, 1500, 'Gas bill', '2025-07-06'),
(8, 2, 14500, 'Rent', '2025-07-05'),
(8, 8, 1700, 'Restaurant', '2025-07-07'),
(8, 4, 900, 'Concert ticket', '2025-07-09'),
(9, 1, 3500, 'Grocery', '2025-07-01'),
(9, 3, 1800, 'Utility', '2025-07-03'),
(9, 5, 600, 'Transport', '2025-07-04'),
(9, 7, 3000, 'Skill course', '2025-07-10'),
(10, 1, 2900, 'Groceries', '2025-07-02'),
(10, 2, 15500, 'Flat rent', '2025-07-03'),
(10, 4, 1200, 'Weekend show', '2025-07-08'),
(10, 6, 900, 'Clinic visit', '2025-07-09'),
(1, 6, 500, 'Eye drops', '2025-07-10'),
(2, 8, 1300, 'Restaurant', '2025-07-11'),
(3, 5, 800, 'Travel expenses', '2025-07-12'),
(4, 7, 2000, 'Seminar fee', '2025-07-13'),
(5, 3, 1600, 'Gas + Internet', '2025-07-14');


-- 1.Monthly Expense Summary
SELECT e.user_id, u.name, DATE_TRUNC('month', e.expense_date)::DATE AS month,
SUM(e.amount) AS total_expenses FROM expenses e JOIN users u 
ON e.user_id = u.user_id GROUP BY e.user_id, u.name, month ORDER BY e.user_id, month;


--2.Category-Wise Spending Summary
SELECT u.name, c.category_name, SUM(e.amount) AS total_spent
FROM expenses e
JOIN users u ON e.user_id = u.user_id
JOIN categories c ON e.category_id = c.category_id
GROUP BY u.name, c.category_name
ORDER BY u.name, total_spent DESC;


--3.Create a View for Balance Tracking
CREATE VIEW user_balance AS
SELECT 
    u.name,
    COALESCE(SUM(i.amount), 0) AS total_income,
    COALESCE(SUM(e.amount), 0) AS total_expense,
    COALESCE(SUM(i.amount), 0) - COALESCE(SUM(e.amount), 0) AS balance
FROM users u
LEFT JOIN income i ON u.user_id = i.user_id
LEFT JOIN expenses e ON u.user_id = e.user_id
GROUP BY u.name;
SELECT * FROM user_balance;


--4.Top 3 Spending Categories per User
SELECT name, category_name, total_spent
FROM (
  SELECT 
    u.name,
    c.category_name,
    SUM(e.amount) AS total_spent,
    RANK() OVER (PARTITION BY u.name ORDER BY SUM(e.amount) DESC) AS rk
  FROM expenses e
  JOIN users u ON u.user_id = e.user_id
  JOIN categories c ON c.category_id = e.category_id
  GROUP BY u.name, c.category_name
) ranked
WHERE rk <= 3;


--5.Month-wise Net Savings per User
SELECT 
    u.name,
    DATE_TRUNC('month', COALESCE(i.income_date, e.expense_date))::DATE AS month,
    COALESCE(SUM(i.amount), 0) AS total_income,
    COALESCE(SUM(e.amount), 0) AS total_expenses,
    COALESCE(SUM(i.amount), 0) - COALESCE(SUM(e.amount), 0) AS net_savings
FROM users u
LEFT JOIN income i ON u.user_id = i.user_id
LEFT JOIN expenses e ON u.user_id = e.user_id 
GROUP BY u.name, month
ORDER BY u.name, month;


--6.Daily Spending Summary
SELECT 
    u.name,
    e.expense_date,
    SUM(e.amount) AS total_spent
FROM expenses e
JOIN users u ON e.user_id = u.user_id
GROUP BY u.name, e.expense_date
ORDER BY u.name, e.expense_date;


--7.Total Number of Transactions per User
SELECT 
    u.name,
    COUNT(DISTINCT e.expense_id) AS total_expenses,
    COUNT(DISTINCT i.income_id) AS total_incomes
FROM users u
LEFT JOIN expenses e ON u.user_id = e.user_id
LEFT JOIN income i ON u.user_id = i.user_id
GROUP BY u.name
ORDER BY total_expenses DESC;

--8.Recurring Monthly Expenses by Category
SELECT 
    u.name,
    c.category_name,
    COUNT(DISTINCT DATE_TRUNC('month', e.expense_date)) AS months_appeared,
    SUM(e.amount) AS total_spent
FROM expenses e
JOIN users u ON e.user_id = u.user_id
JOIN categories c ON e.category_id = c.category_id
GROUP BY u.name, c.category_name
HAVING COUNT(DISTINCT DATE_TRUNC('month', e.expense_date)) > 1
ORDER BY u.name, months_appeared DESC;


--9.Month-over-Month Expense Growth 
SELECT 
    DATE_TRUNC('month', expense_date)::DATE AS month,
    SUM(amount) AS total_expenses,
    LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', expense_date)) AS prev_month,
    ROUND(
        (SUM(amount) - LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', expense_date)))
        * 100.0 / NULLIF(LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', expense_date)), 0), 2
    ) AS percent_change
FROM expenses
WHERE user_id = 1
GROUP BY month
ORDER BY month;


--10.Total Expense per Category Across All Users
SELECT 
    c.category_name,
    SUM(e.amount) AS total_spent
FROM expenses e
JOIN categories c ON c.category_id = e.category_id
GROUP BY c.category_name
ORDER BY total_spent DESC;


--11.Weekly Spending Report
SELECT 
    u.name,
    DATE_TRUNC('week', e.expense_date)::DATE AS week_start,
    SUM(e.amount) AS weekly_spent
FROM expenses e
JOIN users u ON e.user_id = u.user_id
GROUP BY u.name, week_start
ORDER BY u.name, week_start;


-- 12.Income by source
SELECT source, SUM(amount) AS total_income
FROM income
GROUP BY source
ORDER BY total_income DESC;

-- 13.Expense by description keyword (optional pattern match)
SELECT 
    CASE 
        WHEN description ILIKE '%grocery%' THEN 'Groceries'
        WHEN description ILIKE '%rent%' THEN 'Rent'
        ELSE 'Other'
    END AS type,
    SUM(amount) AS total_spent
FROM expenses
GROUP BY type;


--14.Highest Single Expense per User
SELECT 
    u.name,
    MAX(e.amount) AS highest_expense
FROM expenses e
JOIN users u ON u.user_id = e.user_id
GROUP BY u.name
ORDER BY highest_expense DESC;


--15.Users Whose Balance Is Less Than ₹5,000
SELECT * 
FROM user_balance
WHERE balance < 500000
ORDER BY balance;

--Most Used Expense Category per User
SELECT name, category_name, total_times
FROM (
  SELECT 
    u.name,
    c.category_name,
    COUNT(*) AS total_times,
    RANK() OVER (PARTITION BY u.name ORDER BY COUNT(*) DESC) AS rk
  FROM expenses e
  JOIN users u ON u.user_id = e.user_id
  JOIN categories c ON c.category_id = e.category_id
  GROUP BY u.name, c.category_name
) ranked
WHERE rk = 1;