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
./src/sync-image.sh
```
