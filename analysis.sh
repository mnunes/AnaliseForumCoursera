cat networking.html | grep course-forum-post-text | awk 'BEGIN {FS="class=\"course-forum-post-text\">"}; {print $2}' | awk 'BEGIN {FS="</div>"}; {print $1}' > networking.txt

cat networking.txt | sed 's/<br>/ /g' | sed 's|</b>|-|g' | sed 's|<[^>]*>||g' | sed 's/\&nbsp;/ /g' | sed '/^$/d' > networking_stripped.txt



#####

cat text.txt | grep -v received | grep -v "+ Comment" | grep -v "days ago" | grep -v "A post was deleted" | sed '/^$/d' > networking.txt


