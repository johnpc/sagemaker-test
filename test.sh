# Create a space
aws --region us-west-2 sagemaker create-space --cli-input-json file://create-space-input.json

# Create an app
aws --region us-west-2 sagemaker create-app --cli-input-json file://create-app-input.json

# Poll app creation status
while true; do \
	clear && \
	 aws --region us-west-2 sagemaker list-apps | jq ".Apps[0]"; sleep 5; \
done;

# Create a presigned url
aws --region us-west-2 sagemaker create-presigned-domain-url \
 --domain-id $(aws --region us-west-2 sagemaker list-domains | jq -r ".Domains[0].DomainId") \
 --user-profile-name xss \
 --landing-uri app:JupyterLab: \
 --space-name my-shared-lab-space-oct3

