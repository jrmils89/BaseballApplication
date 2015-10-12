CREATE OR REPLACE view event_list 
AS 
  SELECT p.pitch_id              AS pitch_id, 
         p.des                   AS pitch_des, 
         p.type                  AS pitch_type, 
         CASE 
           WHEN Lower(Trim(p.type)) = 'x' THEN a.event 
           ELSE p.des 
         end                     AS event_des, 
         p.id                    AS pitch_id_two, 
         p.x                     AS x, 
         p.y                     AS y, 
         p.start_speed           AS start_speed, 
         p.end_speed             AS end_speed, 
         p.sz_top                AS sz_top, 
         p.sz_bot                AS sz_bot, 
         p.pfx_x                 AS pfx_x, 
         p.pfx_z                 AS pfx_z, 
         p.px                    AS px, 
         p.pz                    AS pz, 
         p.x0                    AS x0, 
         p.y0                    AS y0, 
         p.z0                    AS z0, 
         p.vx0                   AS vx0, 
         p.vy0                   AS vy0, 
         p.vz0                   AS vz0, 
         p.ax                    AS ax, 
         p.ay                    AS ay, 
         p.az                    AS az, 
         p.break_y               AS break_y, 
         p.break_angle           AS break_angle, 
         p.break_length          AS break_length, 
         p.ball                  AS ball, 
         p.strike                AS strike, 
         p.on_1b                 AS on_1b, 
         p.on_2b                 AS on_2b, 
         p.on_3b                 AS on_3b, 
         p.sv_id                 AS sv_id, 
         p.pitch_type            AS pitch_type_str, 
         p.type_confidence       AS type_confidence, 
         g.game_id               AS game_id, 
         g.date                  AS game_date,
         YEAR(g.date)			 AS game_year,
         MONTH(g.date)			 AS game_month,
         DAYOFMONTH(g.date)		 AS game_day,         
         g.home                  AS home_team, 
         g.away                  AS away_team, 
         g.game                  AS game_num, 
         g.umpire                AS umpire, 
         g.wind                  AS wind, 
         g.wind_dir              AS wind_dir, 
         g.temp                  AS temp, 
         g.type                  AS game_type, 
         g.runs_home             AS runs_home, 
         g.runs_away             AS runs_away, 
         g.local_time            AS local_time, 
         g.away_starting_pitcher AS away_starting_pitcher, 
         g.home_starting_pitcher AS home_starting_pitcher, 
         a.ab_id                 AS ab_id, 
         a.inning                AS ab_inning, 
         a.num                   AS ab_num, 
         a.ball                  AS ab_ball, 
         a.strike                AS ab_strike, 
         a.outs                  AS ab_outs, 
         a.batter                AS batter, 
         a.pitcher               AS pitcher, 
         a.stand                 AS stand, 
         a.des                   AS ab_des, 
         a.event                 AS ab_event, 
         a.hit_x                 AS hit_x, 
         a.hit_y                 AS hit_y, 
         a.hit_type              AS hit_type, 
         t.city                  AS home_team_city, 
         t.name                  AS home_team_name, 
         t2.city                 AS away_team_city, 
         t2.name                 AS away_team_name, 
         b.first                 AS batter_first, 
         b.last                  AS batter_last, 
         b.throws                AS batter_throws, 
         b.height                AS batter_height, 
         p2.first                AS pitcher_first, 
         p2.last                 AS pitcher_last, 
         p2.throws               AS pitcher_throws, 
         p2.height               AS pitcher_height 
  FROM   games g 
         LEFT JOIN atbats a 
                ON g.game_id = a.game_id 
         LEFT JOIN pitches p 
                ON p.ab_id = a.ab_id 
         LEFT JOIN teams t 
                ON t.team = g.home 
         LEFT JOIN teams t2 
                ON t2.team = g.away 
         LEFT JOIN players b 
                ON b.eliasid = a.batter 
         LEFT JOIN players p2 
                ON p2.eliasid = a.pitcher; 