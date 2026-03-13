/* GLMプロシジャを使用した分散分析の実施 */
/* 地区ごとに年俸に差があるかを分析 */
proc glm data=sashelp.baseball;
	class div; /* カテゴリ変数 */
	model salary = div; /* 等号の左辺に目的変数を、右辺に説明変数を指定  */
	means div /tukey hovtest=levene; /* 指定した変数の統計量を計算する  */
	output out = result_anova_baseball;
run;