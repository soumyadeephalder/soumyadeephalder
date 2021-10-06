## frist open your server and then add proses in pm2 

## 2nd step 

### open sites-available default via nano editor 

```javascript
sudo nano /etc/nginx/sites-available/default
```

### Add new line 
```javascript

    server {
            listen 80 ; # for use ipv4
            listen [::]:80 ; # for use ipv6

            server_name example.com; # pls rename Domane name.

            location /  {
                    proxy_pass    http://127.0.0.1:3010; # make sure change your service port 
                    proxy_http_version 1.1;
                    proxy_set_header Upgrade $http_upgrade;
                    proxy_set_header Connection 'upgrade';
                    proxy_set_header Host $host;
                    proxy_cache_bypass $http_upgrade;
            }
    }

```
#### Next, test to make sure that there are no syntax errors in any of your Nginx files:

```javascript 
sudo nginx -t
```
 
#### If no problems were found, restart Nginx to enable your changes:


```javascript
sudo systemctl restart nginx
```
 
#### Nginx should now be serving both of your domain names.
