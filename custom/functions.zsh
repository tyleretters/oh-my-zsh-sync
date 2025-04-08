# tse 250408

function tidy() {
  local current_branch=$(git rev-parse --abbrev-ref HEAD)

  if [[ -z "$current_branch" ]]; then
    echo "Error: Unable to determine current branch."
    return 1
  fi

  if [[ "$current_branch" == "main" ]]; then
    echo "Current branch is main. Skipping checkout."
  else
    git checkout main 2>/dev/null || {
      echo "Error: Failed to checkout main."
      return 1
    }
  fi

  if git pull --ff-only 2>&1 >/dev/null; then
    echo "Main branch pulled successfully (fast-forward)."
  elif [[ $? -eq 0 ]]; then
    echo "Main branch already up to date."
  else
    echo "Error: Failed to pull main with fast-forward only."
    return 1
  fi

  if [[ "$current_branch" != "main" ]]; then
    git branch -D "$current_branch" 2>/dev/null || {
      echo "Error: Failed to delete branch '$current_branch'."
      return 1
    }

    git checkout -b "$current_branch" 2>/dev/null || {
      echo "Error: Failed to create and checkout branch '$current_branch'."
      return 1
    }
  fi

  echo "Branch '$current_branch' reset to match main."
}

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