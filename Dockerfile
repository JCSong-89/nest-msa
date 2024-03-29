FROM node:lts

ARG DEBIAN_FRONTEND=noninteractive

# 기본 라이브러리 설치
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils
# 로케일 설정
RUN apt-get install locales -y
RUN localedef -f UTF-8 -i ko_KR ko_KR.UTF-8
# 우분투의 경우 localedef 대신에 locale-gen 으로
# RUN locale-gen ko_KR.UTF-8
ENV LANG=ko_KR.UTF-8
ENV LANGUAGE=ko_KR.UTF-8
ENV LC_ALL=ko_KR.UTF-8

# 타임존 설정
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# node-gyp, PM2 설치
RUN npm install -g node-gyp pm2

# 작업 디렉터리 생성
WORKDIR /app

# 로그 디렉토리 생성
RUN mkdir logs

# 의존성 설치
# 가능한 경우(npm@5+) package.json과 package-lock.json을 모두 복사하기 위해
# 와일드카드를 사용
COPY package*.json ./

RUN npm install
# 프로덕션을 위한 코드를 빌드하는 경우
# RUN npm ci --only=production

# 소스 추가
COPY . .

# 환경 설정파일 복사
COPY .env-production .env

# 소스 빌드
RUN npm run build

# 서비스 포트
EXPOSE 12000

# 서비스 실행
CMD ["pm2-runtime", "start", "dist/src/main.js"]
