#!/bin/bash
sudo apt update 
sudo apt -y install curl
sudo apt-get install -y python3-pip
sudo echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y
sudo touch /tmp/pubsub.sh

sudo cat << 'EOF' > /tmp/pubsub.sh
#!/bin/bash
sudo gcloud pubsub subscriptions pull demo-subs --auto-ack --format='json' | tee -a /tmp/message-$(date +'%d-%m-%Y-%H:%M').json
sudo gsutil cp /tmp/message-*.json gs://mentoring-demo-final/pubsub-messages
EOF

sudo chmod +x /tmp/pubsub.sh
sudo echo "*/6 * * * * /tmp/pubsub.sh" | /usr/bin/crontab