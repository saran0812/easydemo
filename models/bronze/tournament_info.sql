{{ config(materialized='table', database = 'EASY_HIST', schema = 'bronze') }}

select 
cric:tournament.id::varchar as id,
cric:tournament.gender::varchar as gender,
cric:tournament.name::varchar as name,
cric:tournament.type::varchar as type,
cric:tournament.sport.id::varchar as sport_id,
cric:tournament.sport.name::varchar as sport_name,
cric:tournament.category.id::varchar as category_id,
cric:tournament.category.name::varchar as category_name,
cric:tournament.category.country_code::varchar as category_country_code,
cric:tournament.current_season.id::varchar as current_season_id,
cric:tournament.current_season.name::varchar as current_season_name,
cric:tournament.current_season.start_date::varchar as current_season_start_date,
cric:tournament.current_season.end_date::varchar as current_season_end_date,
cric:tournament.current_season.year::varchar as current_season_year,
tms.value:abbreviation::varchar as team_abbreviation,
tms.value:country::varchar as team_country,
tms.value:country_code::varchar as team_country_code,
tms.value:gender::varchar as team_gender,
tms.value:name::varchar as team_name,
tms.Value:id::varchar as team_id
from EASY_STAGE.STAGE.tournament_info t
,table(flatten(cric:groups)) res
,table(flatten(res.Value:teams)) tms