# 1. 가벼운 JRE 21 이미지 사용
FROM eclipse-temurin:21.0.3-jre-alpine

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. 빌드된 JAR 파일을 컨테이너 내부로 복사
COPY build/libs/*-SNAPSHOT.jar app.jar

# 4. GCP e2-micro 환경을 위한 JVM 메모리 제한 설정
ENV JAVA_OPTS="-Xms256m -Xmx256m"

# 5. 애플리케이션 실행
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]