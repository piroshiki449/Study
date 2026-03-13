
/* 線形重回帰モデルのREG、PLMおよびGLMプロシジャ出力の分析 */

proc reg data=sashelp.baseball;
	model Salary = nAtBat nHits nHome nRuns
	/ clb alpha=.5 scorr2;
run;
