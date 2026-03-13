/* 1. GLMSELECTによる精密な変数選択 */
proc glmselect data=sashelp.heart;
    /* カテゴリ変数を指定（性別や喫煙状況など） */
    class Sex Smoking_Status; 
    
    /* 収縮期血圧を予測するモデル */
    model Systolic = AgeAtStart Height Weight Diastolic Cholesterol Sex Smoking_Status
        / selection=stepwise /* ステップワイズ法 */
          select=sl          /* P値を基準に選択 */
          slentry=0.01       /* 0.01以下で入部 */
          slstay=0.01        /* 0.01超でクビ */
          details=all;       /* 途中経過を詳しく出力 */
run;

/* 2. REGによる3手法の比較 */
/* ※REGはclass文が使えないため、あらかじめダミー変数化された数値のみ指定します */
proc reg data=sashelp.heart;
    BACKWARD: model Systolic = AgeAtStart Height Weight Diastolic Cholesterol / selection = backward;
    FORWARD:  model Systolic = AgeAtStart Height Weight Diastolic Cholesterol / selection = forward;
    STEPWISE: model Systolic = AgeAtStart Height Weight Diastolic Cholesterol / selection = stepwise;
run;