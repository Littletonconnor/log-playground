# Log-Playground

An easy-to-setup log analysis environment for learning and testing various command-line tools like `grep`, `sed`, `awk`, `uniq`, and `sort`! 🎉

## Overview

This playground includes sample logs from NGINX and Rails, allowing you to practice and learn how to analyze and filter log data effectively. The provided `examples.sh` script includes useful commands and tips for working with log files.

## Contents

- **nginx_logs.log**: A sample NGINX access log file with various HTTP requests and status codes.
- **rails_logs.log**: A sample Rails log file with detailed request processing information.
- **examples.sh**: A shell script with examples demonstrating how to use common command-line tools to analyze the logs.
- **README.md**: Documentation explaining the playground and how to use it.

## Getting Started

1. Clone the repository or create the folder structure and copy the files.
2. Run the `examples.sh` script or use it as a reference to try out commands on your own.

## Commands Overview

### Useful `grep` Commands
- `grep "GET" nginx_logs.log`: Find all GET requests in the NGINX logs.
- `grep "POST" rails_logs.log`: Display all POST requests in the Rails logs.

### Using `awk` for Extraction
- `awk '{print $1}' nginx_logs.log | sort | uniq`: Extract and list unique IP addresses.
- `grep "Started" rails_logs.log | awk '{print $3}' | sort | uniq -c`: Count unique request paths.

### `sed` for Replacement
- `sed 's/Completed/Processed/' rails_logs.log`: Replace the word "Completed" with "Processed" in the Rails logs.

### Sorting and Counting
- `awk '{print $9}' nginx_logs.log | sort | uniq -c | sort -nr`: Find the most frequent HTTP status codes.

## Requirements

- Bash shell
- Basic knowledge of command-line tools (`grep`, `sed`, `awk`, `uniq`, `sort`)

