{{ config(materialized='table', database = 'EASY_HIST', schema = 'bronze') }}

select 
res.value:id::varchar as id,
res.value:gender::varchar as gender,
res.value:name::varchar as name,
res.value:type::varchar as type,
res.value:sport.id::varchar as sport_id,
res.value:sport.name::varchar as sport_name,
res.value:category.id::varchar as category_id,
res.value:category.name::varchar as category_name,
res.value:category.country_code::varchar as category_country_code,
res.value:current_season.id::varchar as current_season_id,
res.value:current_season.name::varchar as current_season_name,
res.value:current_season.start_date::varchar as current_season_start_date,
res.value:current_season.end_date::varchar as current_season_end_date,
res.value:current_season.year::varchar as current_season_year
from EASY_STAGE.STAGE.tournament_list t,
table(flatten (cric:tournaments)) res