import csv
from faker import Faker
import pandas as pd
import random
import re
from sqlalchemy import create_engine
import time
time.sleep(10)

def is_valid_email(email):
    return re.match(r'^[^@]+@[^@]+\.[^@]+$', email)
fake = Faker()

with open('users.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['user_id', 'name', 'email', 'signup_date'])

    for user_id in range(1, 1001):
        writer.writerow([
            user_id,
            fake.name(),
            fake.email(),
            fake.date_time_this_year().isoformat()
        ])
data = pd.read_csv('users.csv')
data['signup_date'] = pd.to_datetime(data['signup_date']).dt.strftime('%Y-%m-%d')
data['email'].apply(is_valid_email)
data['domain'] = data['email'].apply(lambda x: x.split('@')[-1])
engine = create_engine('postgresql://postgres:4771@db:5432/Test_task')
data.to_sql('users', engine, if_exists='replace', index=False)
print(data.head())