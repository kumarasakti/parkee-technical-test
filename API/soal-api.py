import pandas as pd
import requests
from tabulate import tabulate

def create_university_table(country="United States"):
    base_url = "http://universities.hipolabs.com/search"
    params = {"country": country}
    response = requests.get(base_url, params=params)
    data = response.json()
    
    df = pd.DataFrame(data)
    
    selected_columns = {
        "name": "Name",
        "web_pages": "Web Pages",
        "country": "Country",
        "domains": "Domains",
        "state-province": "State Province"
    }
    df = df[selected_columns.keys()].rename(columns=selected_columns)
    

    df_no_state = df[df["State Province"].isna()].copy()

    df_no_state["Web Pages"] = df_no_state["Web Pages"].apply(lambda x: '\n'.join(x) if isinstance(x, list) else x)
    df_no_state["Domains"] = df_no_state["Domains"].apply(lambda x: '\n'.join(x) if isinstance(x, list) else x)
    
    html_table = df_no_state.to_html(index=False, escape=False)
    with open("universities_table.html", "w") as f:
        f.write(html_table)
    
    markdown_table = tabulate(df_no_state, headers='keys', tablefmt='pipe', showindex=False)
    
    console_table = tabulate(df_no_state, headers='keys', tablefmt='grid', showindex=False)
    
    return {
        "dataframe": df_no_state,
        "html": html_table,
        "markdown": markdown_table,
        "console": console_table
    }

def main():
    tables = create_university_table()
    
    print("\nUniversities without State Province data:")
    print(tables["console"])
    
    tables["dataframe"].to_csv("universities_table.csv", index=False)
    tables["dataframe"].to_excel("universities_table.xlsx", index=False)
    
    print("\nExported files:")
    print("- universities_table.csv")
    print("- universities_table.xlsx")
    print("- universities_table.html")

if __name__ == "__main__":
    main()
