
USE  t20_worldcup;


-- Top 10 Run Scorers
SELECT Player,
       Team,
       Runs
FROM batting_stats
ORDER BY Runs DESC
LIMIT 10;



--  Players with Best Strike Rate
SELECT Player,
       Team,
       Runs,
       SR
FROM batting_stats
WHERE Runs > 100
ORDER BY SR DESC;



--  Highest Individual Scores
SELECT Player,
       Team,
       HS
FROM batting_stats
ORDER BY HS DESC
LIMIT 10;



--  Most Consistent Batters
SELECT Player,
       Team,
       Ave
FROM batting_stats
WHERE Inns >= 3
ORDER BY Ave DESC;



-- 7. Top Wicket Takers
SELECT Player,
       Team,
       Wkts
FROM bowling_stats
ORDER BY Wkts DESC
LIMIT 10;



-- Best Economy Bowlers
SELECT Player,
       Team,
       Econ
FROM bowling_stats
WHERE Wkts > 5
ORDER BY Econ ASC;




-- Best Bowling Average
SELECT Player,
       Team,
       Ave
FROM bowling_stats
WHERE Wkts > 5
ORDER BY Ave ASC;



-- 10. Team-wise Total Wickets
SELECT Team,
       SUM(Wkts) AS Total_Wickets
FROM bowling_stats
GROUP BY Team
ORDER BY Total_Wickets DESC;




--  Teams with Most Wins
SELECT Winner,
       COUNT(*) AS Wins
FROM match_results
GROUP BY Winner
ORDER BY Wins DESC;




--  Venue-wise Match Count
SELECT Ground,
       COUNT(*) AS Matches
FROM match_results
GROUP BY Ground
ORDER BY Matches DESC;



--  Most Catches by Fielders
SELECT Player,
       Team,
       Ct
FROM fielding_stats
ORDER BY Ct DESC
LIMIT 10;




--  Most Stumpings
SELECT Player,
       Team,
       St
FROM wk_stats
ORDER BY St DESC;







-- All-Rounders Analysis (JOIN Query)
-- Players who scored runs and took wickets
SELECT b.Player,
       b.Team,
       b.Runs,
       bw.Wkts
FROM batting_stats b
JOIN bowling_stats bw
ON b.Player = bw.Player
ORDER BY b.Runs DESC;




--  Best All-Rounders
SELECT b.Player,
       b.Team,
       b.Runs,
       bw.Wkts,
       (b.Runs + bw.Wkts*20) AS Impact_Score
FROM batting_stats b
JOIN bowling_stats bw
ON b.Player = bw.Player
ORDER BY Impact_Score DESC;




--  Team Performance Summary
SELECT b.Team,
       SUM(b.Runs) AS Total_Runs,
       SUM(bw.Wkts) AS Total_Wickets
FROM batting_stats b
JOIN bowling_stats bw
ON b.Team = bw.Team
GROUP BY b.Team
ORDER BY Total_Runs DESC;




--  Bowlers with Low Economy and High Wickets
SELECT Player,
       Team,
       Wkts,
       Econ
FROM bowling_stats
WHERE Wkts > 8
ORDER BY Econ ASC;



-- Players with Highest Boundaries Potential
SELECT Player,
       Team,
       Runs,
       SR
FROM batting_stats
ORDER BY SR DESC
LIMIT 15;


