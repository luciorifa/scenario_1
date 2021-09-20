#!/bin/bash
sudo apt update 

sudo touch /tmp/pubsub.sh

sudo cat << 'EOF' > /tmp/pubsub.sh
#!/bin/bash
sudo gcloud pubsub subscriptions pull demo-subs --auto-ack --format='json' | tee -a /tmp/message-$(date +'%d-%m-%Y-%H:%M').json
sudo gsutil cp /tmp/message-*.json gs://mentoring-demo-final/pubsub-messages
EOF

sudo chmod +x /tmp/pubsub.sh
sudo echo "*/6 * * * * /tmp/pubsub.sh" | /usr/bin/crontab
