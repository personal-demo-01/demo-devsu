# #!/bin/bash
echo "*** Create service"
service=$(cat scripts/service.json |\
    jq ".cluster=\"$AWS_ECS_CLUSTER_NAME\"" |\
    jq ".serviceName=\"$AWS_ECS_SERVICE_NAME\"" |\
    jq ".taskDefinition=\"$TASK_FAMILY\"" )

echo $service | xargs -0 aws ecs create-service --cli-input-json

echo "*** Set autoscaling"
aws application-autoscaling register-scalable-target --service-namespace ecs \
  --scalable-dimension ecs:service:DesiredCount \
  --resource-id service/$AWS_ECS_CLUSTER_NAME/$AWS_ECS_SERVICE_NAME \
  --min-capacity 1 --max-capacity 2
