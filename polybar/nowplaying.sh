nowline=$(mocp -i | grep "^SongTitle:")
nowtitle=$(echo $nowline | head -1 | cut -c12-52)
echo $nowtitle
