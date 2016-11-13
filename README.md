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
   




