/*
Compute the revenue ratios across item classes: For each item in a list of
given categories, during a 30 day time period, sold through the web channel
compute the ratio of sales of that item to the sum of all of the sales in that item's
class.
*/
select  i_item_desc 
      ,i_category 
      ,i_class 
      ,i_current_price
      ,i_item_id
      ,sum(ws_ext_sales_price) as itemrevenue 
      ,sum(ws_ext_sales_price)*100/sum(sum(ws_ext_sales_price)) over
          (partition by i_class) as revenueratio
from	
	web_sales
    	,item 
    	,date_dim
where 
	web_sales.ws_item_sk = item.i_item_sk 
  	and item.i_category in ('Jewelry', 'Sports', 'Books')
  	and web_sales.ws_sold_date_sk = date_dim.d_date_sk
	and date_dim.d_date between '2001-01-12' and '2001-02-11'
	and ws_sold_date between '2001-01-12' and '2001-02-11'
group by 
	i_item_id
        ,i_item_desc 
        ,i_category
        ,i_class
        ,i_current_price
order by 
	i_category
        ,i_class
        ,i_item_id
        ,i_item_desc
        ,revenueratio
limit 100;


