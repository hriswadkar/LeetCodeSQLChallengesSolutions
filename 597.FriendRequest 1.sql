-- Found solution online as my code was not working :(
with requests_cte as
(
    select distinct requester_id, accepter_id as requests from RequestAccepted
),
sender_cte as
(
    select distinct sender_id, send_to_id as senders from FriendRequest
),
final_cte1 (id1, ct) as
(
    select 1 as id1, count(*) from requests_cte
),
final_cte2 (id2, ct) as
(
    select 1 as id2, count(*) from sender_cte
)
select 
    case when 
        f2.ct = 0 
            then 0 
        else 
            convert(decimal(10,2), round((f1.ct * 1.0/f2.ct * 1.0), 2)) 
    end
    as accept_rate 
from 
    final_cte1 f1 inner join final_cte2 f2 on f1.id1 = f2.id2