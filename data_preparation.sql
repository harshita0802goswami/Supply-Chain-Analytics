# SUPPLY CHAIN ANALYTICS 
use gdb0041;
-- Part 1: Sales with Forecast (base)
Create table fact_actual_est(
		SELECT 
			s.date,
			s.fiscal_year,
			s.product_code,
			s.customer_code,
			s.sold_quantity,
			IFNULL(f.forecast_quantity, 0) AS forecast_quantity
		FROM fact_sales_monthly s
		LEFT JOIN fact_forecast_monthly f 
		USING (date, customer_code, product_code)

		UNION ALL

		-- Part 2: Only Forecast rows NOT in Sales
		SELECT 
			f.date,
			f.fiscal_year,
			f.product_code,
			f.customer_code,
			0 AS sold_quantity,
			f.forecast_quantity
		FROM fact_forecast_monthly f
		LEFT JOIN fact_sales_monthly s 
		USING (date, customer_code, product_code)
		WHERE s.product_code IS NULL
);

	update fact_actual_est
	set sold_quantity = 0
	where sold_quantity is null;

	update fact_actual_est
	set forecast_quantity = 0
	where forecast_quantity is null;
    
   
