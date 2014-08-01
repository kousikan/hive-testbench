/*
Count the number of customers with specific buy potentials and whose dependent count to vehicle count ratio is larger than 1 and who in three consecutive years bought in stores located between 1 and 5 in one purchase. Only purchases in the first 2 days of the months are considered.
*/
select c_last_name
       ,c_first_name
       ,c_salutation
       ,c_preferred_cust_flag 
       ,ss_ticket_number
       ,cnt from
   (select ss_ticket_number
          ,ss_customer_sk
          ,count(*) cnt
    from store_sales,date_dim,store,household_demographics
    where store_sales.ss_sold_date_sk = date_dim.d_date_sk
    and store_sales.ss_store_sk = store.s_store_sk  
    and store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
    and date_dim.d_dom between 1 and 2 
    and (household_demographics.hd_buy_potential = '1001-5000' or
         household_demographics.hd_buy_potential = '5001-10000')
    and household_demographics.hd_vehicle_count > 0
    and case when household_demographics.hd_vehicle_count > 0 then 
             household_demographics.hd_dep_count/ household_demographics.hd_vehicle_count else null end > 1
    and date_dim.d_year in (1998,1998+1,1998+2)
    and ss_sold_date in (
        '1998-01-01', '1998-01-02', '1998-02-01', '1998-02-02', '1998-03-01', '1998-03-02', 
        '1998-04-01', '1998-04-02', '1998-05-01', '1998-05-02', '1998-06-01', '1998-06-02', 
        '1998-07-01', '1998-07-02', '1998-08-01', '1998-08-02', '1998-09-01', '1998-09-02', 
        '1998-10-01', '1998-10-02', '1998-11-01', '1998-11-02', '1998-12-01', '1998-12-02', 
        '1999-01-01', '1999-01-02', '1999-02-01', '1999-02-02', '1999-03-01', '1999-03-02', 
        '1999-04-01', '1999-04-02', '1999-05-01', '1999-05-02', '1999-06-01', '1999-06-02', 
        '1999-07-01', '1999-07-02', '1999-08-01', '1999-08-02', '1999-09-01', '1999-09-02', 
        '1999-10-01', '1999-10-02', '1999-11-01', '1999-11-02', '1999-12-01', '1999-12-02', 
        '2000-01-01', '2000-01-02', '2000-02-01', '2000-02-02', '2000-03-01', '2000-03-02', 
        '2000-04-01', '2000-04-02', '2000-05-01', '2000-05-02', '2000-06-01', '2000-06-02', 
        '2000-07-01', '2000-07-02', '2000-08-01', '2000-08-02', '2000-09-01', '2000-09-02', 
        '2000-10-01', '2000-10-02', '2000-11-01', '2000-11-02', '2000-12-01', '2000-12-02'
    )
    and store.s_county in ('Kittitas County','Adams County','Richland County','Furnas County')
    group by ss_ticket_number,ss_customer_sk) dj,customer
    where dj.ss_customer_sk = customer.c_customer_sk
      and cnt between 1 and 5
    order by cnt desc;


