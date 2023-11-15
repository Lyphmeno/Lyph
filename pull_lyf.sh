REPO_OWNER="Lyfmeno"
REPO_NAME="Lyph"
BASE_BRANCH="main"
HEAD_BRANCH=$BASE_BRANCH
PR_TITLE="Description of changes"
TOKEN="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"

curl -i -X POST -H "Authorization: token $TOKEN" \
    -d '{"title":"'"$PR_TITLE"'","head":"'"$HEAD_BRANCH"'","base":"'"$BASE_BRANCH"'"}' \
    "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/pulls"