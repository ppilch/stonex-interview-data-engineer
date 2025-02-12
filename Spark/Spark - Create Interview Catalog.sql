-- Databricks notebook source
-- MAGIC %md
-- MAGIC Create the catalog

-- COMMAND ----------

CREATE CATALOG IF NOT EXISTS Interview

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Create schemas

-- COMMAND ----------

CREATE SCHEMA IF NOT EXISTS Bronze;
CREATE SCHEMA IF NOT EXISTS Silver;
CREATE SCHEMA IF NOT EXISTS Gold;
