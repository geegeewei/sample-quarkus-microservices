# 使用 GraalVM 作为基础镜像
FROM ghcr.io/graalvm/graalvm-ce:ol8-java17-22.3.2
WORKDIR /app

# 复制 Quarkus 应用程序的构建输出
COPY build/quarkus-app/lib/ /app/lib/
COPY build/quarkus-app/*-runner.jar /app/app.jar

# 设置启动命令和相关环境变量
EXPOSE 8080
ENV JAVA_OPTS="-Dquarkus.http.host=0.0.0.0 -Djava.util.logging.manager=org.jboss.logmanager.LogManager"
ENV AB_JAR="/app/app.jar"

# 启动 Quarkus 应用程序
CMD exec java $JAVA_OPTS -jar $AB_JAR
