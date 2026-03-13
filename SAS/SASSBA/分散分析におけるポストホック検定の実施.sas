/* 分散分析におけるポストホック検定の実施 */
proc glm data=sashelp.baseball;
	class div;
	model salary = div;
	lsmeans div / 
	/*①または②のどちらかのみを使用する*/
	/*①*/
/* 	pdiff=all adjust=tukey; */
	/*②*/
	pdiff=control('AE') adjust=dunnett;  
run;

