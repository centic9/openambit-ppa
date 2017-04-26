# helper script to create a fresh diff against latest Git in ../openambit.git
# and create a corresponding patch into debian/patches

DATE=`date +%Y%m%d`

# git fetch && git rebase origin/master && \
#quilt pop -a ; \

echo "Git Status" && \
cd ../openambit.git && \
git status && \
\
cd ../openambit && \
echo "Status" && \
git status && \
echo "Create diff" && \
diff -Nur -x debian -x .git -x .gitignore -x .pc . ../openambit.git > debian/patches/01_git${DATE}.patch ; \
echo "Series" && \
echo -e "01_git${DATE}.patch\ninstall_example" > debian/patches/series && \
\
git add debian/patches && \
\
\
echo "All done"

#echo "libambit" && \
#cd ../libambit && \
#git status ; \
#echo "diff" && \
#diff -Nur -x debian -x .git -x .pc . ../openambit.git/src/libambit/ > debian/patches/01_git${DATE}.patch ; \
#echo "series" && \
#echo 01_git${DATE}.patch > debian/patches/series && \
#echo "#02_use_hid_package.patch" >> debian/patches/series && \
#\
