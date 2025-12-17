import json
def handler(event, context):
    message = 'Hello {} {}!'.format(event['first_name'], event['last_name'])
    # good ol' w3 examples
    info = {
        "Type": "Zip Package",
        "Version": 1
    }
    info_json = json.dumps(info)
    print(info_json)
    return {
        'message' : message
    }