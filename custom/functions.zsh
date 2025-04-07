# tse 250402

post() {
  cd /Users/tyleretters/projects/nor.the-rn.info/src/posts
  TITLE=$1 # "Title With Caps"
  DOWNCASE=$(echo $TITLE | tr '[:upper:]' '[:lower:]')
  HYPHENS=$(echo $DOWNCASE | tr " " "-")
  DATE=$(date +%Y-%m-%d)
  FILE=$DATE-$HYPHENS.md
  touch $FILE
  echo "---" >> $FILE
  echo "layout: post" >> $FILE
  echo "title: "$TITLE >> $FILE
  echo "date: "$DATE >> $FILE
  echo "tags: ['Wildcard']" >> $FILE
  echo "---" >> $FILE
  echo "<!--x-->" >> $FILE
  open . # making no assumptions about what i want to do with it now
}

push() {
  git add .
  git commit -m '++'
  git push origin
}

pull() {
  git pull origin main
}