/*
For all items sold in stores locatred in six states during a given year, find the average quantity, average list price, average list sales price, average coupon amount for a given gender, marital status, education and customer demographic.
*/
select  i_item_id,
        s_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where store_sales.ss_sold_date_sk = date_dim.d_date_sk and
       store_sales.ss_item_sk = item.i_item_sk and
       store_sales.ss_store_sk = store.s_store_sk and
       store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk and
       customer_demographics.cd_gender = 'F' and
       customer_demographics.cd_marital_status = 'D' and
       customer_demographics.cd_education_status = 'Unknown' and
       date_dim.d_year = 1998 and
       ss_sold_date between '1998-01-01' and '1998-12-31' and
       store.s_state in ('KS','AL', 'MN', 'AL', 'SC', 'VT')
 group by i_item_id, s_state
 order by i_item_id
         ,s_state
 limit 100;


