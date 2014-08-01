/*
Generate counts of promotional sales and total sales, and their ratio from the
web channel for a particular item category and month to customers in a given
time zone.
*/
select sum(case when ssci.customer_sk is not null and csci.customer_sk is null then 1 else 0 end) store_only
      ,sum(case when ssci.customer_sk is null and csci.customer_sk is not null then 1 else 0 end) catalog_only
      ,sum(case when ssci.customer_sk is not null and csci.customer_sk is not null then 1 else 0 end) store_and_catalog
from 
( select ss_customer_sk customer_sk
      ,ss_item_sk item_sk
from store_sales
JOIN date_dim ON store_sales.ss_sold_date_sk = date_dim.d_date_sk
where
  d_month_seq between 1193 and 1193 + 11
  and ss_sold_date between '1999-06-01' and '2000-05-31'
group by ss_customer_sk ,ss_item_sk) ssci
full outer join
( select cs_bill_customer_sk customer_sk
      ,cs_item_sk item_sk
from catalog_sales
JOIN date_dim ON catalog_sales.cs_sold_date_sk = date_dim.d_date_sk
where
  d_month_seq between 1193 and 1193 + 11
  and cs_sold_date between '1999-06-01' and '2000-05-31'
group by cs_bill_customer_sk ,cs_item_sk) csci
on (ssci.customer_sk=csci.customer_sk and ssci.item_sk = csci.item_sk)
limit 100;

