with recursive cposts(m_messageid, m_content, m_ps_imagefile, m_creationdate, m_c_replyof, m_creatorid) AS (
      select message.m_messageid, m_content, m_ps_imagefile, m_creationdate, m_c_replyof, m_creatorid
      from message
      where m_creatorid = :personId
      order by m_creationdate desc
      limit 10
), parent(postid, replyof, orig_postid, creator) AS (
      select cposts.m_messageid, m_c_replyof, cposts.m_messageid, m_creatorid
      from cposts
    UNION ALL
      select message.m_messageid, message.m_c_replyof, orig_postid, message.m_creatorid
      from message, parent
      where message.m_messageid = replyof
)
select p1.m_messageid, COALESCE(m_ps_imagefile, m_content, ''), p1.m_creationdate,
       p2.m_messageid, p2.p_personid, p2.p_firstname, p2.p_lastname
from 
     (select m_messageid, m_content, m_ps_imagefile, m_creationdate, m_c_replyof from cposts
     ) p1
     left join
     (select orig_postid, postid as m_messageid, p_personid, p_firstname, p_lastname
      from parent, person
      where replyof is null and creator = p_personid
     )p2  
     on p2.orig_postid = p1.m_messageid
      order by m_creationdate desc, p2.m_messageid desc;
;
