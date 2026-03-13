/* 因子間の交互作用の検出と分析(二元配置分散分析) */
data heart;
   set sashelp.heart;
run;

proc glm data=sashelp.heart;
	class weight_status smoking_status;
	model systolic = weight_status smoking_status weight_status*smoking_status;
	lsmeans weight_status*smoking_status 
	/ pdiff slice= weight_status slice= smoking_status;
run;
