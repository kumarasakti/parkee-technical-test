import pandas as pd
import numpy as np
from datetime import datetime

def combine_branch_data(file_paths):
    dataframes = []
    for file in file_paths:
        df = pd.read_csv(file)
        dataframes.append(df)
    return pd.concat(dataframes, ignore_index=True)

def clean_data(df):
    df_cleaned = df.copy()
    
    df_cleaned = df_cleaned.dropna(subset=['transaction_id', 'date', 'customer_id'])
    
    df_cleaned.loc[:, 'date'] = pd.to_datetime(df_cleaned['date'])
    
    df_cleaned = df_cleaned.sort_values('date', ascending=False)
    df_cleaned = df_cleaned.drop_duplicates(subset='transaction_id', keep='first')
    
    return df_cleaned

def calculate_total_sales(df):
    df = df.copy()
    
    df.loc[:, 'total_sale'] = df['price'] * df['quantity']
    
    total_sales = df.groupby('branch')['total_sale'].sum().reset_index()
    total_sales.columns = ['branch', 'total']
    
    return total_sales

def main():
    file_paths = ['/content/branch_a.csv', '/content/branch_b.csv', '/content/branch_c.csv']
    
    print("Branch A Raw data")
    print(df_branch_a)
    print("Branch B Raw data")
    print(df_branch_b)
    print("Branch C Raw data")
    print(df_branch_c)
    
    try:
        print("Combining CSV files...")
        combined_df = combine_branch_data(file_paths)
        print(f"Combined data shape: {combined_df.shape}")
        
        print("\nCleaning data...")
        cleaned_df = clean_data(combined_df)
        print(f"Cleaned data shape: {cleaned_df.shape}")
        
        print("\nCalculating total sales...")
        total_sales_df = calculate_total_sales(cleaned_df)
        
        print("\nTotal sales per branch:")
        print(total_sales_df)
        
    except Exception as e:
        print(f"An error occurred: {str(e)}")

if __name__ == "__main__":
    main()
