-- NBA Queries

/* -- Player Effectiveness 1
SELECT p.player_name, p.draft_year, p.draft_round, p.draft_number,
-- (PTS + REB + AST + STL + BLK − Missed FG − Missed FT - TO) / GP
 (stat.points_per_game + stat.rebounds_per_game + 
stat.assists_per_game + stat.steals_per_game + stat.blocks_per_game - 
(1-stat.free_throw_percent) - (1-stat.free_throw_percent) - turn_overs_per_game)/games_played as Player_Effectiveness_Rating
FROM personal_data p
LEFT JOIN stat_seasonal_game_data stat ON stat.name = p.player_name
WHERE draft_year != 'Undrafted' and draft_round in (2)
HAVING Player_Effectiveness_Rating is not Null
ORDER BY Player_Effectiveness_Rating desc */ 

/* Player Effectiveness 3
select  draft_year, minutes_per_game,(stat.points_per_game + stat.rebounds_per_game + 
stat.assists_per_game + stat.steals_per_game + stat.blocks_per_game - 
(1-stat.free_throw_percent) - (1-stat.free_throw_percent) - turn_overs_per_game)/games_played as AVG_Player_Effectiveness_Rating
FROM personal_data p
LEFT JOIN stat_seasonal_game_data stat ON stat.name = p.player_name
where draft_year is not null and draft_year != 'Undrafted'*/

/* Player Effectiveness 3 Table
SELECT count(*), draft_year
FROM personal_data p
LEFT JOIN stat_seasonal_game_data stat ON stat.name = p.player_name
WHERE draft_year != 'Undrafted'
GROUP BY draft_year*/

/* Player Effectiveness 2 
SELECT p.player_name, p.draft_year, p.draft_round, p.draft_number,
-- (PTS + REB + AST + STL + BLK − Missed FG − Missed FT - TO) / GP
 (stat.points_per_game + stat.rebounds_per_game + 
stat.assists_per_game + stat.steals_per_game + stat.blocks_per_game - 
(1-stat.free_throw_percent) - (1-stat.free_throw_percent) - turn_overs_per_game)/games_played as Player_Effectiveness_Rating
FROM personal_data p
LEFT JOIN stat_seasonal_game_data stat ON stat.name = p.player_name
WHERE draft_year != 'Undrafted' and draft_round in (2) and draft_year = 2022
HAVING Player_Effectiveness_Rating is not Null
ORDER BY draft_number desc */

/*
   SELECT COUNT(*) AS count, LEFT(s.position,1) AS position_start, round(avg(offensive_rating),2) as Avg_Offensive_Rating, round(avg(deffensive_rating),2) as Avg_Deffensive_Rating,
        CASE
            WHEN age BETWEEN 18 AND 24 THEN '18-24'
            WHEN age BETWEEN 25 AND 30 THEN '25-30'
            WHEN age BETWEEN 31 AND 35 THEN '31-35'
            WHEN age > 35 THEN '35+'
            ELSE 'Null'
        END AS age_group
    FROM personal_data p
    LEFT JOIN stat_seasonal_game_data s ON p.player_name = s.name
    WHERE LEFT(s.position, 1) = 'G'
    GROUP BY position_start, age_group
    ORDER BY position_start */
    
/* SELECT avg(games_played), season_type,        
		CASE
            WHEN age BETWEEN 18 AND 24 THEN '18-24'
            WHEN age BETWEEN 25 AND 27 THEN '25-27'
            WHEN age BETWEEN 28 AND 31 THEN '28-31'
            WHEN age BETWEEN 32 AND 35 THEN '32-35'
            WHEN age > 35 THEN '35+'
            ELSE 'Null'
        END AS age_group
FROM personal_data p
LEFT JOIN stat_seasonal_game_data stat ON stat.name = p.player_name
WHERE season_type is not null
group by season_type, age_group */

/*SELECT round(sum(salary)/wins) as 'cost per win', full_team_name
FROM salary_data s
LEFT JOIN wins_losses w ON s.full_team_name = w.team
GROUP BY full_team_name
ORDER BY 'cost per win'*/

/* cost per win
SELECT round(sum(salary)/wins) as 'cost per win', full_team_name
FROM salary_data s
LEFT JOIN wins_losses w ON s.full_team_name = w.team
GROUP BY full_team_name
ORDER BY 'cost per win'*/


/* SELECT round(sum(salary)/losses) as 'cost per loss', full_team_name
FROM salary_data s
LEFT JOIN wins_losses w ON s.full_team_name = w.team
GROUP BY full_team_name
ORDER BY 'cost per loss'*/


/* college stuff
	SELECT 
       CASE
           WHEN age BETWEEN 18 AND 24 THEN '18-24'
           WHEN age BETWEEN 25 AND 27 THEN '25-27'
           WHEN age BETWEEN 28 AND 31 THEN '28-31'
           WHEN age BETWEEN 32 AND 35 THEN '32-35'
           WHEN age > 35 THEN '35+'
           ELSE 'Null'
       END AS age_group,
       COUNT(CASE WHEN college IS NOT NULL THEN 1 END) AS count_college,
       
       round(avg(offensive_rating),2) as Avg_Offensive_Rating, round(avg(deffensive_rating),2) as Avg_Deffensive_Rating
FROM personal_data p
LEFT JOIN stat_seasonal_game_data s ON p.player_name = s.name
GROUP BY age_group
ORDER BY age_group;

	SELECT 
       CASE
           WHEN age BETWEEN 18 AND 24 THEN '18-24'

           ELSE 'Null'
       END AS age_group,
       
       COUNT(CASE WHEN college = 'none' THEN 1 END) AS count_no_college,
       round(avg(offensive_rating),2) as Avg_Offensive_Rating, round(avg(deffensive_rating),2) as Avg_Deffensive_Rating
FROM personal_data p
LEFT JOIN stat_seasonal_game_data s ON p.player_name = s.name
WHERE college = 'none' 
GROUP BY age_group
ORDER BY age_group;

select count(*)
FROM personal_data
where college != 'none' and age between 18 and 24;

select count(*)
from personal_data 
where college = 'none' and age between 18 and 24; */