FROM suhothayan/hadoop-spark-pig-hive:2.9.2

EXPOSE 50070 8088 8080

# Copy the Hive and Pig scripts into the container
COPY hive.hql /usr/local/hive_scripts/hive.hql
COPY pig_script.pig /usr/local/pig_scripts/pig_script.pig

CMD ["bash"]
