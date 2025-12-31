import boto3

client = boto3.client('personalize-runtime')

campaign_arn = 'arn:aws:personalize:ca-central-1:169634835787:campaign/eth-campaign'
user_id = 'u0051'
item_id = 'i1001'
#context = {'itemId': 'i1001'}

response = client.get_recommendations(
    campaignArn = campaign_arn,
    userId = user_id,
    itemId = item_id
)

for item in response['itemList']:
    print(f"Item ID: {item['itemId']} Score: {item.get('score', 'N/A')}")