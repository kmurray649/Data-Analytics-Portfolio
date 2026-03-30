USE project_3_tedx;

SELECT count(*), avg(duration_divided_60), views_bucket
FROM (
    SELECT (duration / 60) as 'duration_divided_60',
    CASE 
        WHEN views >= 0 AND views < 1000000 THEN '0 to 1m'
        WHEN views >= 1000000 AND views < 1500000 THEN '1m to 1.5m'
        WHEN views >= 1500000 AND views < 2000000 THEN '1.5m to 2m'
        WHEN views >= 2000000 AND views < 2500000 THEN '2m to 2.5m'
        ELSE '2.5m+'
    END as 'views_bucket'
    FROM tedx_data
    ORDER BY views desc
) a
GROUP BY views_bucket;

select *
from tedx_data;


SELECT *,  ROW_NUMBER() OVER (ORDER BY views DESC) AS row_num,
        COUNT(*) OVER () AS total_rows
FROM tedx_data

Order by views;


WITH RankedData AS (
    SELECT
        index_id,
        comments,
        duration,
        num_speaker,
        published_day,
        published_month,
        published_year,
        speaker_occupation,
        views,
        ROW_NUMBER() OVER (ORDER BY views DESC) AS row_num,
        COUNT(*) OVER () AS total_rows
    FROM tedx_data
    limit 509
)

SELECT
    index_id,
    comments,
    duration,
    num_speaker,
    published_day,
    published_month,
    published_year,
    speaker_occupation,
    views,
    CASE
        WHEN row_num <= 0.01 * total_rows THEN '0.01%'
        WHEN row_num <= 0.02 * total_rows THEN '0.02%'
        WHEN row_num <= 0.03 * total_rows THEN '0.03%'
        WHEN row_num <= 0.04 * total_rows THEN '0.04%'
        WHEN row_num <= 0.05 * total_rows THEN '0.05%'
        WHEN row_num <= 0.06 * total_rows THEN '0.06%'
        WHEN row_num <= 0.07 * total_rows THEN '0.07%'
        WHEN row_num <= 0.08 * total_rows THEN '0.08%'
        WHEN row_num <= 0.09 * total_rows THEN '0.09%'
        WHEN row_num <= 0.10 * total_rows THEN '0.10%'
        WHEN row_num <= 0.11 * total_rows THEN '0.11%'
        WHEN row_num <= 0.12 * total_rows THEN '0.12%'
        WHEN row_num <= 0.13 * total_rows THEN '0.13%'
        WHEN row_num <= 0.14 * total_rows THEN '0.14%'
        WHEN row_num <= 0.15 * total_rows THEN '0.15%'
        WHEN row_num <= 0.16 * total_rows THEN '0.16%'
        WHEN row_num <= 0.17 * total_rows THEN '0.17%'
        WHEN row_num <= 0.18 * total_rows THEN '0.18%'
        WHEN row_num <= 0.19 * total_rows THEN '0.19%'
        WHEN row_num <= 0.20 * total_rows THEN '0.20%'
		WHEN row_num <= 0.21 * total_rows THEN '0.21%'
        WHEN row_num <= 0.22 * total_rows THEN '0.22%'
        WHEN row_num <= 0.23 * total_rows THEN '0.23%'
        WHEN row_num <= 0.24 * total_rows THEN '0.24%'
        WHEN row_num <= 0.25 * total_rows THEN '0.25%'
        WHEN row_num <= 0.26 * total_rows THEN '0.26%'
        WHEN row_num <= 0.27 * total_rows THEN '0.27%'
        WHEN row_num <= 0.28 * total_rows THEN '0.28%'
        WHEN row_num <= 0.29 * total_rows THEN '0.29%'
        WHEN row_num <= 0.30 * total_rows THEN '0.30%'
        WHEN row_num <= 0.31 * total_rows THEN '0.31%'
        WHEN row_num <= 0.32 * total_rows THEN '0.32%'
        WHEN row_num <= 0.33 * total_rows THEN '0.33%'
        WHEN row_num <= 0.34 * total_rows THEN '0.34%'
        WHEN row_num <= 0.35 * total_rows THEN '0.35%'
        WHEN row_num <= 0.36 * total_rows THEN '0.36%'
        WHEN row_num <= 0.37 * total_rows THEN '0.37%'
        WHEN row_num <= 0.38 * total_rows THEN '0.38%'
        WHEN row_num <= 0.39 * total_rows THEN '0.39%'
        WHEN row_num <= 0.40 * total_rows THEN '0.40%'
        WHEN row_num <= 0.41 * total_rows THEN '0.41%'
        WHEN row_num <= 0.42 * total_rows THEN '0.42%'
        WHEN row_num <= 0.43 * total_rows THEN '0.43%'
        WHEN row_num <= 0.44 * total_rows THEN '0.44%'
        WHEN row_num <= 0.45 * total_rows THEN '0.45%'
        WHEN row_num <= 0.46 * total_rows THEN '0.46%'
        WHEN row_num <= 0.47 * total_rows THEN '0.47%'
        WHEN row_num <= 0.48 * total_rows THEN '0.48%'
        WHEN row_num <= 0.49 * total_rows THEN '0.49%'
        WHEN row_num <= 0.50 * total_rows THEN '0.50%'
        WHEN row_num <= 0.51 * total_rows THEN '0.51%'
        WHEN row_num <= 0.52 * total_rows THEN '0.52%'
        WHEN row_num <= 0.53 * total_rows THEN '0.53%'
        WHEN row_num <= 0.54 * total_rows THEN '0.54%'
        WHEN row_num <= 0.55 * total_rows THEN '0.55%'
        WHEN row_num <= 0.56 * total_rows THEN '0.56%'
        WHEN row_num <= 0.57 * total_rows THEN '0.57%'
        WHEN row_num <= 0.58 * total_rows THEN '0.58%'
        WHEN row_num <= 0.59 * total_rows THEN '0.59%'
        WHEN row_num <= 0.60 * total_rows THEN '0.60%'
        WHEN row_num <= 0.61 * total_rows THEN '0.61%'
        WHEN row_num <= 0.62 * total_rows THEN '0.62%'
        WHEN row_num <= 0.63 * total_rows THEN '0.63%'
        WHEN row_num <= 0.64 * total_rows THEN '0.64%'
        WHEN row_num <= 0.65 * total_rows THEN '0.65%'
        WHEN row_num <= 0.66 * total_rows THEN '0.66%'
        WHEN row_num <= 0.67 * total_rows THEN '0.67%'
        WHEN row_num <= 0.68 * total_rows THEN '0.68%'
        WHEN row_num <= 0.69 * total_rows THEN '0.69%'
        WHEN row_num <= 0.70 * total_rows THEN '0.70%'
        WHEN row_num <= 0.71 * total_rows THEN '0.71%'
        WHEN row_num <= 0.72 * total_rows THEN '0.72%'
        WHEN row_num <= 0.73 * total_rows THEN '0.73%'
        WHEN row_num <= 0.74 * total_rows THEN '0.74%'
        WHEN row_num <= 0.75 * total_rows THEN '0.75%'
        WHEN row_num <= 0.76 * total_rows THEN '0.76%'
        WHEN row_num <= 0.77 * total_rows THEN '0.77%'
        WHEN row_num <= 0.78 * total_rows THEN '0.78%'
        WHEN row_num <= 0.79 * total_rows THEN '0.79%'
        WHEN row_num <= 0.80 * total_rows THEN '0.80%'
        WHEN row_num <= 0.81 * total_rows THEN '0.81%'
        WHEN row_num <= 0.82 * total_rows THEN '0.82%'
        WHEN row_num <= 0.83 * total_rows THEN '0.83%'
        WHEN row_num <= 0.84 * total_rows THEN '0.84%'
        WHEN row_num <= 0.85 * total_rows THEN '0.85%'
        WHEN row_num <= 0.86 * total_rows THEN '0.86%'
        WHEN row_num <= 0.87 * total_rows THEN '0.87%'
        WHEN row_num <= 0.88 * total_rows THEN '0.88%'
        WHEN row_num <= 0.89 * total_rows THEN '0.89%'
        WHEN row_num <= 0.90 * total_rows THEN '0.90%'
        WHEN row_num <= 0.91 * total_rows THEN '0.91%'
        WHEN row_num <= 0.92 * total_rows THEN '0.92%'
        WHEN row_num <= 0.93 * total_rows THEN '0.93%'
        WHEN row_num <= 0.94 * total_rows THEN '0.94%'
        WHEN row_num <= 0.95 * total_rows THEN '0.95%'
        WHEN row_num <= 0.96 * total_rows THEN '0.96%'
        WHEN row_num <= 0.97 * total_rows THEN '0.97%'
        WHEN row_num <= 0.98 * total_rows THEN '0.98%'
        WHEN row_num <= 0.99 * total_rows THEN '0.99%'
        ELSE '100%'
    END AS percentile_bucket
FROM RankedData
ORDER BY views DESC;



SELECT count(*), tag
FROM tags
WHERE tag = 'activism';

SELECT MAX(rating_count), rating, index_id
FROM ratings
GROUP BY index_id;

SELECT sum(views), tag
FROM (
	SELECT a.*, b.views as 'views'
    FROM tags a 
    LEFT JOIN tedx_data b ON a.index_id = b.index_id
    HAVING views > 1900000
) a
GROUP BY tag
ORDER by sum(views) desc;

SELECT *, (2023 - published_year) as 'Years_Old'
FROM (	
    SELECT *
	FROM tedx_data x
    LEFT JOIN tags t ON x.index_id = t.index_id
	order by views desc
	limit 509 
	) a;
    
SELECT *, (2023 - published_year) as Years_Old
FROM tedx_data x
LEFT JOIN tags t ON x.index_id = t.index_id
ORDER BY views DESC
LIMIT 509;



    /* highest viewed tags */
SELECT SUM(views), tag
FROM (
    SELECT a.*, b.views as 'views'
    FROM tags a
    LEFT JOIN tedx_data b ON a.index_id = b.index_id
) a
GROUP BY tag
ORDER BY SUM(views) desc;



WITH RankedData AS (
    SELECT
        index_id,
        comments,
        duration,
        num_speaker,
        published_day,
        published_month,
        published_year,
        speaker_occupation,
        views,
        ROW_NUMBER() OVER (ORDER BY views DESC) AS row_num,
        COUNT(*) OVER () AS total_rows
    FROM tedx_data
    limit 509
)
SELECT
    index_id,
    comments,
    duration,
    num_speaker,
    published_day,
    published_month,
    published_year,
    speaker_occupation,
    views,
    CASE
        WHEN row_num <= 0.01 * total_rows THEN '0.01%'
        WHEN row_num <= 0.02 * total_rows THEN '0.02%'
        WHEN row_num <= 0.03 * total_rows THEN '0.03%'
        WHEN row_num <= 0.04 * total_rows THEN '0.04%'
        WHEN row_num <= 0.05 * total_rows THEN '0.05%'
        WHEN row_num <= 0.06 * total_rows THEN '0.06%'
        WHEN row_num <= 0.07 * total_rows THEN '0.07%'
        WHEN row_num <= 0.08 * total_rows THEN '0.08%'
        WHEN row_num <= 0.09 * total_rows THEN '0.09%'
        WHEN row_num <= 0.10 * total_rows THEN '0.10%'
        WHEN row_num <= 0.11 * total_rows THEN '0.11%'
        WHEN row_num <= 0.12 * total_rows THEN '0.12%'
        WHEN row_num <= 0.13 * total_rows THEN '0.13%'
        WHEN row_num <= 0.14 * total_rows THEN '0.14%'
        WHEN row_num <= 0.15 * total_rows THEN '0.15%'
        WHEN row_num <= 0.16 * total_rows THEN '0.16%'
        WHEN row_num <= 0.17 * total_rows THEN '0.17%'
        WHEN row_num <= 0.18 * total_rows THEN '0.18%'
        WHEN row_num <= 0.19 * total_rows THEN '0.19%'
        WHEN row_num <= 0.20 * total_rows THEN '0.20%'
		WHEN row_num <= 0.21 * total_rows THEN '0.21%'
        WHEN row_num <= 0.22 * total_rows THEN '0.22%'
        WHEN row_num <= 0.23 * total_rows THEN '0.23%'
        WHEN row_num <= 0.24 * total_rows THEN '0.24%'
        WHEN row_num <= 0.25 * total_rows THEN '0.25%'
        WHEN row_num <= 0.26 * total_rows THEN '0.26%'
        WHEN row_num <= 0.27 * total_rows THEN '0.27%'
        WHEN row_num <= 0.28 * total_rows THEN '0.28%'
        WHEN row_num <= 0.29 * total_rows THEN '0.29%'
        WHEN row_num <= 0.30 * total_rows THEN '0.30%'
        WHEN row_num <= 0.31 * total_rows THEN '0.31%'
        WHEN row_num <= 0.32 * total_rows THEN '0.32%'
        WHEN row_num <= 0.33 * total_rows THEN '0.33%'
        WHEN row_num <= 0.34 * total_rows THEN '0.34%'
        WHEN row_num <= 0.35 * total_rows THEN '0.35%'
        WHEN row_num <= 0.36 * total_rows THEN '0.36%'
        WHEN row_num <= 0.37 * total_rows THEN '0.37%'
        WHEN row_num <= 0.38 * total_rows THEN '0.38%'
        WHEN row_num <= 0.39 * total_rows THEN '0.39%'
        WHEN row_num <= 0.40 * total_rows THEN '0.40%'
        WHEN row_num <= 0.41 * total_rows THEN '0.41%'
        WHEN row_num <= 0.42 * total_rows THEN '0.42%'
        WHEN row_num <= 0.43 * total_rows THEN '0.43%'
        WHEN row_num <= 0.44 * total_rows THEN '0.44%'
        WHEN row_num <= 0.45 * total_rows THEN '0.45%'
        WHEN row_num <= 0.46 * total_rows THEN '0.46%'
        WHEN row_num <= 0.47 * total_rows THEN '0.47%'
        WHEN row_num <= 0.48 * total_rows THEN '0.48%'
        WHEN row_num <= 0.49 * total_rows THEN '0.49%'
        WHEN row_num <= 0.50 * total_rows THEN '0.50%'
        WHEN row_num <= 0.51 * total_rows THEN '0.51%'
        WHEN row_num <= 0.52 * total_rows THEN '0.52%'
        WHEN row_num <= 0.53 * total_rows THEN '0.53%'
        WHEN row_num <= 0.54 * total_rows THEN '0.54%'
        WHEN row_num <= 0.55 * total_rows THEN '0.55%'
        WHEN row_num <= 0.56 * total_rows THEN '0.56%'
        WHEN row_num <= 0.57 * total_rows THEN '0.57%'
        WHEN row_num <= 0.58 * total_rows THEN '0.58%'
        WHEN row_num <= 0.59 * total_rows THEN '0.59%'
        WHEN row_num <= 0.60 * total_rows THEN '0.60%'
        WHEN row_num <= 0.61 * total_rows THEN '0.61%'
        WHEN row_num <= 0.62 * total_rows THEN '0.62%'
        WHEN row_num <= 0.63 * total_rows THEN '0.63%'
        WHEN row_num <= 0.64 * total_rows THEN '0.64%'
        WHEN row_num <= 0.65 * total_rows THEN '0.65%'
        WHEN row_num <= 0.66 * total_rows THEN '0.66%'
        WHEN row_num <= 0.67 * total_rows THEN '0.67%'
        WHEN row_num <= 0.68 * total_rows THEN '0.68%'
        WHEN row_num <= 0.69 * total_rows THEN '0.69%'
        WHEN row_num <= 0.70 * total_rows THEN '0.70%'
        WHEN row_num <= 0.71 * total_rows THEN '0.71%'
        WHEN row_num <= 0.72 * total_rows THEN '0.72%'
        WHEN row_num <= 0.73 * total_rows THEN '0.73%'
        WHEN row_num <= 0.74 * total_rows THEN '0.74%'
        WHEN row_num <= 0.75 * total_rows THEN '0.75%'
        WHEN row_num <= 0.76 * total_rows THEN '0.76%'
        WHEN row_num <= 0.77 * total_rows THEN '0.77%'
        WHEN row_num <= 0.78 * total_rows THEN '0.78%'
        WHEN row_num <= 0.79 * total_rows THEN '0.79%'
        WHEN row_num <= 0.80 * total_rows THEN '0.80%'
        WHEN row_num <= 0.81 * total_rows THEN '0.81%'
        WHEN row_num <= 0.82 * total_rows THEN '0.82%'
        WHEN row_num <= 0.83 * total_rows THEN '0.83%'
        WHEN row_num <= 0.84 * total_rows THEN '0.84%'
        WHEN row_num <= 0.85 * total_rows THEN '0.85%'
        WHEN row_num <= 0.86 * total_rows THEN '0.86%'
        WHEN row_num <= 0.87 * total_rows THEN '0.87%'
        WHEN row_num <= 0.88 * total_rows THEN '0.88%'
        WHEN row_num <= 0.89 * total_rows THEN '0.89%'
        WHEN row_num <= 0.90 * total_rows THEN '0.90%'
        WHEN row_num <= 0.91 * total_rows THEN '0.91%'
        WHEN row_num <= 0.92 * total_rows THEN '0.92%'
        WHEN row_num <= 0.93 * total_rows THEN '0.93%'
        WHEN row_num <= 0.94 * total_rows THEN '0.94%'
        WHEN row_num <= 0.95 * total_rows THEN '0.95%'
        WHEN row_num <= 0.96 * total_rows THEN '0.96%'
        WHEN row_num <= 0.97 * total_rows THEN '0.97%'
        WHEN row_num <= 0.98 * total_rows THEN '0.98%'
        WHEN row_num <= 0.99 * total_rows THEN '0.99%'
        ELSE '100%'
    END AS percentile_bucket
FROM RankedData
ORDER BY views DESC;

