hugo
cd ..
xcopy /I /E /Y site\public dest
cd site
git checkout gh-pages
cd ..
xcopy /I /E /Y dest site
cd site
git commit -am "release"
git push origin gh-pages
git checkout master
