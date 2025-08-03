# linux-assignment-02

📄 Log and Text Processing Scripts

This project contains two Bash scripts to process an Apache access log and a book text file.
📂 Files

    access.log – sample log file with web server access records

    Book.txt – sample book text file

    access_log_process.sh – script to process the access log

    book_process.sh – script to process the book text file

 Tasks Performed by Scripts
 
access_log_process.sh

    Extract all unique IP addresses.

    Count how many times each IP has appeared.

    Identify the IP address with the most requests.

    Extract all unique endpoints from the log file.

    Count the number of times each endpoint has been requested and sort it in ascending order.

 book_process.sh

    Convert all text to lowercase.

    Remove punctuation.

    Count the frequency of each unique word.

    Display the top 10 most frequently used words with their counts.

    Count how many words are in each sentence.

    Display only sentences with more than 10 words.

    Calculate and display the average number of words per sentence.

🚀 How to Run
1️ Clone the repository

git clone <your_repo_url>
cd <your_repo_name>

2️ Make the scripts executable

chmod +x access_log_process.sh book_process.sh

3️ Run the scripts

./access_log_process.sh
./book_process.sh

Expected Output

    The scripts will display all required results directly in the terminal.
