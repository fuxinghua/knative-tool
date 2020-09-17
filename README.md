# knative-tool
knative相关工具，如安装、问题排查等

## knative 墙内安装
    knative镜像为md5方式的tag，一般的镜像站都不同步该类型的镜像，安装knative的最蛋疼的地方就是镜像的同步
    解决思路： 用阿里云海外按量付费ECS下载knative镜像，打tag同步到阿里云镜像站
### 前提依赖
  * k8s
    参考k8s官方的安装推荐手册， 安装源可以使用阿里云的源：https://developer.aliyun.com/mirror/
  * istio
    参考官方安装手册
### 镜像同步脚本

```
#!/bin/bash
set -eux

CR_URL=registry.cn-hangzhou.aliyuncs.com/xavierx
GCR_IO_BASE_URL=gcr.io/knative-releases/knative.dev/
TARGET_VERSION=v0.17.0
#
for i in 
QUEUE=serving/cmd/queue@sha256:bba041b926e31e9d5da2cb799001b31fce4c519037334db3751eb5f69d0f227f:knative.dev-serving-queue
ACTIVATOR=serving/cmd/activator@sha256:18aadbb4796d7b6316ae971be5233dac28cd794c517e220d127aa9e21d91df42:knative.dev-serving-activator
AUTOSCALER=serving/cmd/activator@sha256:18aadbb4796d7b6316ae971be5233dac28cd794c517e220d127aa9e21d91df42:knative.dev-serving-activato
CONTROLLER=serving/cmd/controller@sha256:5f118d434661a895096c69c036de20c962aee445e339cc9e1b1bf806895d6fa2:knative.dev-serving-controller
WEBHOOK=serving/cmd/webhook@sha256:d36f460aea55b93cce222bcee129776dee356e6499db73f232bfdf482ce28f66:knative.dev-serving-webhook
ISTIO_CONTROLLER=net-istio/cmd/controller@sha256:6da903d755509b5d9618491177ff5efc7a39e998d33c1383db461bc99a5e439:knative.dev-istio-controller
ISTIO_WEBHOOK=net-istio/cmd/webhook@sha256:3e9eacff55f07aacfd46ce28c472ee8c8999c284b3347d3c46eeb67347b2ea67:knative.dev-istio-webhook

```
