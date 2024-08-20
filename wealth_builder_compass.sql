create database Wealth_Builder_Compass;
use wealth_builder_compass;

-- Create Investor table
CREATE TABLE Investor (
    InvestorID INT PRIMARY KEY, 
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    RiskToleranceLevel ENUM('Low', 'Medium', 'High') NOT NULL,
    InvestmentGoals VARCHAR(255)
);

-- Create Portfolio table
CREATE TABLE Portfolio (
    PortfolioID INT PRIMARY KEY, 
    InvestorID INT,
    Name VARCHAR(255) NOT NULL,
    InceptionDate DATE NOT NULL,
    Value DECIMAL(15,2),  
    FOREIGN KEY (InvestorID) REFERENCES Investor(InvestorID)
);

-- Create AssetClass table
CREATE TABLE AssetClass (
    AssetClassID INT PRIMARY KEY, 
    Name VARCHAR(255) NOT NULL,
    Description TEXT
);

-- Create Asset table
CREATE TABLE Asset (
    AssetID INT PRIMARY KEY,
    AssetClassID INT,
    Name VARCHAR(255) NOT NULL,
    TickerSymbol VARCHAR(10),
    CurrentPrice DECIMAL(15,2),
    FOREIGN KEY (AssetClassID) REFERENCES AssetClass(AssetClassID)
);

-- Create PortfolioHolding table
CREATE TABLE PortfolioHolding (
    PortfolioID INT,
    AssetID INT,
    Quantity DECIMAL(15,2) NOT NULL,
    PurchasePrice DECIMAL(15,2) NOT NULL,
    PurchaseDate DATE NOT NULL,
    PRIMARY KEY (PortfolioID, AssetID),
    FOREIGN KEY (PortfolioID) REFERENCES Portfolio(PortfolioID),
    FOREIGN KEY (AssetID) REFERENCES Asset(AssetID)
);

-- Create Transaction table
CREATE TABLE Transaction (
    TransactionID INT PRIMARY KEY, 
    PortfolioID INT,
    AssetID INT,
    TransactionType ENUM('Buy', 'Sell') NOT NULL,
    Quantity DECIMAL(15,2) NOT NULL,
    Price DECIMAL(15,2) NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (PortfolioID) REFERENCES Portfolio(PortfolioID),
    FOREIGN KEY (AssetID) REFERENCES Asset(AssetID)
);

-- Create Benchmark table
CREATE TABLE Benchmark (
    BenchmarkID INT PRIMARY KEY, 
    Name VARCHAR(255) NOT NULL,
    Description TEXT
);

-- Create PortfolioBenchmark table
CREATE TABLE PortfolioBenchmark (
    PortfolioID INT,
    BenchmarkID INT,
    PRIMARY KEY (PortfolioID, BenchmarkID),
    FOREIGN KEY (PortfolioID) REFERENCES Portfolio(PortfolioID) ON DELETE CASCADE,
    FOREIGN KEY (BenchmarkID) REFERENCES Benchmark(BenchmarkID) ON DELETE CASCADE
);

INSERT INTO Investor (InvestorID, Name, Email, RiskToleranceLevel, InvestmentGoals)
VALUES
(100, 'Aryan Sharma', 'aryan.sharma@email.com', 'Medium', 'Retirement'),
(101, 'Isha Patel', 'isha.patel@email.com', 'Low', 'Education'),
(102, 'Rahul Verma', 'rahul.verma@email.com', 'High', 'Business Growth'),
(103, 'Priya Gupta', 'priya.gupta@email.com', 'Medium', 'Property Purchase'),
(104, 'Rajesh Kumar', 'rajesh.kumar@email.com', 'Low', 'Savings'),
(105, 'Neha Singh', 'neha.singh@email.com', 'High', 'Startup Investment'),
(106, 'Amit Kapoor', 'amit.kapoor@email.com', 'Medium', 'Travel'),
(107, 'Anjali Reddy', 'anjali.reddy@email.com', 'Low', 'Childrens Education'),
(108, 'Vijay Patel', 'vijay.patel@email.com', 'High', 'Luxury Purchase'),
(109, 'Sona Kaur', 'sona.kaur@email.com', 'Medium', 'Financial Independence'),
(110, 'Vikram Singh', 'vikram.singh@email.com', 'Low', 'Emergency Fund'),
(111, 'Maya Sharma', 'maya.sharma@email.com', 'High', 'Real Estate Investment'),
(112, 'Deepak Kumar', 'deepak.kumar@email.com', 'Medium', 'Debt Repayment'),
(113, 'Anika Rao', 'anika.rao@email.com', 'Low', 'Health Care'),
(114, 'Sanjay Gupta', 'sanjay.gupta@email.com', 'High', 'Philanthropy'),
(115, 'Meera Patel', 'meera.patel@email.com', 'Medium', 'Early Retirement'),
(116, 'Kabir Khan', 'kabir.khan@email.com', 'Low', 'Wedding Expenses'),
(117, 'Rhea Kapoor', 'rhea.kapoor@email.com', 'High', 'Art Collection'),
(118, 'Aditya Verma', 'aditya.verma@email.com', 'Medium', 'Childrens Future'),
(119, 'Riya Singh', 'riya.singh@email.com', 'Low', 'Down Payment on House'),
(120, 'Arjun Reddy', 'arjun.reddy@email.com', 'High', 'Technology Stocks'),
(121, 'Pooja Sharma', 'pooja.sharma@email.com', 'Medium', 'Career Development'),
(122, 'Rohan Kumar', 'rohan.kumar@email.com', 'Low', 'Long-term Investment'),
(123, 'Nisha Patel', 'nisha.patel@email.com', 'High', 'Venture Capital'),
(124, 'Mira Mehta', 'mira.mehta@email.com', 'Medium', 'Retirement');

select * from wealth_builder_compass.investor;

INSERT INTO Portfolio (PortfolioID, InvestorID, Name, InceptionDate) VALUES
(3700, 111, 'Lakshmi Nidhi', '2022-04-18'),
(3701, 118, 'Samriddhi', '2019-10-03'),
(3702, 115, 'Suraksha Kavach', '2018-06-18'),
(3703, 118, 'Udaan', '2020-03-20'),
(3704, 117, 'Nivesh', '2019-05-22'),
(3705, 120, 'Samruddhi Path', '2018-07-31'),
(3706, 100, 'Disha', '2023-02-02'),
(3707, 113, 'Pragati', '2023-10-23'),
(3708, 121, 'Aarambh', '2023-06-11'),
(3709, 107, 'Vishwas', '2022-03-15'),
(3710, 107, 'Abhyudaya', '2022-12-18'),
(3711, 102, 'Suraksha', '2022-08-18'),
(3712, 117, 'Sapna', '2023-05-15'),
(3713, 102, 'Vridhi', '2018-12-31'),
(3714, 118, 'Tarakki', '2021-05-17'),
(3715, 111, 'Unnati', '2022-08-20'),
(3716, 106, 'Vikas', '2019-09-11'),
(3717, 110, 'Aasha', '2019-02-14'),
(3718, 110, 'Koshish', '2020-09-02'),
(3719, 104, 'Samarth', '2019-08-28'),
(3720, 105, 'Nishchay', '2020-01-24'),
(3721, 114, 'Prarambh', '2019-04-10'),
(3722, 110, 'Yash', '2023-12-18'),
(3723, 108, 'Kalpavriksha', '2019-03-06'),
(3724, 119, 'Samruddhi', '2018-06-29'),
(3725, 119, 'Vijay', '2018-09-10'),
(3726, 114, 'Dhan Varsha', '2022-03-14'),
(3727, 103, 'Sthir', '2022-02-21'),
(3728, 102, 'Aviral', '2022-09-20'),
(3729, 108, 'Unmesh', '2022-07-18'),
(3730, 119, 'Vardhan', '2020-08-28'),
(3731, 112, 'Samruddhi', '2022-11-07'),
(3732, 111, 'Dhruv', '2021-10-28'),
(3733, 101, 'Aarohi', '2020-06-17'),
(3734, 120, 'Vihaan', '2023-09-22'),
(3735, 109, 'Aarambh', '2020-01-24'),
(3736, 116, 'Vridhi', '2023-02-02'),
(3737, 122, 'Vishwas', '2022-12-18'),
(3738, 123, 'Udaan', '2019-10-03'),
(3739, 124, 'Sapna', '2022-07-18');

select * from wealth_builder_compass.portfolio;

INSERT INTO AssetClass (AssetClassID, Name, Description)
VALUES
(10, 'Stocks', 'Shares of ownership in a company'),
(11, 'Bonds', 'Debt instruments issued by companies or governments'),
(12, 'Mutual Funds', 'Pooled investment funds that invest in a variety of assets'),
(13, 'ETFs', 'Exchange-traded funds that track a specific index or sector'),
(14, 'Real Estate', 'Property investments, including residential and commercial'),
(15, 'Commodities', 'Raw materials like gold, oil, or agricultural products'),
(16, 'Fixed Deposits', 'Low-risk bank deposits with a fixed interest rate'),
(17, 'Cash and Equivalents', 'Highly liquid assets like cash, money market funds'),
(18, 'Alternative Investments', 'Hedge funds, private equity, or venture capital');


INSERT INTO Asset (AssetID, AssetClassID, Name, TickerSymbol, CurrentPrice)
VALUES
-- Stocks
(2000, 10, 'Reliance Industries', 'RELIANCE', 2500.50),
(2001, 10, 'HDFC Bank', 'HDFCBANK', 1600.25),
(2002, 10, 'Infosys', 'INFY', 1450.75),
(2003, 10, 'Tata Consultancy Services', 'TCS', 3300.00),

-- Bonds
(2004, 11, 'Government Bond 2030', 'GOVT2030', 102.50),
(2005, 11, 'SBI Corporate Bond', 'SBICORP', 98.75),

-- Mutual Funds
(2006, 12, 'Axis Bluechip Fund', 'AXISBLUE', 55.20),
(2007, 12, 'HDFC Balanced Advantage Fund', 'HDFCBAL', 48.95),
(2008, 12, 'SBI Small Cap Fund', 'SBISMALL', 62.30),

-- ETFs
(2009, 13, 'NIFTY 50 ETF', 'NIFTYBEES', 180.50),
(2010, 13, 'SENSEX ETF', 'SETFNIF50', 375.00),

-- Real Estate (Indicative Prices)
(2011, 14, 'Apartment in Mumbai', 'MUMAPT', 15000000),
(2012, 14, 'Land in Bangalore', 'BLRLAND', 8000000),

-- Commodities (Indicative Prices)
(2013, 15, 'Gold', 'GOLD', 50000),  
(2014, 15, 'Crude Oil', 'CRUDE', 80), 

-- Fixed Deposits
(2015, 16, 'SBI Fixed Deposit', 'SBIFD', NULL), -- Interest rate varies 

-- Cash and Equivalents
(2016, 17, 'Savings Account', 'SAVINGS', NULL),
(2017, 17, 'Liquid Fund', 'LIQUIDF', 10.00), -- NAV (Net Asset Value)

-- Alternative Investments
(2018, 18, 'Private Equity Fund A', 'PEFUNDA', NULL), -- Illiquid, value not readily available
(2019, 18, 'Hedge Fund B', 'HEDGEB', NULL);

SET SQL_SAFE_UPDATES = 0;

UPDATE Asset
SET CurrentPrice = CASE
    WHEN AssetClassID = 16 THEN 6.5  -- Fixed Deposits (Indicative Interest Rate)
    WHEN AssetClassID = 17 AND AssetID = 2016 THEN 1000000 -- Savings Account Balance (Example)
    WHEN AssetClassID = 17 AND AssetID = 2017 THEN 10.00 -- Liquid Fund NAV
    WHEN AssetClassID = 18 THEN 500000 -- Alternative Investments (Estimated Value)
END
WHERE AssetID IN (2015, 2016, 2017, 2018, 2019);

select * from asset;
select * from assetclass;
select * from investor;
select * from portfolio;

INSERT INTO PortfolioHolding (PortfolioID, AssetID, Quantity, PurchasePrice, PurchaseDate)
VALUES
  (3701, 2000, 100, 2450.00, '2023-05-15'),
  (3702, 2001, 50, 1550.00, '2022-08-20'),
  (3703, 2002, 75, 1380.00, '2021-11-10'),
  (3704, 2003, 120, 3200.00, '2020-02-25'),
  (3705, 2004, 200, 101.50, '2023-03-08'),
  (3706, 2005, 150, 97.25, '2022-06-12'),
  (3707, 2006, 80, 54.00, '2021-09-20'),
  (3708, 2007, 100, 47.50, '2020-12-30'),
  (3709, 2008, 60, 61.00, '2023-04-18'),
  (3710, 2009, 150, 178.00, '2022-07-25'),
  (3711, 2010, 80, 370.00, '2021-10-15'),
  (3712, 2011, 2, 14800000.00, '2023-01-20'),
  (3713, 2012, 3, 7800000.00, '2022-04-28'),
  (3714, 2013, 100, 49000.00, '2021-08-12'),
  (3715, 2014, 50, 78.00, '2020-11-23'),
  (3716, 2015, 1000000, 6.50, '2023-02-01'),
  (3717, 2016, 500000, 1000000.00, '2022-05-18'),
  (3718, 2017, 200, 9.80, '2021-09-02'),
  (3719, 2018, 100, 500000.00, '2020-12-15'),
  (3720, 2019, 50, 500000.00, '2023-03-22'),
  (3721, 2000, 80, 2400.00, '2022-07-10'),
  (3722, 2001, 120, 1520.00, '2021-10-25'),
  (3723, 2002, 50, 1400.00, '2020-01-30'),
  (3724, 2003, 100, 3150.00, '2023-05-05');
  
  select * from portfolioholding;
  select * from portfoliobenchmark;
  
  INSERT INTO Benchmark (BenchmarkID, Name, Description)
VALUES
  (1, 'NIFTY 50', 'A benchmark representing the top 50 companies listed on the National Stock Exchange of India'),
  (2, 'Sensex', 'A benchmark representing the 30 largest companies listed on the Bombay Stock Exchange'),
  (3, 'MSCI Emerging Markets Index', 'A benchmark tracking the performance of emerging market stocks globally'),
  (4, 'S&P 500', 'A benchmark representing the 500 largest companies listed on the New York Stock Exchange'),
  (5, 'Nasdaq Composite', 'A benchmark representing all common stocks listed on the Nasdaq stock market'),
  (6, 'FTSE 100', 'A benchmark representing the 100 largest companies listed on the London Stock Exchange'),
  (7, 'Hang Seng Index', 'A benchmark representing the top 50 companies listed on the Hong Kong Stock Exchange'),
  (8, 'Nikkei 225', 'A benchmark representing the 225 largest companies listed on the Tokyo Stock Exchange'),
  (9, 'CAC 40', 'A benchmark representing the 40 largest companies listed on the Paris Stock Exchange'),
  (10, 'DAX 30', 'A benchmark representing the 30 largest companies listed on the Frankfurt Stock Exchange'),
  (11, 'Gold Price', 'The price of gold per ounce'),
  (12, 'Crude Oil Price', 'The price of crude oil per barrel'),
  (13, 'US 10-Year Treasury Yield', 'The interest rate on 10-year US Treasury bonds'),
  (14, 'MSCI World Index', 'A benchmark representing the performance of developed market stocks globally'),
  (15, 'Russell 2000', 'A benchmark representing the smallest 2000 companies listed on the US stock market'),
  (16, 'Bloomberg Barclays US Aggregate Bond Index', 'A benchmark representing the performance of US investment-grade bonds'),
  (17, 'Dow Jones Industrial Average', 'A benchmark representing 30 large, well-known US companies'),
  (18, 'MSCI Emerging Markets Bond Index', 'A benchmark representing the performance of emerging market bonds'),
  (19, 'FTSE All-World Index', 'A benchmark representing the performance of global stocks'),
  (20, 'S&P GSCI Commodities Index', 'A benchmark tracking the performance of a basket of commodities'),
  (21, 'MSCI Asia Pacific Index', 'A benchmark representing the performance of Asian Pacific stocks'),
  (22, 'JPMorgan Emerging Markets Bond Index', 'A benchmark representing the performance of emerging market bonds'),
  (23, 'Russell 3000', 'A benchmark representing the 3000 largest US companies'),
  (24, 'MSCI Latin America Index', 'A benchmark representing the performance of Latin American stocks'),
  (25, 'Bloomberg Barclays US Corporate Bond Index', 'A benchmark representing the performance of US corporate bonds');
  
  INSERT INTO PortfolioBenchmark (PortfolioID, BenchmarkID)
VALUES
  (3701, 1),
  (3702, 2),
  (3703, 3),
  (3704, 4),
  (3705, 5),
  (3706, 6),
  (3707, 7),
  (3708, 8),
  (3709, 9),
  (3710, 10),
  (3711, 11),
  (3712, 12),
  (3713, 13),
  (3714, 14),
  (3715, 15),
  (3716, 16),
  (3717, 17),
  (3718, 18),
  (3719, 19),
  (3720, 20),
  (3721, 21),
  (3722, 22),
  (3723, 23),
  (3724, 24),
  (3725, 25);
  
  select * from benchmark;
  select * from portfoliobenchmark;
  
  INSERT INTO Transaction (TransactionID, PortfolioID, AssetID, TransactionType, Quantity, Price, Date)
VALUES
  (12345, 3701, 2000, 'Buy', 100, 2450.00, '2023-05-15'),
  (12346, 3702, 2001, 'Sell', 50, 1550.00, '2022-08-20'),
  (12347, 3703, 2002, 'Buy', 75, 1380.00, '2021-11-10'),
  (12348, 3704, 2003, 'Sell', 120, 3200.00, '2020-02-25'),
  (12349, 3705, 2004, 'Buy', 200, 101.50, '2023-03-08'),
  (12350, 3706, 2005, 'Sell', 150, 97.25, '2022-06-12'),
  (12351, 3707, 2006, 'Buy', 80, 54.00, '2021-09-20'),
  (12352, 3708, 2007, 'Sell', 100, 47.50, '2020-12-30'),
  (12353, 3709, 2008, 'Buy', 60, 61.00, '2023-04-18'),
  (12354, 3710, 2009, 'Sell', 150, 178.00, '2022-07-25'),
  (12355, 3711, 2010, 'Buy', 80, 370.00, '2021-10-15'),
  (12356, 3712, 2011, 'Buy', 2, 14800000.00, '2023-01-20'),
  (12357, 3713, 2012, 'Sell', 3, 7800000.00, '2022-04-28'),
  (12358, 3714, 2013, 'Buy', 100, 49000.00, '2021-08-12'),
  (12359, 3715, 2014, 'Sell', 50, 78.00, '2020-11-23'),
  (12360, 3716, 2015, 'Buy', 1000000, 6.50, '2023-02-01'),
  (12361, 3717, 2016, 'Sell', 500000, 1000000.00, '2022-05-18'),
  (12362, 3718, 2017, 'Buy', 200, 9.80, '2021-09-02'),
  (12363, 3719, 2018, 'Sell', 100, 500000.00, '2020-12-15'),
  (12364, 3720, 2019, 'Buy', 50, 500000.00, '2023-03-22'),
  (12365, 3721, 2000, 'Sell', 80, 2400.00, '2022-07-10'),
  (12366, 3722, 2001, 'Buy', 120, 1520.00, '2021-10-25'),
  (12367, 3723, 2002, 'Sell', 50, 1400.00, '2020-01-30'),
  (12368, 3724, 2003, 'Buy', 100, 3150.00, '2023-05-05'),
  (12369, 3725, 2004, 'Sell', 100, 100.00, '2023-06-01');
  
  
  SELECT * FROM Investor;
  SELECT * FROM Investor WHERE RiskToleranceLevel = 'Medium';
  SELECT * FROM Investor WHERE InvestorID = 102;
  
  
-- Update Values
UPDATE Investor
SET Name = 'Aryan Sharma (Updated)'
WHERE InvestorID = 100;

DELETE FROM Investor WHERE InvestorID = 110;

SELECT * FROM Portfolio;
SELECT * FROM Portfolio WHERE PortfolioID = 3700;

UPDATE Portfolio SET Value = 1000000 WHERE PortfolioID = 3700;

DELETE FROM Portfolio WHERE PortfolioID = 3701;

-- Read (Select) all data from the AssetClass table
SELECT * FROM AssetClass;

-- Read (Select) specific data from the AssetClass table based on conditions
SELECT AssetClassID, Name FROM AssetClass WHERE AssetClassID = 10;

-- Update a specific record in the AssetClass table
UPDATE AssetClass SET Description = 'A collection of stocks representing a specific market index' WHERE AssetClassID = 13;

-- Delete a specific record from the AssetClass table
DELETE FROM AssetClass WHERE AssetClassID = 15;

-- Read (Select) all data from the Asset table
SELECT * FROM Asset;

-- Read (Select) specific data from the Asset table based on conditions
SELECT AssetID, Name, TickerSymbol, CurrentPrice FROM Asset WHERE AssetClassID = 10;

-- Update a specific record in the Asset table
UPDATE Asset SET CurrentPrice = 2550.00 WHERE AssetID = 2000;

-- Delete a specific record from the Asset table
DELETE FROM Asset WHERE AssetID = 2001;

-- PortfolioHolding table

-- Read (Select) all data from the PortfolioHolding table
SELECT * FROM PortfolioHolding;

-- Read (Select) specific data from the PortfolioHolding table based on conditions
SELECT PortfolioID, AssetID, Quantity, PurchasePrice FROM PortfolioHolding WHERE PortfolioID = 3707;

-- Update a specific record in the PortfolioHolding table
UPDATE PortfolioHolding SET Quantity = 120 WHERE PortfolioID = 3701 AND AssetID = 2000;

-- Delete a specific record from the PortfolioHolding table
DELETE FROM PortfolioHolding WHERE PortfolioID = 3702 AND AssetID = 2001;

-- Transaction table

-- Read (Select) all data from the Transaction table
SELECT * FROM Transaction;

-- Read (Select) specific data from the Transaction table based on conditions
SELECT TransactionID, PortfolioID, AssetID, TransactionType, Quantity FROM Transaction WHERE PortfolioID = 3706;

-- Update a specific record in the Transaction table
UPDATE Transaction SET Price = 2500.00 WHERE TransactionID = 12345;

-- Delete a specific record from the Transaction table
DELETE FROM Transaction WHERE TransactionID = 12346;

-- Benchmark table

-- Read (Select) all data from the Benchmark table
SELECT * FROM Benchmark;

-- Read (Select) specific data from the Benchmark table based on conditions
SELECT BenchmarkID, Name, Description FROM Benchmark WHERE BenchmarkID = 1;

-- Update a specific record in the Benchmark table
UPDATE Benchmark SET Description = 'A modified description' WHERE BenchmarkID = 2;

-- Delete a specific record from the Benchmark table
DELETE FROM Benchmark WHERE BenchmarkID = 3;

-- PortfolioBenchmark table

-- Read (Select) all data from the PortfolioBenchmark table
SELECT * FROM PortfolioBenchmark;

-- Read (Select) specific data from the PortfolioBenchmark table based on conditions
SELECT PortfolioID, BenchmarkID FROM PortfolioBenchmark WHERE PortfolioID = 3700;

UPDATE PortfolioBenchmark
SET BenchmarkID = 2
WHERE PortfolioID = 3701 AND BenchmarkID = 1;

-- Delete a specific record from the PortfolioBenchmark table
DELETE FROM PortfolioBenchmark WHERE PortfolioID = 3701 AND BenchmarkID = 1;