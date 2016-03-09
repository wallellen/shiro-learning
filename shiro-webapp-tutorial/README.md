curl -X POST --user $YOUR_API_KEY_ID:$YOUR_API_KEY_SECRET \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -d '{
           "name" : "Apache Shiro Tutorial Webapp"
        }' \
    'https://api.stormpath.com/v1/applications?createDirectory=true'


curl -X POST --user $YOUR_API_KEY_ID:$YOUR_API_KEY_SECRET \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -d '{
           "givenName": "Jean-Luc",
           "surname": "Picard",
           "username": "jlpicard",
           "email": "capt@enterprise.com",
           "password":"Changeme1"
        }' \
 "https://api.stormpath.com/v1/applications/$YOUR_APPLICATION_ID/accounts"