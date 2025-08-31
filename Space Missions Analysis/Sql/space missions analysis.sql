USE space_mission


SELECT COUNT(*) AS Total_Agencies FROM agencies;


SELECT COUNT(*) AS Total_Astronauts FROM astronauts;


SELECT COUNT(*) AS Total_Missions FROM missions;


SELECT COUNT(*) AS Total_Spacecraft FROM spacecraft;



SELECT TOP 5 Agency_name, Budget_billion_usd
FROM agencies
ORDER BY Budget_billion_usd DESC;





SELECT Destination, COUNT(*) AS Mission_Count
FROM missions
GROUP BY Destination
ORDER BY Mission_Count DESC;

--missions per year
SELECT YEAR(launch_date) AS Launch_Year, COUNT(*) AS Mission_Count
FROM missions
GROUP BY YEAR(launch_date)
ORDER BY Launch_Year;


--missions status distribution 
SELECT Status, COUNT(*) AS Status_Count
FROM missions
GROUP BY Status
ORDER BY Status_Count DESC;


--average mission duration per agency
SELECT ag.Agency_name, AVG(m.duration_days) AS Avg_Duration
FROM missions m
JOIN agencies ag ON m.Agency_id = ag.Agency_id
GROUP BY ag.Agency_name
ORDER BY Avg_Duration DESC;


--top 5 most expensive spacecraft
SELECT TOP 5 Spacecraft_name, Cost_million_usd
FROM spacecraft
ORDER BY Cost_million_usd DESC;


-- Spacecraft count by manufacturer
SELECT Manufacturer, COUNT(*) AS Spacecraft_Count
FROM spacecraft
GROUP BY Manufacturer
ORDER BY Spacecraft_Count DESC;



-- Average spacecraft cost
SELECT AVG(Cost_million_usd) AS Avg_Spacecraft_Cost
FROM spacecraft;



SELECT TOP 5 Name, Missions_count
FROM astronauts
ORDER BY Missions_count DESC;


-- average birth year of astronauts per nationality
SELECT Nationality, AVG(Birth_year) AS Avg_Birth_Year
FROM astronauts
GROUP BY Nationality
ORDER BY Avg_Birth_Year ASC;



SELECT a.Agency_name, COUNT(m.Mission_id) AS Mission_Count
FROM agencies a
LEFT JOIN missions m ON a.Agency_id = m.Agency_id
GROUP BY a.Agency_name
ORDER BY Mission_Count DESC;



-- Mission that has the largest crew size
SELECT TOP 5 m.Mission_name, COUNT(mc.Astronaut_id) AS Crew_Size
FROM missions m
JOIN mission_crew mc ON m.Mission_id = mc.Mission_id
GROUP BY m.Mission_name
ORDER BY Crew_Size DESC;





SELECT a.Name AS Astronaut, a.Nationality, m.Mission_name, ag.Agency_name, mc.Role
FROM mission_crew mc
JOIN astronauts a ON mc.Astronaut_id = a.Astronaut_id
JOIN missions m ON mc.Mission_id = m.Mission_id
JOIN agencies ag ON m.Agency_id = ag.Agency_id
ORDER BY a.Name;




SELECT ag.Agency_name, SUM(s.Cost_million_usd) AS Total_Spacecraft_Cost
FROM spacecraft s
JOIN missions m ON s.Mission_id = m.Mission_id
JOIN agencies ag ON m.Agency_id = ag.Agency_id
GROUP BY ag.Agency_name
ORDER BY Total_Spacecraft_Cost DESC;

-- for each agency: number of missions, total spacecraft cost, and total astronauts involved
SELECT ag.Agency_name,
       COUNT(DISTINCT m.Mission_id) AS Mission_Count,
       SUM(s.Cost_million_usd) AS Total_Spacecraft_Cost,
       COUNT(DISTINCT mc.Astronaut_id) AS Total_Astronauts
FROM agencies ag
LEFT JOIN missions m ON ag.Agency_id = m.Agency_id
LEFT JOIN spacecraft s ON m.Mission_id = s.Mission_id
LEFT JOIN mission_crew mc ON m.Mission_id = mc.Mission_id
GROUP BY ag.Agency_name
ORDER BY Mission_Count DESC;



