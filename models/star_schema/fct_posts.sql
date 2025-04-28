-- creating fact table for questions and answers table 
WITH t1 as(
SELECT
*
FROM 
{{ ref('stg_posts_questions') }}
UNION ALL
SELECT
*
FROM
{{ ref('stg_posts_questions') }}
)
SELECT
id,
title,
body,
cleaned_body,
accepted_answer_id,
CASE WHEN accepted_answer_id IS NOT NULL THEN 'YES'
ELSE 'NO' END AS is_answered,
answer_count,
comment_count,
community_owned_date,
creation_date,
favorite_count,
last_activity_date,
last_edit_date,
last_editor_user_id,
owner_user_id,
parent_id,
post_type_id,
post_type,
score,
tags,
view_count
FROM 
t1
