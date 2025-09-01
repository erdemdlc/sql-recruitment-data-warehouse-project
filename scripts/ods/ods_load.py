# ------------------------------
# Script Purpose:
    # This script loads data into the 'ods' schema from GoogleSheets files. It must be run three times for three different spreadsheets. The “Google Sheet ID” section must be changed for each spreadsheet, and the entity name in the table_name section will be updated according to the uploaded spreadsheet (e.g., table_name = f“ods.at_{clean_name(sheet_name)}” OR table_name = f“ods.kt_{clean_name(sheet_name)}”).
    # It performs the following actions:
    # - Truncates the ods tables before loading data.
# Usage Example: C:\Users\ASUS\Desktop\DWH_Project  python at_load.py;
# ------------------------------



import pandas as pd
import pyodbc
import gspread
from google.oauth2.service_account import Credentials
import re
import time

# ------------------------------
# Google Sheets Connection
# ------------------------------
SHEET_ID = "Google Sheet ID" 
credentials = Credentials.from_service_account_file(
    "credentials.json",
    scopes=["https://www.googleapis.com/auth/spreadsheets",
            "https://www.googleapis.com/auth/drive"]
)
gc = gspread.authorize(credentials)
spreadsheet = gc.open_by_key(SHEET_ID)

# ------------------------------
# SQL Server Connection
# ------------------------------
conn_str = (
    "Driver={ODBC Driver 17 for SQL Server};"
    "Server=localhost;"
    "Database=TechnoHR;"
    "Trusted_Connection=yes;"
)
conn = pyodbc.connect(conn_str)
cursor = conn.cursor()

# ------------------------------
# Turkish characters and other unacceptable characters are converted here.
# ------------------------------
def clean_name(name: str) -> str:
    turkish_map = str.maketrans("çğıöşüÇĞİÖŞÜ", "cgiosuCGIOSU")
    name = name.strip().translate(turkish_map)
    name = name.replace(".", "_").replace("\\", "_").replace("/", "_")
    name = re.sub(r'[^0-9a-zA-Z_]', '_', name)
    name = re.sub(r'_+', '_', name)
    return name.strip("_").lower()

# ------------------------------

def sheet_to_df(sheet):
    data = sheet.get_all_values()
    if not data:
        return None, None

    headers = [clean_name(h) for h in data[0]]
    df = pd.DataFrame(data[1:], columns=headers)

    df = df.loc[:, df.columns.str.strip() != '']
    return sheet.title, df

# ------------------------------
for sheet in spreadsheet.worksheets():
    sheet_name, df = sheet_to_df(sheet)
    time.sleep(1) 
    if df is None or df.empty:
        continue

    table_name = f"ods.at_{clean_name(sheet_name)}"

    cursor.execute(f"IF OBJECT_ID('{table_name}', 'U') IS NOT NULL DROP TABLE {table_name}")
    conn.commit()

    columns_sql = ", ".join([f"[{col}] NVARCHAR(MAX)" for col in df.columns])
    cursor.execute(f"CREATE TABLE {table_name} ({columns_sql})")
    conn.commit()

    df = df.where(pd.notna(df), None)
    df = df.replace({"": None})
    df = df.astype(str).replace({"None": None})

    columns_sql_list = [f"[{col}]" for col in df.columns]
    placeholders = ", ".join("?" * len(columns_sql_list))
    insert_sql = f"INSERT INTO {table_name} ({', '.join(columns_sql_list)}) VALUES ({placeholders})"

    for _, row in df.iterrows():
        cursor.execute(insert_sql, tuple(row))
    conn.commit()

    print(f"Tablo yüklendi: {table_name} ({len(df)} satır)")

cursor.close()
conn.close()
