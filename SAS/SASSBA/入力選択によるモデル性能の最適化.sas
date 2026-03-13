/* 分析の実行 */
proc logistic data=sashelp.heart;
    /* 1. 目的変数：Statusが 'Dead'（死亡）である確率をモデル化 */
    model Status(event='Dead') = 
        AgeAtStart Height Weight Diastolic Systolic 
        Cholesterol AgeCHDdiag MRW Smoking
        / selection = score    /* 最適部分集合選択（Score法） */
          best = 3             /* 各変数個数ごとに、上位3件ずつ表示 */
          start = 1            /* 変数1個のモデルから探索開始 */
          stop = 5;            /* 変数5個までの組み合わせを探索 */
run;