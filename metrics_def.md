# 📊 Metrics Definition

This document defines the key metrics used in the Supply Chain Analytics Project for AtliQ Hardware.

---

## 🔹 1. Forecast Accuracy : Measures how close the forecasted demand is to the actual sales.

Formula:
Forecast Accuracy (%) = (1 - (ABS(Actual - Forecast) / Actual)) * 100

Business Impact:
- Higher accuracy → better inventory planning  
- Lower accuracy → risk of stockouts or overstock  

---
## 🔹 2. Forecast Error : Difference between forecasted and actual demand.

Formula:
Forecast Error = Forecast Quantity - Sold Quantity

Interpretation:
- Positive → Overstock risk  
- Negative → Stockout risk  

---

## 🔹 3. Stockout % : Percentage of cases where actual demand exceeded forecast.

Formula:
Stockout % = (COUNT(CASE WHEN Sold Quantity > Forecast Quantity THEN 1 END) / COUNT(*)) * 100

Business Impact:
- Indicates lost sales opportunities  
- Affects customer satisfaction  

---

## 🔹 4. Overstock % : Percentage of cases where forecast exceeded actual demand.

Formula:
Overstock % = (COUNT(CASE WHEN Forecast Quantity > Sold Quantity THEN 1 END) / COUNT(*)) * 100

Business Impact:
- Leads to excess inventory holding cost  
- Impacts working capital  

---

## 🔹 5. Service Level : Measures the ability to meet customer demand without stockouts.

Formula:
Service Level (%) = (COUNT(CASE WHEN Sold Quantity <= Forecast Quantity THEN 1 END) / COUNT(*)) * 100

Business Impact:
- Higher service level → better customer experience  
- Lower service level → higher stockouts  

---

## 🔹 6. Total Demand :  Total units required by customers.

Formula:
Total Demand = SUM(Sold Quantity)

---

## 🔹 7. Total Forecast : Total predicted demand.

Formula:
Total Forecast = SUM(Forecast Quantity)

---

## 🔹 8. Lost Sales (Approximation) :Estimated sales lost due to stockouts.

Formula:
Lost Sales = SUM(CASE 
    WHEN Sold Quantity > Forecast Quantity 
    THEN (Sold Quantity - Forecast Quantity)
    ELSE 0 
END)

Business Impact:
- Direct revenue loss  
- Helps prioritize high-risk products/markets  

---

## 🔹 9. Excess Inventory : Estimated unsold inventory due to over-forecasting.

Formula:
Excess Inventory = SUM(CASE 
    WHEN Forecast Quantity > Sold Quantity 
    THEN (Forecast Quantity - Sold Quantity)
    ELSE 0 
END)

---

## 🔹 10. Fill Rate : Percentage of demand fulfilled from available inventory.

Formula:
Fill Rate (%) = (SUM(LEAST(Sold Quantity, Forecast Quantity)) / SUM(Sold Quantity)) * 100

---
