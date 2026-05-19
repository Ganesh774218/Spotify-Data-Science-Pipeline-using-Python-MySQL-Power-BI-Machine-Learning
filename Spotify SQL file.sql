create database Spotify;
use spotify;
select * from spotify_hits_cleaned;

alter table spotify_hits_cleaned rename to spotifyhits;
select * from spotifyhits;

-- 1) Total Distinct artists
select count(distinct artist) as distinct_artist from spotifyhits;

-- 2) Top 10 artists by track count
select artist, count(*) as top_ten_artists_by_track_count from spotifyhits group by artist order by top_ten_artists_by_track_count desc limit 10;

-- 3) Top 10 songs by popularity
select song, count(*) as top_ten_songs_by_popularity from spotifyhits group by song order by top_ten_songs_by_popularity desc limit 10;

-- 4) Explicit and Non‑explicit counts
select explicit, count(*) as count from spotifyhits group by explicit;

-- 5) Basic audio feature averages time 
select round(avg(danceability),3) as avg_danceability,round(avg(energy),3) as avg_energy,round(avg(valence),3) as avg_valence,round(avg(tempo),1) as avg_tempo from spotifyhits; 

-- 6) Average popularity by year
select year, round(avg(popularity),2) as avg_popularity , count(*) as releases from spotifyhits group by year order by year;

-- 7) Top 15 genres by count
select genre,count(*) as top_15_genres from spotifyhits group by genre order by top_15_genres desc limit 15;

-- 8) Average energy and danceability by genre top 10
select genre, round(avg(energy),3) as avg_energy,round(avg(danceability),3) as avg_danceability,count(*) as count from spotifyhits group by
genre order by count desc limit 10;

-- 9) Tempo distribution buckets
select case when tempo<80 then "<80" when tempo between 80 and 99.999 then "80-99" when tempo between 100 and 119.999 then "100-119"
when tempo between 120 and 139.999 then "120-139" else ">-140" end as tempo_bucket, count(*) as count from spotifyhits group by tempo_bucket
order by field(tempo_bucket, "<80", "80-99","100-119","120-139",">=140");

-- 10) Top 20 songs with highest instrumentalness
select artist, song, instrumentalness from spotifyhits order by instrumentalness desc limit 20;

-- 11) Artists with highest average popularity (min 10 tracks)
select artist, round(avg(popularity),2) as avg_pop, count(*) as count from spotifyhits group by artist having count>=10 order by avg_pop
desc limit 20;

-- 12) Top track per year (window function)
select year,artist,song,popularity from (select year,artist,song,popularity,row_number() over(partition by year order by popularity desc)
as rn from spotifyhits) t where rn=1 order by year; 

-- 13)  Top 10 artists by average popularity (≥5 songs)
select artist,round(avg(popularity),2) as avg_pop, count(*) as track_count from spotifyhits group by artist having count(*)>=5 order by
avg_pop desc limit 10;

-- 14) Most “danceable” songs per year
select year, artist, song, danceability from (select year, artist, song, danceability, row_number() over (partition by year order by 
danceability desc) as rn from spotifyhits) t where rn=1 order by year;

-- 15) Artists with most explicit songs
select artist, count(*) as explicit_count from spotifyhits where explicit="Yes" group by artist order by explicit_count desc limit 10;

-- 16) Songs with longest duration
select artist, song, duration_min_sec from spotifyhits order by substring_index(duration_min_sec, ":",1)*60 +
substring_index(duration_min_sec, ":", -1)desc limit 10;

-- 17) Explicit  songs compare with non explicit songs
select explicit,avg(popularity) as avg_popularity from spotifyhits group by explicit;

-- 18) Artist appear most often in the top hits lists
select artist,count(*) as hit_count from spotifyhits group by artist order by hit_count desc limit 15;