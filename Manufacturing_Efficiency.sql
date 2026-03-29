SELECT *
FROM [Manufacturing Efficiency Project]

-- Total Production per line 
SELECT [Production_Line], SUM(Units_Produced) AS Total_Production
FROM [Manufacturing Efficiency Project]
GROUP BY Production_Line
ORDER BY Total_Production desc;

-- Total Defects per line
SELECT [Production_Line], SUM(Units_Defective) AS Total_Defects
FROM [Manufacturing Efficiency Project]
GROUP BY Production_Line
ORDER BY  Total_Defects DESC;

-- Defect Rate per line
SELECT [Production_Line], (SUM(Units_Defective)*100.0) / SUM(Units_Produced) AS [Defect Rate]
FROM [Manufacturing Efficiency Project]
GROUP BY Production_Line
ORDER BY 
    CASE 
        WHEN Production_Line = 'Line A' THEN 1
        WHEN Production_Line = 'Line B' THEN 2
        WHEN Production_Line = 'Line C' THEN 3
        WHEN Production_Line = 'Line D' THEN 4
     END;


-- Defect Rate per shift 
SELECT [Shift], (SUM(Units_Defective)*100.0) / SUM(Units_Produced) AS [Defect Rate]
FROM [Manufacturing Efficiency Project]
GROUP BY [Shift]
ORDER BY  
    CASE 
        WHEN Shift = 'Morning' THEN 1
        WHEN Shift = 'Afternoon' THEN 2
        WHEN Shift = 'Night' THEN 3
    END;

-- Total Downtime per line

SELECT Production_Line , SUM(Downtime_Hours) AS Total_Downtime
FROM [Manufacturing Efficiency Project]
Group by Production_Line 
Order by  Total_Downtime desc;

-- Total Maintenance cost per line

SELECT Production_Line,
    SUM(Maintenance_Cost) AS Total_Maintenance_Cost
FROM [Manufacturing Efficiency Project]
GROUP BY Production_Line
ORDER BY Total_Maintenance_Cost desc;

-- Total waste per material

SELECT Material_Type, SUM(Quantity_Wasted_kg) AS Total_waste
FROM [Manufacturing Efficiency Project]
GROUP BY Material_Type
ORDER BY Total_waste DESC;

-- Waste percentage per Material

SELECT Material_Type, 
               (SUM(Quantity_Wasted_kg)*100.0) / SUM(Quantity_Used_kg) AS Waste_Percentage
FROM [Manufacturing Efficiency Project]
Group by Material_Type
Order by Waste_Percentage desc;

--Total waste per line

SELECT  Production_Line,
    SUM(Quantity_Wasted_kg) AS Total_Waste
FROM [Manufacturing Efficiency Project]
GROUP BY Production_Line
ORDER BY Total_Waste desc;

--Waste percentage per line

SELECT Production_Line,
    SUM(Quantity_Wasted_kg) * 100.0 / SUM(Quantity_Used_kg) AS Waste_Percentage
FROM [Manufacturing Efficiency Project]
GROUP BY Production_Line
ORDER BY Waste_Percentage desc;

--Top 3 lines by Downtime 

SELECT TOP 3 
       Production_Line, SUM(Downtime_Hours) AS Total_Downtime
FROM [Manufacturing Efficiency Project]
GROUP BY Production_Line
ORDER BY Total_Downtime desc;

--Total Production per shift 

SELECT [Shift], SUM(Units_Produced) AS Total_Production
FROM [Manufacturing Efficiency Project]
GROUP BY [Shift]
ORDER BY Total_Production

-- Want to know if machine run hours is the reason behing afternoon shift low production 

SELECT [Shift],
    SUM(Machine_Run_Hours) AS Total_Run_Hours
FROM [Manufacturing Efficiency Project]
GROUP BY [Shift];

-- Want to know if units produced per hour is the reason behing afternoon shift low productn

SELECT [Shift], 
    SUM(Units_Produced) / SUM(Machine_Run_Hours) AS Units_Per_Hour
FROM [Manufacturing Efficiency Project]
GROUP BY [Shift];

-- Which line has high waste % and high defect rate

SELECT Production_Line,
    SUM(Units_Defective) * 100.0 / SUM(Units_Produced) AS Defect_Rate,
    SUM(Quantity_Wasted_kg) * 100.0 / SUM(Quantity_Used_kg) AS Waste_Percentage
FROM [Manufacturing Efficiency Project]
GROUP BY Production_Line
ORDER BY Defect_Rate desc;

-- To see wc month exactly in lineB has the highest defect rate

SELECT MONTH(Date) AS Month,
    SUM(CASE WHEN Production_Line = 'Line B' THEN Units_Defective ELSE 0 END) * 100.0 /
    SUM(CASE WHEN Production_Line = 'Line B' THEN Units_Produced ELSE 0 END) AS LineB_Defect_Rate
FROM [Manufacturing Efficiency Project]
GROUP BY MONTH(Date)
ORDER BY Month;

-- To know if it's becuz of downtime_hours that caused the spike in Month 10(highest defect rate month in lineB)

SELECT MONTH(Date) AS Month,
    SUM(Downtime_Hours) AS LineB_Downtime
FROM [Manufacturing Efficiency Project]
WHERE Production_Line = 'Line B'
GROUP BY MONTH(Date)
ORDER BY MONTH

-- Certain type of material used more in Line B 

SELECT Material_Type , SUM(Quantity_Used_Kg) AS Material_Used
FROM [Manufacturing Efficiency Project]
WHERE Production_Line = 'Line B' AND MONTH(Date) = 10
GROUP BY  Material_Type 
ORDER BY Material_Used desc

-- Overall Efficient Line s
SELECT Production_Line, SUM(Units_Produced) / SUM(Machine_Run_Hours) AS Efficiency
FROM [Manufacturing Efficiency Project]
GROUP BY Production_Line
ORDER BY Efficiency desc




