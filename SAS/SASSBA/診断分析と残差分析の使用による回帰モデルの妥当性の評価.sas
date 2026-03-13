/* 診断分析と残差分析の使用による回帰モデルの妥当性の評価 */

/* 残差分析 */
ods graphics on;
proc reg data=sashelp.baseball;
	model salary = nAtBat nHits nHome nRuns;
run;

/* 診断分析、Rstudent残差、レバレッジ、CookのD */
proc reg data=sashelp.baseball;
	model salary = nAtBat nHits nHome nRuns
	 / collinoint vif influence;
	 
	 /* 結果出力 P=予測値 r=差分 Cookd=外れ値算出 */
	 output out=results p=p_salary r=diff cookd =cookd;
run;
