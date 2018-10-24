SELECT
movieTitle.original_title,
movieTitle.title_id,
movieTitle.premiered,
movieRatings.rating,
movieCrew.person_id,
moviePeople.name


FROM titles as movieTitle
left join ratings as movieRatings on movieTitle.title_id =movieRatings.title_id 
left join crew as movieCrew on movieTitle.title_id =movieCrew.title_id 
left join people as moviePeople on movieCrew.person_id =moviePeople.person_id 


Where moviePeople.name  =‘William Shakespeare’

order by movieRatings.rating desc
limit 100