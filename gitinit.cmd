git init
git config --local core.quotepath false
#pause
git remote add vb https://github.com/silverbulleters/vanessa-bootstrap.git
#pause
git pull vb develop
#pause 
rd /s /q .git
rd /s /q .github
git init
git config --local core.quotepath false
#pause
git submodule add https://github.com/pumbaEO/precommit1c.git ./vendor/precommit1c
#pause
cd ./vendor/precommit1c/
git submodule init
#pause
git submodule update
#pause
run ./copy-to-hook.cmd
#pause
cd ../../
git add .
#git commit -a -m "init"
pause
