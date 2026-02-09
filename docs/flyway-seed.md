# Flyway seed(init__data__) 운영 vs 데모 가이드

이 프로젝트의 `docker/config/flyway`에는 스키마(DDL)와 데모/테스트용 seed 데이터(`init__data__*.sql`)가 함께 있습니다.

## 결론

- **프레젠테이션/데모** 목적이면 seed를 유지하는 게 편합니다.
  - 회원/학습노트/피드백/게시글 같은 데이터가 있어 UI/기능을 바로 시연할 수 있습니다.
- **운영(실서비스)** 목적이면 seed는 최소화하는 게 정석입니다.
  - 테스트 유저/대량 피드백 데이터가 운영 DB로 들어가고
  - `USE mysql_db;`처럼 DB명을 고정하는 SQL이 운영 환경에서 위험합니다.

## 권장 운영 방식

1) 운영 DB(RDS)에는 **스키마 + 운영 필수 seed**(예: bot 1명, 시스템 프롬프트 최소값)만 적용
2) 데모 환경에는 스키마 + `init__data__` 전체 적용

## 데모용 compose

- `docker-compose-demo.yml`은 seed를 포함한 `docker/config/flyway` 전체를 적용합니다.

## 운영용 compose

- `docker-compose-prod.yml`은 운영에 맞게 seed를 분리/최소화하는 구성을 권장합니다.

> 참고: 운영에서 seed를 분리하려면 Flyway `locations`를 디렉토리로 나눠 운영/데모가 서로 다른 경로를 보도록 구성하는 방식이 가장 깔끔합니다.
