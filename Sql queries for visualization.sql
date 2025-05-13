SELECT * 
FROM global_youtube
--WHERE country is not NULL
ORDER BY subscribers  DESC;

--Top Youtuber by subscribers
SELECT youtuber, subscribers
FROM global_youtube
ORDER BY subscribers DESC;


--Top channel by video views
SELECT youtuber, video_views 
FROM global_youtube
ORDER BY  video_views DESC;


-- Top channels by highest yearly earnings
SELECT youtuber, highest_yearly_earnings
FROM global_youtube
ORDER BY highest_yearly_earnings DESC;


--Growth trend
SELECT date, SUM(subscribers_last_30_days) AS monthly_sub_growth,
              SUM(video_views_last_30_days) AS monthly_view_growth
FROM global_youtube
WHERE date IS NOT NULL
GROUP BY date
ORDER BY date;


--Most active channels (uploads)
SELECT YouTuber, uploads, category
FROM global_youtube
ORDER BY uploads DESC;


--views by category
SELECT category, SUM(video_views) AS total_views
FROM global_youtube
GROUP BY category
ORDER BY total_views DESC;



--Top  countries by total subscribers 
SELECT country,SUM(subscribers) AS total_subscribers
FROM global_youtube
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_subscribers DESC;



--Education vs youtube penetration
SELECT country, ROUND(AVG(subscribers),2) AS avg_subs,
      ROUND(AVG(Gross_tertiary_education_enrollment),2) AS education_rate
FROM global_youtube
WHERE country IS NOT NULL
GROUP BY country;


--Average earnings by channel type
SELECT country, ROUND(AVG(subscribers),2) AS avg_subs,
      ROUND(AVG(gross_tertiary_education_enrollment),2) AS education_rate
FROM global_youtube
WHERE country IS NOT NULL
GROUP BY country;



--Top channels by channel type rank
SELECT youtuber, channel_type, channel_type_rank
FROM global_youtube
WHERE channel_type_rank BETWEEN 1 AND 10
ORDER BY channel_type_rank;
