/* カテゴリ変数の水準数削減 */
/* クラスター分析による水準数のまとめ */
data heart;
	set sashelp.heart;
	if status = "Dead" then status_flag=1;
	else status_flag=0;
run;
proc means data=heart nway;
	class smoking_status;
	var status_flag;
	output out=probstatus
	mean=prob;
run;

title “Results of Cluster Analysis on smoking_status”;
ods output clusterhistory=cluster;
run;

proc cluster data=probstatus
 method=ward 
 outtree=treeinfo
 plots=(dendrogram(vertical height=rsq));
	freq _freq_;
	var prob;
	id smoking_status;
run;

proc print data=cluster;
title “Contents of the Cluster History”;
run;
