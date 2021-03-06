SELECT SUM(Crashes) AS crashes FROM Telemetry.Crashes WHERE Region = 'LATAM';
SELECT AVG(Temperature) AS temperature FROM Telemetry.Crashes GROUP BY Refurbished;
SELECT Building, SUM(Crashes) AS total_crash, AVG(Crashes) AS avg_crashes, AVG(Temperature) FROM Telemetry.Crashes WHERE Refurbished = TRUE GROUP BY Building;
SELECT COUNT(DeviceID) AS Devices FROM Telemetry.Crashes;
SELECT SUM(Temperature), SUM(Temperature), SUM(Crashes), COUNT(Building) FROM Telemetry.Crashes GROUP BY Region;
SELECT AVG(Temperature) AS avg_temperature, Region, Building, Refurbished FROM Telemetry.Crashes WHERE Temperature > 53.1 GROUP BY Refurbished, Region, Building;
SELECT COUNT(DeviceID) AS n, Region, Building, Refurbished FROM Telemetry.Crashes WHERE Temperature > 53.1 GROUP BY Region, Building, Refurbished;
SELECT COUNT(DeviceID) AS Devices, Region, Refurbished, Building, AVG(Temperature) AS Temperature FROM Telemetry.Crashes WHERE Temperature > 53.1 GROUP BY Region, Refurbished, Building ORDER BY Region, Refurbished, Building DESC;
SELECT SUM(Crashes) AS Crashes, COUNT(DeviceID) AS Devices FROM Telemetry.Crashes;
SELECT SUM(Crashes) AS Crashes FROM Telemetry.Crashes;
SELECT COUNT(Crashes) AS Crashes FROM Telemetry.Crashes;
SELECT Region, SUM(Crashes) AS crashes FROM Telemetry.Crashes WHERE Region IN ('LATAM', 'EMEA') GROUP BY Region ORDER BY Region DESC;
SELECT COUNT(DISTINCT DeviceID) AS n, Region, Building, Refurbished FROM Telemetry.Crashes WHERE Temperature > 53.1 GROUP BY Region, Building, Refurbished;
SELECT COUNT(DISTINCT DeviceID) AS did FROM Telemetry.Crashes GROUP BY Refurbished;
SELECT COUNT(DISTINCT DeviceID) AS did FROM Telemetry.Crashes;
SELECT Region, Refurbished, AVG(Temperature) FROM Telemetry.Crashes GROUP BY Region, Refurbished ORDER BY Refurbished, Region;
SELECT COUNT(DeviceID) AS Devices, Region, Refurbished, AVG(Temperature) AS Temperature FROM Telemetry.Crashes GROUP BY Region, Refurbished ORDER BY Region, Refurbished DESC;
SELECT OEM, TrialGroup, COUNT(DeviceID) AS N, SUM(Crashes) FROM (
       SELECT Crashes, T.* FROM Telemetry.Crashes JOIN ( 
        SELECT DeviceID, OEM, TrialGroup FROM 
         (Telemetry.Census JOIN Telemetry.Rollouts USING(DeviceID)) AS Q
             ) AS T USING(DeviceID) 
      ) AS Z GROUP BY OEM, TrialGroup ORDER BY OEM, TrialGroup;
-- SELECT Heat, COUNT(DeviceID) FROM (SELECT DeviceID, CASE WHEN Temperature < 42 THEN 'Cold' WHEN Temperature > 51 THEN 'Hot' ELSE 'Medium' END AS Heat FROM Telemetry.Crashes) AS TC GROUP BY Heat ORDER BY Heat;
