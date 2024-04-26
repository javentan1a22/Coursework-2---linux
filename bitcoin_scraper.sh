#!/bin/bash

# Fetch the CoinDesk Bitcoin price page
url="https://www.coindesk.com/price/bitcoin/"
html_content=$(curl -s -H "Cache-Control: no-cache" "$url")

# Extract the current Bitcoin to USD rate
current_rate=$(echo "$html_content" | grep -oP '(?<=<span class="currency-pricestyles__Price-sc-1v249sx-0 fcfNRE">)[^<]+')

# Extract the 24-hour lowest and highest rates
low_rate=$(echo "$html_content" | grep -oP '(?<=<span class="typography__StyledTypography-sc-owin6q-0 dtjHgI">)[^<]+' | head -n 1)
high_rate=$(echo "$html_content" | grep -oP '(?<=<span class="typography__StyledTypography-sc-owin6q-0 dtjHgI">)[^<]+' | grep '\$' | sort -nr | head -n 1)

# Clean the extracted data to ensure numeric values
current_rate=$(echo "$current_rate" | tr -d ',' | tr -d '$')
low_rate=$(echo "$low_rate" | tr -d ',' | tr -d '$')
high_rate=$(echo "$high_rate" | tr -d ',' | tr -d '$')

# Attempt to insert data into MySQL and capture errors
mysql_output=$(mysql -u root -proot -e "USE bitcoin_data; INSERT INTO bitcoin_prices (current_rate, low_rate, high_rate, timestamp) VALUES ('$current_rate', '$low_rate', '$high_rate', NOW());" 2>&1)

if [[ $? -ne 0 ]]; then
  echo "MySQL error: $mysql_output"
else
  echo "Data inserted successfully."
fi
