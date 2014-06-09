default['jmxtrans']['install_prefix'] = '/opt'
default['jmxtrans']['home'] = "#{default['jmxtrans']['install_prefix']}/jmxtrans"
default['jmxtrans']['log_dir'] = '/var/log/jmxtrans'
default['jmxtrans']['user'] = 'jmxtrans'
default['jmxtrans']['url'] = 'https://github.com/downloads/jmxtrans/jmxtrans/jmxtrans-20121016-151320-36564abc7e.zip'
default['jmxtrans']['checksum'] = '4a1e705c0ca69bd040bbc5523f26476a671ac300ba52cf1fa864e7a55783d9ac'
default['jmxtrans']['heap_size'] = '512'
default['jmxtrans']['run_interval'] = '60'
default['jmxtrans']['log_level'] = 'debug'
default['jmxtrans']['graphite']['host'] = 'graphite'
default['jmxtrans']['graphite']['port'] = '2003'

default['jmxtrans']['servers'] = []
default['jmxtrans']['root_prefix'] = 'jmx'
default['jmxtrans']['default_queries'] = {
  'cassandra' => [
    {
      'obj' => 'org.apache.cassandra.db:type=Commitlog',
      'result_alias' => 'Commitlog',
      'attr' => %w(CompletedTasks PendingTasks TotalCommitlogSize)
    },
    {
      'obj' => 'org.apache.cassandra.db:type=CompactionManager',
      'result_alias' => 'CompactionManager',
      'attr' => %w(PendingTasks CompletedTasks)
    },
    {
      'obj' => 'org.apache.cassandra.db:type=StorageProxy',
      'result_alias' => 'StorageProxy',
      'attr' => %w(HintsInProgress RangeOperations ReadOperations WriteOperations RecentRangeLatencyMicros RecentWriteLatencyMicros RecentReadLatencyMicros TotalHints TotalRangeLatencyMicros TotalWriteLatencyMicros TotalReadLatencyMicros)
    },
    {
      'obj' => 'org.apache.cassandra.db:type=StorageService',
      'result_alias' => 'StorageService',
      'attr' => %w(ExceptionCount Load)
    },
    {
      'obj' => 'org.apache.cassandra.net:type=MessagingService',
      'result_alias' => 'MessagingService',
      'attr' => %w(RecentTotalTimouts TotalTimeouts)
    },
    {
      'obj' => 'org.apache.cassandra.request:type=MutationStage',
      'result_alias' => 'Stage/MutationStage',
      'attr' => %w(ActiveCount CompletedTasks CurrentlyBlockedTasks PendingTasks TotalBlockedTasks)
    },
    {
      'obj' => 'org.apache.cassandra.request:type=ReadRepairStage',
      'result_alias' => 'Stage/ReadRepairStage',
      'attr' => %w(ActiveCount CompletedTasks CurrentlyBlockedTasks PendingTasks TotalBlockedTasks)
    },
    {
      'obj' => 'org.apache.cassandra.request:type=ReadStage',
      'result_alias' => 'Stage/ReadStage',
      'attr' => %w(ActiveCount CompletedTasks CurrentlyBlockedTasks PendingTasks TotalBlockedTasks)
    },
    {
      'obj' => 'org.apache.cassandra.request:type=ReplicateOnWriteStage',
      'result_alias' => 'Stage/ReplicateOnWriteStage',
      'attr' => %w(ActiveCount CompletedTasks CurrentlyBlockedTasks PendingTasks TotalBlockedTasks)
    },
    {
      'obj' => 'org.apache.cassandra.request:type=RequestResponseStage',
      'result_alias' => 'Stage/RequestResponseStage',
      'attr' => %w(ActiveCount CompletedTasks CurrentlyBlockedTasks PendingTasks TotalBlockedTasks)
    },
    {
      'obj' => 'org.apache.cassandra.internal:type=AntiEntropySessions',
      'result_alias' => 'Internal/AntiEntropySessions',
      'attr' => %w(ActiveCount CompletedTasks CurrentlyBlockedTasks PendingTasks TotalBlockedTasks)
    },
    {
      'obj' => 'org.apache.cassandra.internal:type=AntiEntropyStage',
      'result_alias' => 'Internal/AntiEntropyStage',
      'attr' => %w(ActiveCount CompletedTasks CurrentlyBlockedTasks PendingTasks TotalBlockedTasks)
    },
    {
      'obj' => 'org.apache.cassandra.internal:type=FlushWriter',
      'result_alias' => 'Internal/FlushWriter',
      'attr' => %w(ActiveCount CompletedTasks CurrentlyBlockedTasks PendingTasks TotalBlockedTasks)
    },
    {
      'obj' => 'org.apache.cassandra.internal:type=GossipStage',
      'result_alias' => 'Internal/GossipStage',
      'attr' => %w(ActiveCount CompletedTasks CurrentlyBlockedTasks PendingTasks TotalBlockedTasks)
    },
    {
      'obj' => 'org.apache.cassandra.internal:type=HintedHandoff',
      'result_alias' => 'Internal/HintedHandoff',
      'attr' => %w(ActiveCount CompletedTasks CurrentlyBlockedTasks PendingTasks TotalBlockedTasks)
    },
    {
      'obj' => 'org.apache.cassandra.internal:type=InternalResponseStage',
      'result_alias' => 'Internal/InternalResponseStage',
      'attr' => %w(ActiveCount CompletedTasks CurrentlyBlockedTasks PendingTasks TotalBlockedTasks)
    },
    {
      'obj' => 'org.apache.cassandra.internal:type=MemtablePostFlusher',
      'result_alias' => 'Internal/MemtablePostFlusher',
      'attr' => %w(ActiveCount CompletedTasks CurrentlyBlockedTasks PendingTasks TotalBlockedTasks)
    },
    {
      'obj' => 'org.apache.cassandra.internal:type=MigrationStage',
      'result_alias' => 'Internal/MigrationStage',
      'attr' => %w(ActiveCount CompletedTasks CurrentlyBlockedTasks PendingTasks TotalBlockedTasks)
    },
    {
      'obj' => 'org.apache.cassandra.internal:type=MiscStage',
      'result_alias' => 'Internal/MiscStage',
      'attr' => %w(ActiveCount CompletedTasks CurrentlyBlockedTasks PendingTasks TotalBlockedTasks)
    },
    {
      'obj' => 'org.apache.cassandra.internal:type=StreamStage',
      'result_alias' => 'Internal/StreamStage',
      'attr' => %w(ActiveCount CompletedTasks CurrentlyBlockedTasks PendingTasks TotalBlockedTasks)
    }
  ],
  'hadoop-datanode' => [
    {
      'obj' => 'hadoop:service=DataNode,name=RpcActivityForPort50020',
      'resultAlias' => 'DataNodeRpcAcitivity',
      'attr' => %w(NumOpenConnections callQueueLen RpcQueueTimeNumOps RpcQueueTimeAvgTime RpcQueueTimeMinTime RpcQueueTimeMaxTime RpcProcessingTimeNumOps RpcProcessingTimeAvgTime RpcProcessingTimeMinTime RpcProcessingTimeMaxTime)
    },
    {
      'obj' => 'hadoop:service=DataNode,name=DataNodeActivity-*-50010',
      'resultAlias' => 'DataNodeActivity',
      'attr' => %w(bytes_written reads_from_remote_client replaceBlockOpNumOps replaceBlockOpAvgTime replaceBlockOpMinTime replaceBlockOpMaxTime block_verification_failures blocks_read heartBeatsNumOps heartBeatsAvgTime heartBeatsMinTime heartBeatsMaxTime copyBlockOpNumOps copyBlockOpAvgTime copyBlockOpMinTime copyBlockOpMaxTime blocks_written readBlockOpNumOps readBlockOpAvgTime readBlockOpMinTime readBlockOpMaxTime blockChecksumOpNumOps blockChecksumOpAvgTime blockChecksumOpMinTime blockChecksumOpMaxTime reads_from_local_client writes_from_remote_client blocks_verified blockReportsNumOps blockReportsAvgTime blockReportsMinTime blockReportsMaxTime writes_from_local_client blocks_replicated bytes_read blocks_removed writeBlockOpNumOps writeBlockOpAvgTime writeBlockOpMinTime writeBlockOpMaxTime readMetadataOpNumOps readMetadataOpAvgTime readMetadataOpMinTime readMetadataOpMaxTime)
    },
    {
      'obj' => 'hadoop:service=DataNode,name=FSDatasetState*',
      'resultAlias' => 'DataNodeFSDatasetState',
      'attr' => %w(Remaining Capacity DfsUsed)
    }
  ],
  'hadoop-jobtracker' => [
    {
      'obj' => 'hadoop:service=JobTracker,name=JobTrackerInfo',
      'resultAlias' => 'JobTrackerInfo',
      'attr' => [
        'ThreadCount'
      ]
    },
    {
      'obj' => 'hadoop:service=JobTracker,name=RpcActivityForPort8021',
      'resultAlias' => 'JobTrackerRpcActivity',
      'attr' => %w(NumOpenConnections ReceivedBytes SentBytes RpcProcessingTimeAvgTime RpcProcessingTimeMinTime RpcProcessingTimeMaxTime RpcProcessingTimeNumOps RpcQueueTimeAvgTime RpcQueueTimeMinTime RpcQueueTimeMaxTime RpcQueueTimeNumOps callQueueLen)
    }
  ],
  'hadoop-namenode' => [
    {
      'obj' => 'hadoop:service=NameNode,name=FSNamesystemState',
      'resultAlias' => 'NameNodeFSNamesystemState',
      'attr' => %w(CapacityTotal CapacityUsed CapacityRemaining TotalLoad BlocksTotal FilesTotal PendingReplicationBlocks UnderReplicatedBlocks ScheduledReplicationBlocks)
    },
    {
      'obj' => 'hadoop:service=NameNode,name=NameNodeActivity',
      'resultAlias' => 'NameNodeActivity',
      'attr' => %w(AddBlockOps fsImageLoadTime FilesRenamed SyncsNumOps SyncsAvgTime SyncsMinTime SyncsMaxTime JournalTransactionsBatchedInSync FileInfoOps CreateFileOps GetListingOps TransactionsNumOps TransactionsAvgTime TransactionsMinTime TransactionsMaxTime GetBlockLocations BlocksCorrupted FilesInGetListingOps SafemodeTime FilesCreated FilesAppended DeleteFileOps blockReportNumOps blockReportAvgTime blockReportMinTime blockReportMaxTime)
    },
    {
      'obj' => 'hadoop:service=NameNode,name=NameNodeInfo',
      'resultAlias' => 'NameNodeInfo',
      'attr' => %w(Threads Used Total Free NonDfsUsedSpace PercentUsed PercentRemaining TotalBlocks TotalFiles)
    },
    {
      'obj' => 'hadoop:service=NameNode,name=RpcActivityForPort8020',
      'resultAlias' => 'NameNodeRpcActivity',
      'attr' => %w(rpcAuthorizationSuccesses rpcAuthorizationFailures SentBytes ReceivedBytes NumOpenConnections callQueueLen rpcAuthenticationSuccesses rpcAuthenticationFailures RpcQueueTimeNumOps RpcQueueTimeAvgTime RpcQueueTimeMinTime RpcQueueTimeMaxTime RpcProcessingTimeNumOps RpcProcessingTimeAvgTime RpcProcessingTimeMinTime RpcProcessingTimeMaxTime)
    }
  ],
  'hadoop-tasktracker' => [
    {
      'obj' => 'hadoop:service=TaskTracker,name=RpcActivityForPort*',
      'resultAlias' => 'TaskTrackerRpcActivity',
      'attr' => %w(NumOpenConnections ReceivedBytes SentBytes RpcProcessingTimeAvgTime RpcProcessingTimeMinTime RpcProcessingTimeMaxTime RpcProcessingTimeNumOps RpcQueueTimeAvgTime RpcQueueTimeMinTime RpcQueueTimeMaxTime RpcQueueTimeNumOps callQueueLen)
    }
  ],
  'jvm' => [
    {
      'result_alias' => 'memory',
      'obj' => 'java.lang:type=Memory',
      'attr' => %w(HeapMemoryUsage NonHeapMemoryUsage)
    },
    {
      'result_alias' => 'memorypool',
      'obj' => 'java.lang:type=MemoryPool,name=*',
      'attr' => ['Usage']
    },
    {
      'result_alias' => 'gc',
      'obj' => 'java.lang:type=GarbageCollector,name=*',
      'attr' => %w(CollectionCount CollectionTime)
    },
    {
      'result_alias' => 'threads',
      'obj' => 'java.lang:type=Threading',
      'attr' => %w(DaemonThreadCount PeakThreadCount ThreadCount TotalStartedThreadCount)
    }
  ],
  'kafka' => [
    {
      'obj' => 'kafka:type=kafka.SocketServerStats',
      'resultAlias' => 'SocketServerStats',
      'attr' => %w(ProduceRequestsPerSecond FetchRequestsPerSecond TotalProduceRequestMs TotalFetchRequestMs TotalBytesWritten TotalBytesRead NumProduceRequests NumFetchRequests BytesWrittenPerSecond BytesReadPerSecond MaxFetchRequestMs AvgFetchRequestMs MaxProduceRequestMs AvgProduceRequestMs)
    },
    {
      'obj' => 'kafka:type=kafka.LogFlushStats',
      'resultAlias' => 'LogFlushStats',
      'attr' => %w(FlushesPerSecond MaxFlushMs TotalFlushMs AvgFlushMs NumFlushes)
    }
  ],
  'tomcat' => [
    {
      'obj' => 'Catalina:type=ThreadPool,name=*',
      'result_alias' => 'connectors',
      'attr' => ['currentThreadCount', 'currentThreadsBusy', '']
    },
    {
      'obj' => 'Catalina:type=GlobalRequestProcessor,name=*',
      'result_alias' => 'requests',
      'attr' => %w(bytesReceived bytesSent errorCount maxTime processingTime requestCount)
    },
    {  'obj' => 'Catalina:type=DataSource,class=javax.sql.DataSource,name=*',
       'result_alias' => 'datasources',
       'attr' => %w(NumActive NumIdle NumQueryThreads)
    }
  ],
  'zookeeper' => [
    {
      'obj' => 'org.apache.ZooKeeperService:name0=ReplicatedServer_id*',
      'attr' => [
        'QuorumSize'
      ]
    },
    {
      'obj' => 'org.apache.ZooKeeperService:name0=ReplicatedServer_id*,name1=replica*,name2=*',
      'attr' => %w(MaxClientCnxnsPerHost MaxRequestLatency AvgRequestLatency MinRequestLatency MaxSessionTimeout MinSessionTimeout OutstandingRequests PacketsReceived PacketsSent PendingRevalidationCount TickTime)
    },
    {
      'obj' => 'org.apache.ZooKeeperService:name0=ReplicatedServer_id*,name1=replica*,name2=*,name3=InMemoryDataTree',
      'attr' => %w(NodeCount WatchCount)
    },
    {
      'obj' => 'org.apache.ZooKeeperService:name0=ReplicatedServer_id*,name1=replica*,name2=*,name3=Connections,name4=*,name5=*',
      'resultAlias' => 'Clients',
      'attr' => %w(AvgLatency LastLatency MaxLatency MinLatency OutstandingRequests PacketsReceived PacketsSent)
    }
  ]
}
