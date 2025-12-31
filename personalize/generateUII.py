import csv
import random
import time

# Users and Items
users = [f"u{i:04d}" for i in range(1, 101)]
items = [f"i{i:04d}" for i in range(1001, 1101)]

# adjusting event distribution to include more purchases
event_types = ["view"]*65 + ["add_to_cart"]*20 + ["purchase"]*15


num_interactions = 10000 # how many interactions to generate
start_timestamp = int(time.time()) - 60*60*24*30  # last 30 days

with open("useriteminteraction2.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["USER_ID","ITEM_ID","EVENT_TYPE","TIMESTAMP"])
    for _ in range(num_interactions):
        user = random.choice(users)
        item = random.choice(items)
        event = random.choice(event_types)
        timestamp = start_timestamp + random.randint(0, 60*60*24*30)
        writer.writerow([user, item, event, timestamp])
