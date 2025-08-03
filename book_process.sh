#!/bin/bash

BOOK_FILE="Book.txt"

# 1. Convert to lowercase and remove punctuation
cleaned=$(cat "$BOOK_FILE" | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]')

# 2. Replace newlines with spaces (so words don't merge)
cleaned=$(echo "$cleaned" | tr '\n' ' ')

# 3. Split text into sentences (treat newline or period as sentence boundaries)
IFS=$'\n' read -rd '' -a sentences <<<"$(echo "$cleaned" | sed 's/[.]\s*/\n/g')"

# 4. Word frequency
echo "=== Top 10 most frequently used words ==="
echo "$cleaned" | tr ' ' '\n' | tr -s '\n' | sort | uniq -c | sort -nr | head -10

# 5. Word count per sentence
echo -e "\n=== Word count per sentence ==="
for s in "${sentences[@]}"; do
    count=$(echo "$s" | wc -w)
    echo "$count words: $s"
done

# 6. Sentences with more than 10 words
echo -e "\n=== Sentences with more than 10 words ==="
for s in "${sentences[@]}"; do
    count=$(echo "$s" | wc -w)
    if [ $count -gt 10 ]; then
        echo "$s"
    fi
done

# 7. Average number of words per sentence
total_words=$(echo "$cleaned" | wc -w)
total_sentences=${#sentences[@]}
avg=$(echo "scale=2; $total_words / $total_sentences" | bc)
echo -e "\n=== Average number of words per sentence ==="
echo "Average words per sentence: $avg"