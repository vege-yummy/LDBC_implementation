select p1.m_creatorid, p_firstname, p_lastname, p1.m_creationdate, p1.m_messageid, p1.m_content
  from message p1, message p2, person
  where
      p1.m_c_replyof = p2.m_messageid and
      p2.m_creatorid = :personId and
      p_personid = p1.m_creatorid
order by p1.m_creationdate desc, p1.m_messageid asc
limit 20
;
