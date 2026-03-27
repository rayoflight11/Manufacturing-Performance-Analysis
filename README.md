# Manufacturing-Performance-Analysis
### Project Overview
This project analyzes manufacturing production data to evaluate operational efficiency, identify defect patterns, and uncover insights that can help improve manufacturing performance.
### Business Problem
Manufacturing companies produce large quantities of products every day using different machines. However, problems can occur during production that affect efficiency and product quality.
The company needs to understand what is happening in their production process so they can improve performance.
Some of the key challenges include:
- High number of defective products: Some machines may produce more faulty or damaged products than others.
- Unclear machine performance: It may be difficult to know which machines are performing well and which ones need maintenance.
- Production inefficiencies: Some products may take more resources to produce but generate lower output.
- Lack of visibility into production trends: Without analyzing the data, managers may not know when production is highest or lowest.
- Difficulty making data-driven decisions: Without proper analysis, production managers may rely on guesswork instead of data.
### Aim of this Project
This project analyzes manufacturing production data using SQL to identify production patterns, measure machine performance, and highlight areas where efficiency and product quality can be improved.
### Data Sources
The dataset used for this project is a manufacturing production dataset containing records of daily production activities across different machines and products.
The dataset contains the following columns:
- Product_ID – Unique identifier for each product
- Production_Date – Date of production
- Units_Produced – Total number of units produced
- Defective_Units – Number of defective units
- Machine_ID – Identifier for the machine used
- Production_Cost – Cost of production
- Product_Category – Category of the product
### Data Cleaning and Transformation
- Removed duplicates
- Corrected data types
- Renamed columns
- Checked for inconsistent values
- Created new measures
##### Data cleaning and transformation were important steps to prepare the dataset for accurate analysis and reliable insights.
### Dax Measures Created
Several DAX measures were created to calculate key performance metrics and to support interactive analysis and dashboard visualization in Power BI.
- Total defects
- Defect Rate %
- Production Efficiency
- Waste %
- Overall Efficiency
### Dashboard Design and Visuals
The dashboard was designed in Power BI to provide a clear and interactive view of manufacturing performance and includes:
- KPI cards : These provide a quick overview of overall manufacturing performance
- Used bar chart and column chart for production line and shift comparison
- Line chart- poduction trend over time
- Ribbon chart- Defect rate ranking by production line
- Built slicers- Enables users to interact with dashboard and explore spcific insights
### Key Insights from Dashboard
- High Defect Rates Concentrated in Specific Machines : The dashboard shows that certain machines consistently produce a higher number of defective units compared to others, This indicates possible equipment issues or maintenance gaps and the machines may be operating below optimal performance levels.
- Production is Dominated by a Few Key Products : A small number of products contribute a large portion of the total production volume, these products are likely high demand. Also they have strong impact on overall manufacturing performance, Any issue affecting these products could have a major operational impact.
- Variation in Production Output Over Time : The production trend line shows noticeable fluctuations across different dates.Some periods have high production peaks, while others drop significantly, This could be influenced by:
   - Machine downtime
   - Supply chain interruptions
   - Workforce or scheduling issues
- Defect Rate Impacts Overall Efficiency : Even when production volume is high, the defect rate reduces the number of usable products.
High defect rates lead to:
   - Wasted materials
   - Increased production costs
   - Lower overall efficiency
- 

