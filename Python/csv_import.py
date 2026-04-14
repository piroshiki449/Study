import pandas as pd

def csv_import(filepath):
    """
    CSVファイルを読み込む。

    Args:
        filepath: CSVファイルのパス
    Returns:
        DataFrame
    """
    try:
        df = pd.read_csv(filepath, encoding="utf-8")
        print(f"読み込み完了: {filepath} ({len(df)}行 × {len(df.columns)}列)")
        return df
    except FileNotFoundError:
        print(f"ファイルが見つかりません: {filepath}")
    except Exception as e:
        print(f"エラーが発生しました: {e}")
    return None

# 使用例
df = csv_import(r"S:\Study\TESTDATA\baseball.csv")