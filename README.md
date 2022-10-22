#  what is LDBC SNB 
LDBC(Linked Data Benchmark Council) developed the benchmark to test graph database. LDBC SNB(Social Network Benchmark) is one of the benchmarks. LDBC SNB includes the Interactive workload , which consists of user-centric transactional-like interactive queries, and the Business Intelligence workload, which includes analytic queries to respond to business-critical questions. 

LDBC SNB includes 3 components: Data Generator (Datagen), Test Driver (Test Driver, used to execute Benchmark's tests) and Test Case Implementation. 
#  Project Description
In this project, we select Neo4j as the graph database. We use LDBC SNB Datagen Hadoop tp generate data, LDBC Neo4j Implementation to convert and load data, and LDBC SNB Driver to run benchmark. 
#  LDBC SNB Data Generator 
## introduction 
The LDBC SNB Data Generator (Datagen) produces the datasets for the LDBC Social Network Benchmark's workloads. And it's responsible for providing the datasets used by all the LDBC benchmarks. This data generator is designed to produce directed labelled graphs that mimic the characteristics of those graphs of real data. 

There are two different versions of the Datagen: for the Business Intelligence workload, use the Spark-based Datagen and for the Interactive workload, use the Hardoop-based Datagen. In our project, we used the Hadoop-based Datagen. 
## scale factor
The scale factor determines the size of the generated graph dataset. In our project, we set the scale factor to 1. 
## data schema 
The LDBC SNB Data represents a simulation of the activity of a social network during a period. Data includes entities such as Persons, Organizations and Places. And it also includes relationships such as the way persons interact, by means of the friendship relations established with other persons, and the sharing of messages. Persons can form groups about specific topics, which are represented as tags. 
![data schema](/Users/mac/Desktop/schema-comfortable.png)
### Entities 
### Relations
## data generation using Datagen Hadoop
### Set Parameters and Environment Variables 
### Generate Data 
#  LDBC SNB Interative Implementation
## Load Data using Neo4j Cypher implementation 
