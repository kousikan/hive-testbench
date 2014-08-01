/*
How many items do we sell between pacific times of a day in certain stores to customers with
one dependent count and 2 or less vehicles registered or 2 dependents with 4 or fewer vehicles
registered or 3 dependents and five or less vehicles registered. In one row break the counts
into sells from 8:30 to 9, 9 to 9:30, 9:30 to 10 ... 12 to 12:30
*/
select  *
from
 (select count(*) h8_30_to_9
 from store_sales, household_demographics , time_dim, store
 where store_sales.ss_sold_time_sk = time_dim.t_time_sk   
     and store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk 
     and store_sales.ss_store_sk = store.s_store_sk
     and time_dim.t_hour = 8
     and time_dim.t_minute >= 30
     and ((household_demographics.hd_dep_count = 3 and household_demographics.hd_vehicle_count<=3+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2) or
          (household_demographics.hd_dep_count = 1 and household_demographics.hd_vehicle_count<=1+2)) 
     and store.s_store_name = 'ese') s1,
 (select count(*) h9_to_9_30 
 from store_sales, household_demographics , time_dim, store
 where store_sales.ss_sold_time_sk = time_dim.t_time_sk
     and store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
     and store_sales.ss_store_sk = store.s_store_sk 
     and time_dim.t_hour = 9 
     and time_dim.t_minute < 30
     and ((household_demographics.hd_dep_count = 3 and household_demographics.hd_vehicle_count<=3+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2) or
          (household_demographics.hd_dep_count = 1 and household_demographics.hd_vehicle_count<=1+2))
     and store.s_store_name = 'ese') s2,
 (select count(*) h9_30_to_10 
 from store_sales, household_demographics , time_dim, store
 where store_sales.ss_sold_time_sk = time_dim.t_time_sk
     and store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
     and store_sales.ss_store_sk = store.s_store_sk
     and time_dim.t_hour = 9
     and time_dim.t_minute >= 30
     and ((household_demographics.hd_dep_count = 3 and household_demographics.hd_vehicle_count<=3+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2) or
          (household_demographics.hd_dep_count = 1 and household_demographics.hd_vehicle_count<=1+2))
     and store.s_store_name = 'ese') s3,
 (select count(*) h10_to_10_30
 from store_sales, household_demographics , time_dim, store
 where store_sales.ss_sold_time_sk = time_dim.t_time_sk
     and store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
     and store_sales.ss_store_sk = store.s_store_sk
     and time_dim.t_hour = 10 
     and time_dim.t_minute < 30
     and ((household_demographics.hd_dep_count = 3 and household_demographics.hd_vehicle_count<=3+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2) or
          (household_demographics.hd_dep_count = 1 and household_demographics.hd_vehicle_count<=1+2))
     and store.s_store_name = 'ese') s4,
 (select count(*) h10_30_to_11
 from store_sales, household_demographics , time_dim, store
 where store_sales.ss_sold_time_sk = time_dim.t_time_sk
     and store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
     and store_sales.ss_store_sk = store.s_store_sk
     and time_dim.t_hour = 10 
     and time_dim.t_minute >= 30
     and ((household_demographics.hd_dep_count = 3 and household_demographics.hd_vehicle_count<=3+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2) or
          (household_demographics.hd_dep_count = 1 and household_demographics.hd_vehicle_count<=1+2))
     and store.s_store_name = 'ese') s5,
 (select count(*) h11_to_11_30
 from store_sales, household_demographics , time_dim, store
 where store_sales.ss_sold_time_sk = time_dim.t_time_sk
     and store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
     and store_sales.ss_store_sk = store.s_store_sk 
     and time_dim.t_hour = 11
     and time_dim.t_minute < 30
     and ((household_demographics.hd_dep_count = 3 and household_demographics.hd_vehicle_count<=3+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2) or
          (household_demographics.hd_dep_count = 1 and household_demographics.hd_vehicle_count<=1+2))
     and store.s_store_name = 'ese') s6,
 (select count(*) h11_30_to_12
 from store_sales, household_demographics , time_dim, store
 where store_sales.ss_sold_time_sk = time_dim.t_time_sk
     and store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
     and store_sales.ss_store_sk = store.s_store_sk
     and time_dim.t_hour = 11
     and time_dim.t_minute >= 30
     and ((household_demographics.hd_dep_count = 3 and household_demographics.hd_vehicle_count<=3+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2) or
          (household_demographics.hd_dep_count = 1 and household_demographics.hd_vehicle_count<=1+2))
     and store.s_store_name = 'ese') s7,
 (select count(*) h12_to_12_30
 from store_sales, household_demographics , time_dim, store
 where store_sales.ss_sold_time_sk = time_dim.t_time_sk
     and store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
     and store_sales.ss_store_sk = store.s_store_sk
     and time_dim.t_hour = 12
     and time_dim.t_minute < 30
     and ((household_demographics.hd_dep_count = 3 and household_demographics.hd_vehicle_count<=3+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2) or
          (household_demographics.hd_dep_count = 1 and household_demographics.hd_vehicle_count<=1+2))
     and store.s_store_name = 'ese') s8
;


