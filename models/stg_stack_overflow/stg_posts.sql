-- contains more post types than purely questions and answers. leaving aside for this project
SELECT 
id,
title,
body,
REGEXP_REPLACE(body, r'<[^>]+>', '') AS cleaned_body,
accepted_answer_id,
answer_count,
comment_count,
community_owned_date,
creation_date,
favorite_count,
last_activity_date,
last_edit_date,
last_editor_display_name,
last_editor_user_id,
owner_display_name,
owner_user_id,
parent_id,
post_type_id,
CASE WHEN post_type_id = 1 THEN 'Question'
WHEN post_type_id = 2 THEN 'Answer'
ELSE 'Other'
END AS post_type,
score,
tags,
view_count
FROM
{{ ref('stackoverflow_posts') }}