REPO_OWNER="Lyfmeno"
REPO_NAME="Lyph"
BASE_BRANCH="main"
HEAD_BRANCH=$BASE_BRANCH
PR_TITLE="Description of changes"
TOKEN="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"

curl -i -X POST -H "Authorization: token $TOKEN" \
    -d '{"title":"'"$PR_TITLE"'","head":"'"$HEAD_BRANCH"'","base":"'"$BASE_BRANCH"'"}' \
    "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/pulls"