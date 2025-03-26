Real-Time Stock Market Analysis Dashboard

📌 Project Overview
This project is a Real-Time Stock Market Analysis Dashboard built using R and Shiny. It allows users to:
✔️ Search for stock symbols (e.g., AAPL, TSLA, RELIANCE.NS)
✔️ Retrieve real-time stock data using the quantmod package
✔️ Visualize stock trends with interactive plots
✔️ View stock price data in a table format

🛠️ Technologies Used
R (Primary language)

Shiny (For creating the web app)

DT (For interactive data tables)

quantmod (For fetching stock data)

ggplot2 (For data visualization)

dplyr (For data manipulation)

📂 Project Structure
app.R – Main script containing UI and server logic

README.md – Project documentation

requirements.txt – List of required R packages (optional)

🚀 Features
✅ Stock Symbol Input: Users enter a stock ticker to fetch real-time data
✅ Date Range Selection: Adjustable slider to choose the number of past days to analyze
✅ Interactive Plot: Displays stock price trends
✅ Data Table: Shows raw stock price data

🔧 How to Run the Project
Install Required Packages
install.packages(c("shiny", "DT", "quantmod", "ggplot2", "dplyr"))

Run the App
shiny::runApp("app.R")


