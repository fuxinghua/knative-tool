#!/bin/bash
set -eux

CR_URL=registry.cn-hangzhou.aliyuncs.com/xavierx
GCR_IO_BASE_URL=gcr.io/knative-releases/knative.dev/
TARGET_VERSION=v0.17.0

serving_queue=${GCR_IO_BASE_URL}/serving/cmd/queue@sha256:bba041b926e31e9d5da2cb799001b31fce4c519037334db3751eb5f69d0f227f
docker pull $serving_queue
docker tag $serving_queue $CR_URL/knative.dev-serving-queue:$TARGET_VERSION
docker push $CR_URL/knative.dev-serving-queue:$TARGET_VERSION

serving_activator=${GCR_IO_BASE_URL}/serving/cmd/activator@sha256:18aadbb4796d7b6316ae971be5233dac28cd794c517e220d127aa9e21d91df42
docker pull $serving_activator
docker tag $serving_activator $CR_URL/knative.dev-serving-activator:${TARGET_VERSION}
docker push $CR_URL/knative.dev-serving-activator:${TARGET_VERSION}

serving_autoscaler=${GCR_IO_BASE_URL}/serving/cmd/autoscaler@sha256:0af019e5d0b936468f85f5ca3c658b4913e5ac08734cf377bbbd8ba93eaa9db0
docker pull $serving_autoscaler
docker tag $serving_autoscaler $CR_URL/knative.dev-serving-autoscaler:${TARGET_VERSION}
docker push $CR_URL/knative.dev-serving-autoscaler:${TARGET_VERSION}

serving_controller= gcr.io/knative-releases/knative.dev/serving/cmd/controller@sha256:5f118d434661a895096c69c036de20c962aee445e339cc9e1b1bf806895d6fa2
docker pull $serving_controller
docker tag $serving_controller $CR_URL/knative.dev-serving-controller:${TARGET_VERSION}
docker push $CR_URL/knative.dev-serving-controller:${TARGET_VERSION}

serving_webhook=${GCR_IO_BASE_URL}/serving/cmd/webhook@sha256:d36f460aea55b93cce222bcee129776dee356e6499db73f232bfdf482ce28f66
docker pull $serving_webhook
docker tag $serving_webhook $CR_URL/knative.dev-serving-webhook:${TARGET_VERSION}
docker push $CR_URL/knative.dev-serving-webhook:${TARGET_VERSION}

serving_istio_controller=${GCR_IO_BASE_URL}/net-istio/cmd/controller@sha256:6da903d755509b5d9618491177ff5efc7a39e998d33c1383db461bc99a5e439
docker pull $serving_istio_controller
docker tag $serving_istio_controller $CR_URL/knative.dev-istio-controller:${TARGET_VERSION}
docker push $CR_URL/knative.dev-istio-controller:${TARGET_VERSION}

serving_webhook=${GCR_IO_BASE_URL}/net-istio/cmd/webhook@sha256:3e9eacff55f07aacfd46ce28c472ee8c8999c284b3347d3c46eeb67347b2ea67
docker pull $serving_webhook
docker tag $serving_webhook $CR_URL/knative.dev-istio-webhook:${TARGET_VERSION}
docker push $CR_URL/knative.dev-istio-webhook:${TARGET_VERSION}
