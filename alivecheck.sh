#!/bin/bash
for protocol in "http://" "https://"; do
    while read line;
    do
        echo $protocol$line: $(curl -L --write out "%{http_code}\n" --output /dev/null --silent --insecure $protocol$line)
    if [ $code = "000"]; then
        echo "$protocol$line: not responding."
    else
        echo "$protocol$line: HTTP $code"
        echo "$protocol$line: $code" >> alive.txt
    done < domains.txt
done
