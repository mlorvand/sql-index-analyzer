SELECT 
  FileGroupName = DS.name , 
  DF.physical_name , DF.name , DF.size  
 ,FileGroupType = CASE DS.type
      WHEN 'FG' THEN 'Filegroup'
      WHEN 'FD' THEN 'Filestream'
      WHEN 'FX' THEN 'Memory-optimized'
      WHEN 'PS' THEN 'Partition Scheme'
      ELSE 'Unknown'
       END
-- ,AllocationDesc = AU.type_desc
 ,TotalSizeKB = SUM(AU.total_pages / 0.128) -- 128 pages per megabyte
 ,UsedSizeKB  = SUM(AU.used_pages / 0.128)
 ,DataSizeKB  = SUM(AU.data_pages / 0.128)
 ,SchemaName  = SCH.name
 ,TableName  = OBJ.name
 ,IndexType  = CASE IDX.type
      WHEN 0 THEN 'Heap'
      WHEN 1 THEN 'Clustered'
      WHEN 2 THEN 'Nonclustered'
      WHEN 3 THEN 'XML'
      WHEN 4 THEN 'Spatial'
      WHEN 5 THEN 'Clustered columnstore'
      WHEN 6 THEN 'Nonclustered columnstore'
      WHEN 7 THEN 'Nonclustered hash'
       END
 ,IndexName  = IDX.name
 ,is_default  = CONVERT(INT,DS.is_default)
FROM	sys.data_spaces    DS  LEFT JOIN 
		sys.allocation_units AU  ON DS.data_space_id = AU.data_space_id LEFT JOIN 
		sys.partitions   PA  ON  (AU.type IN (1, 3) AND AU.container_id = PA.hobt_id) OR 
								 (AU.type = 2   AND AU.container_id = PA.partition_id) LEFT JOIN 
		sys.objects    OBJ ON  PA.object_id = OBJ.object_id LEFT JOIN 
		sys.schemas    SCH ON  OBJ.schema_id = SCH.schema_id LEFT JOIN 
		sys.indexes    IDX ON  PA.object_id = IDX.object_id AND 
							   PA.index_id  = IDX.index_id LEFT JOIN 
		sys.database_files DF ON DF.data_space_id = ds.data_space_id
WHERE  OBJ.type_desc = 'USER_TABLE' AND IDX.type = 0-- only include user tables 
  OR DS.type  = 'FD'   -- or the filestream filegroup
GROUP BY DS.name,SCH.name,OBJ.name,IDX.type,IDX.name, DF.physical_name , DF.name , DF.size  , DS.type,DS.is_default -- discard different allocation units
ORDER BY DS.name,SCH.name,OBJ.name,IDX.name;



