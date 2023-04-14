IMAGE=strux-heic-converter
BUILD_PROJECT_ID=shared-build-staging
GITHUB_SHA=12346
CLOUD_RUN_INSTANCE_NAME=heic-converter
# docker build -t "gcr.io/$BUILD_PROJECT_ID/$IMAGE:$GITHUB_SHA" .
# docker push "gcr.io/$BUILD_PROJECT_ID/$IMAGE" --all-tags
gcloud run deploy $CLOUD_RUN_INSTANCE_NAME \
 --image gcr.io/$BUILD_PROJECT_ID/$IMAGE:$GITHUB_SHA \
 --region us-east4 \
 --allow-unauthenticated \
 --vpc-connector struxtion\
 --labels environment=staging \
 --port 8090 \
 --set-env-vars NODE_OPTIONS=--max-old-space-size=1024 \
 --max-instances=1 \
 --min-instances=0 \
 --memory 1024Mi \
 --cpu 1000m



 # gcloud config set project struxtion-staging
 # gcloud config set project shared-build-staging
