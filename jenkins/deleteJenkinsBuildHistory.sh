echo 'delete build history';

for jobname in $(find /Users/Shared/AndroidBuild -type d -depth 1)
	do
    	echo $(basename $jobname);
        firstBuild=$(find $jobname -type d -ctime +3 -depth 1 -exec basename {} \;|head -1);
        lastBuild=$(find $jobname -type d -ctime +3 -depth 1 -exec basename {} \;|tail -1);
        echo $firstBuild;
        echo $lastBuild;
        if [ ! -n "$firstBuild" ]
        then
        	echo 'find no such file!';
        else
        	firstBuild=3;
        	lastBuild=10;
        	curl -X POST http://10.28.100.6:8080/jenkins/job/cleanOldBuildFile/[$firstBuild-$lastBuild]/doDeleteAll;
        fi
done

echo 'delete apk file';
find /Users/Shared/AndroidBuild -type d -ctime +4 -maxdepth 2 -print -exec rm -rfv {} \;

