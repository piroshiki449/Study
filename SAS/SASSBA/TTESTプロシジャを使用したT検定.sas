/* TTESTプロシジャを使用した平均の比較(T検定) */

proc ttest data=sashelp.baseball;
	class League;
	var salary;
run;
