/* CORRプロシジャを使用した不要な変数のスクリーニング */
/* HoeffdingのD統計量とSpearmanの相関統計量を使用して、無関係な変数や非線形関係を見つける方法 */

/* 1 */
ods output spearmancorr=data_s hoeffdingcorr=data_h;
proc corr data=sashelp.baseball
	 spearman hoeffding rank;
	var nAtBat nHits nHome nRuns nRBI nBB
		nOuts nAssts nError;
	with Salary; 
run;

/* 2 */
data spearmanrank(keep=variable scorr spvalue ranksp);
	length variable $25.;
	set data_s;
	array best(*) best1 -- best9;
	array r(*) r1 -- r9;
	array p(*) p1 -- p9;
	do i = 1 to 9;
		variable = best(i);
		scorr = r(i);
		spvalue=p(i);
		ranksp=i;
		output;
	end;
run;
data hoeffdingrank(keep=variable hcorr hpvalue rankhoeff);
	length variable $25.;
	set data_s;
	array best(*) best1 -- best9;
	array r(*) r1 -- r9;
	array p(*) p1 -- p9;
	do i = 1 to 9;
		variable = best(i);
		hcorr = r(i);
		hpvalue=p(i);
		rankhoeff=i;
		output;
	end;
run;

/* 3 */
proc sort data=spearmanrank; by variable; run;
proc sort data=hoeffdingrank; by variable; run;
data final;
	merge spearmanrank hoeffdingrank;
	by variable;
proc sort data=final;
	by ranksp;
run;
proc print data=final;
run;

/* 4 */
proc sgplot data=final;
	refline 8 / axis=y;
	refline 8 / axis=x;
	scatter y=ranksp x=rankhoeff / datalabel=variable;
	yaxis label = "Rank of Spearman Correlation";
	xaxis label = "Rank of Hoeffding Correlation";
	title "Ranks of Spearman Correlations by Ranks of
	 Hoeffding Correlations";
run;


