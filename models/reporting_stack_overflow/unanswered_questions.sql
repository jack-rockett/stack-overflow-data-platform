SELECT
*
FROM
{{ ref('fct_posts') }}
WHERE
post_type_id = 1
and
is_answered = 'NO'