https://community.hortonworks.com/questions/8552/hive-action-in-failing-in-oozie.html

## Hive Action:
============

1: run su - oozie from SSH window.

2: run hdfs dfs -put /usr/hdp/2.3.2.0-2950/atlas/hook/hive/* /user/oozie/share/lib/lib_20151027124452/hive (assume HDP 2.3.2 used)

3: create a workflow that contains a Hive action.

4: add a property oozie.action.sharelib.for.hive = hive,hcatalog,sqoop in Oozie parameters.

5: create a hive script like above and upload it from "Script name" in the Hive action edit page.

6: Save the workflow.

7: Run it.

## Sqoop Action:
=============

1. Copy mysql jdbc connector if not exists.

   sudo -u oozie hdfs dfs -put /usr/share/java/mysql-connector-java.jar /user/oozie/share/lib/lib_20151027124452/sqoop/
   
2. Restart Oozie
   
## Sapak Action

https://community.hortonworks.com/articles/48920/how-to-run-spark-action-in-oozie-of-hdp-230.html


Oozie Spark action is not supported, but there is a tech note available for HDP customers:
http://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.3.4/bk_spark-guide/content/ch_introduction-spark.html

1. Copy Sharded libs and conf files
sudo -u oozie hdfs dfs mv /user/oozie/share/lib/lib_20151027124452/spark /user/oozie/share/lib/lib_20151027124452/spark_bk
sudo -u oozie hdfs dfs -mkdir /user/oozie/share/lib/lib_20151027124452/spark
sudo -u oozie hdfs dfs -put /usr/hdp/current/spark-client/lib/* /user/oozie/share/lib/lib_20151027124452/spark
sudo -u oozie hdfs dfs -put /usr/hdp/current/oozie-server/share/lib/spark/oozie-sharelib-spark-*.jar  /user/oozie/share/lib/lib_20151027124452/spark
sudo -u oozie hdfs dfs -put /etc/hadoop/conf/hdfs-site.xml /user/oozie/share/lib/lib_20151027124452/spark 
sudo -u oozie hdfs dfs -put /etc/hadoop/conf/core-site.xml /user/oozie/share/lib/lib_20151027124452/spark 
sudo -u oozie hdfs dfs -put /etc/hadoop/conf/mapred-site.xml /user/oozie/share/lib/lib_20151027124452/spark 
sudo -u oozie hdfs dfs -put /etc/hadoop/conf/yarn-site.xml /user/oozie/share/lib/lib_20151027124452/spark 

2. Update oozie sharelib: 
oozie admin -oozie http://<oozie-server>:11000/oozie -sharelibupdate 

3. Modify yarn.resourcemanager.address to the same 8032 instead of 8050 (It seems that oozie only works on 8032)
4. jobTracker=nm:8032









