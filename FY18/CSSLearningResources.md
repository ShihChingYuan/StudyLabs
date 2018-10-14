# FY18

## High Availability
[High Availability Solutions (SQL Server)](https://docs.microsoft.com/en-us/sql/sql-server/failover-clusters/high-availability-solutions-sql-server)

作為 HA 手段的解決方案有下列數種：
* [Always On Failover Cluster Instances](https://docs.microsoft.com/zh-tw/sql/sql-server/failover-clusters/windows/always-on-failover-cluster-instances-sql-server)
    - 若背後有 Shared Storage，建議採本方案
    - 保護層級：SQL Instance
    - FCI in WSFC
      - 網路名稱, IP 位址  
      - SQL Server Database Engine, Agent, Analysis Services
      - File Stream
* [Always On Availability Groups](https://docs.microsoft.com/zh-tw/sql/database-engine/availability-groups/windows/always-on-availability-groups-sql-server)
    - 若僅想藉由 SQL Server 層級作為保護手段，建議採本方案
    - 保護層級：SQL Database
* Database mirroring
* Log shipping
    - 不支援 Always On 版本的 SQL Server 版本，則建議採本方案
    - [SQL Server 2016 的版本及支援功能](https://docs.microsoft.com/zh-tw/sql/sql-server/editions-and-components-of-sql-server-2016?view=sql-server-2017)


## Cluster



* [建立新的 SQL Server 容錯移轉叢集 (安裝程式)](https://docs.microsoft.com/zh-tw/sql/sql-server/failover-clusters/install/create-a-new-sql-server-failover-cluster-setup?view=sql-server-2017)

* [Step-by-step Installation of SQL Server 2016 on a Windows Server 2016 Failover Cluster - Part 1](https://www.mssqltips.com/sqlservertip/4769/stepbystep-installation-of-sql-server-2016-on-a-windows-server-2016-failover-cluster--part-1/)

* [Step-by-Step Guide for Setting Up A Windows Server 2012 Domain Controller](http://social.technet.microsoft.com/wiki/contents/articles/12370.step-by-step-guide-for-setting-up-a-windows-server-2012-domain-controller.aspx)

* [Creating an Active/Active SQL Cluster using Hyper-V: Part1 Virtualized Storage](http://blogs.technet.com/b/meamcs/archive/2012/04/10/creating-an-active-active-sql-cluster-using-hyper-v-part1-virtualized-storage.aspx)

* [STEP-BY-STEP: HOW TO CONFIGURE A SQL SERVER FAILOVER CLUSTER INSTANCE (FCI) IN MICROSOFT AZURE IAAS #SQLSERVER #AZURE #SANLESS](https://clusteringformeremortals.com/2015/01/01/step-by-step-how-to-configure-a-sql-server-failover-cluster-instance-fci-in-microsoft-azure-iaas-sqlserver-azure-sanless/)

## AlwaysOn
* [SQL Server 2012 - AlwaysOn 安裝與設定教學](http://caryhsu.blogspot.tw/2011/09/sql-server-2011-code-name-denali.html)

* [Step-By-Step: Creating a SQL Server 2012 AlwaysOn Availability Group](
https://blogs.technet.microsoft.com/canitpro/2013/08/19/step-by-step-creating-a-sql-server-2012-alwayson-availability-group/)

* [AlwaysOn 可用性群組概觀 (SQL Server)](https://docs.microsoft.com/zh-tw/sql/database-engine/availability-groups/windows/overview-of-always-on-availability-groups-sql-server?view=sql-server-2017)

* [High availability and disaster recovery for SQL Server in Azure Virtual Machines](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sql/virtual-machines-windows-sql-high-availability-dr)

* [Extend on-premises Always On Availability Groups to Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sqlclassic/virtual-machines-windows-classic-sql-onprem-availability)

* [Configure a load balancer for an Always On availability group in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sql/virtual-machines-windows-portal-sql-alwayson-int-listener)

* [Domain Independent Availability Groups](https://docs.microsoft.com/en-us/sql/database-engine/availability-groups/windows/domain-independent-availability-groups?view=sql-server-2017)

## Replication
* [Replication Tutorials](https://msdn.microsoft.com/en-us/library/aa337389.aspx)
* [Tutorial: Preparing the Server for Replication](https://msdn.microsoft.com/en-us/library/aa337475.aspx)
