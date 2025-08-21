import requests
import json

class ap23011:
    # Set default values 
    DEFAULT_TABLE_ID = 'ta_00d709b730fe48409fe394b718aba247'
    DEFAULT_ROOT_URL = 'https://budi.ditapps.hua.gr'
    DEFAULT_API_KEY = '488973a36b75dcd7b7c5e5454bb41e6a-e2f3662207d5de782384c096d1bb466bcbbc954521fa4535cba3c59ddf5b6c214c9ec64dfb577b0e'
    DEFAULT_APP_ID = 'app_6bb5407cfe8244a0a11269ef7aab6028'
    
    def __init__(self, api_key = DEFAULT_API_KEY,
                        root_url = DEFAULT_ROOT_URL,
                        app_id = DEFAULT_APP_ID,
                        table_id = DEFAULT_TABLE_ID):
        
        self.api_key = api_key
        self.root_url = root_url
        self.app_id = app_id
        self.table_id = table_id
        
    def budi_url(self):
        return self.root_url + '/api/public/v1'
        
    def table_url(self):
        return self.budi_url() + '/tables/' + self.table_id + '/rows/search'
    
    def get_table_data(self):

        headers = {
            "accept": "application/json",
            "x-budibase-app-id": self.app_id,
            "x-budibase-api-key": self.api_key
        }    

        url = self.table_url()
        response = requests.post(url, headers = headers)
        result = response.json()
        return result