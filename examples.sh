# Display all lines containing "GET" in the nginx logs
grep "GET" nginx_logs.log

# Count how many times a specific IP address appears in the nginx logs
grep -c "127.0.0.1" nginx_logs.log

# Extract unique IP addresses from the nginx logs
awk '{print $1}' nginx_logs.log | sort | uniq

# Find the most frequent HTTP status codes in the nginx logs
awk '{print $9}' nginx_logs.log | sort | uniq -c | sort -nr

# Grab a specific line
awk '/^Started/ {print $2}' rails.log

# Display all POST requests in the rails logs
grep "POST" rails_logs.log

# Extract timestamps of all requests in the rails logs
grep "Started" rails_logs.log | awk '{print $6, $7}'

# Display only lines containing "Completed 200 OK" in the rails logs
grep "Completed 200 OK" rails_logs.log

# Count the number of unique endpoint requests in the rails logs
grep "Started" rails_logs.log | awk '{print $3}' | sort | uniq -c

# Replace "Completed" with "Processed" in the rails logs and print to console
sed 's/Completed/Processed/' rails_logs.log

# Show all log lines that occurred after a specific time (using timestamp filter)
awk '/2024-11-14 09:10:00/,0' rails_logs.log

# Find all lines containing "GET" in the access log
grep "GET" access-www.log

# Find all lines with a 404 status code in the access log
grep " 404 " access-www.log

# Find all log entries from a specific timestamp
grep "\[12/Nov/2024:22:15:14" access-www.log

# Case-insensitive search for all lines containing "post" in the access log
grep -i "post" access-www.log

# Count the number of occurrences of "GET" in the access log
grep -c "GET" access-www.log

# Display all lines where the 6th column (e.g., status code) is 200
awk '$6 == 200' access-www.log

# Display all lines where the 6th column (e.g., status code) is not 200
awk '$6 != 200' access-www.log

# Print the 7th column (e.g., the request URL or path) from each line in the access log
awk '{print $7}' access-www.log

# Find and print the 7th column (e.g., request path) for lines containing a specific IP address
grep "206.225.203.7" access-www.log | awk '{print $7}'

# Display all lines where the 5th column (e.g., response time) is greater than 0.7
awk '$5 > 0.7' access-www.log

# Pretty print JSON data from a file
cat sample.json | jq '.'

# Get the first item out of the list
jq '.[0]' jq.json

# Extract specific fields from JSON
# This command displays only the "user_id" and "username" fields from the JSON data.
cat sample.json | jq '.user_id, .username'

# Filter JSON data based on a condition
cat logs.json | jq 'select(.status_code == 200)'

# Count the number of occurrences of a field
cat logs.json | jq '[.[] | .user_id] | length'

# This changes the value of the "status" field to "Processed" and prints the modified JSON.
cat logs.json | jq '(.status) |= "Processed"'

# This extracts the "email" field from a nested JSON structure, useful for drilling into deeper structures.
cat nested_logs.json | jq '.user.details.email'

# This creates a new JSON object containing only the "username" and "status_code" fields, ideal for simplifying output.
cat logs.json | jq '{username: .username, status: .status_code}'

# This calculates the sum of the "response_time" field from an array of JSON objects, useful for performance analysis.
cat logs.json | jq '[.[] | .response_time] | add'

# This displays JSON objects where "status_code" is 200 and "method" is "GET", helping to find specific requests.
cat logs.json | jq 'select(.status_code == 200 and .method == "GET")'

# This extracts and formats JSON data from lines containing "Parameters:" in the Rails logs for easier analysis.
grep "Parameters:" rails_logs.log | sed 's/.*Parameters: //' | jq '.'

# This extracts and displays unique "user_id" values from the JSON array, great for identifying unique users.
cat logs.json | jq '[.[] | .user_id] | unique'

# This finds JSON entries with a "status_code" of 500 and formats them with `jq`, useful for error tracking.
grep '"status_code": 500' logs.json | jq '.'

# This filters logs for GET requests, extracts relevant fields, and formats them with `jq`.
grep 'Started GET' rails_logs.log | awk '{print $3, $4, $5, $7}' | jq --raw-input --slurp 'split("\n") | map(select(length > 0))'

# Count how many times each "method" appears in JSON logs
cat logs.json | jq '[.[] | .method] | group_by(.) | map({(.[0]): length}) | add'

