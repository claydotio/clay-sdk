# pre-commit.sh
git stash -q --keep-index
npm test
RESULT=$?
[ $RESULT -ne 0 ] && exit 1
git stash pop -q
exit 0
