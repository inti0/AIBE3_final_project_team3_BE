-- bot/admin 계정 최소 seed
-- 비밀번호는 bcrypt("test1234") 해시를 사용

-- NOTE: V1__schema.sql에서 DB를 생성/선택합니다. (여기서는 USE만 수행)
USE `mysql_db`;

-- 이미 존재하면 중복 삽입되지 않도록 idempotent 하게 처리
INSERT INTO members (
  email, password, name, nickname, country,
  interests, english_level, description, role,
  membership_grade, last_seen_at, is_blocked, blocked_at,
  is_deleted, deleted_at, block_reason, profile_image_url,
  created_at, modified_at
)
SELECT * FROM (
  SELECT
    'bot@bot.com' AS email,
    '$2a$10$k1PEYBKO83YurbOiVR/tc.HUEdc9w9ZTYPlYTjBznNcNiWnZ6Bl5S' AS password,
    'Bot' AS name,
    'bot' AS nickname,
    'KR' AS country,
    '["📚 reading", "🎵 music"]' AS interests,
    'BEGINNER' AS english_level,
    '봇 계정' AS description,
    'ROLE_MEMBER' AS role,
    'BASIC' AS membership_grade,
    NOW() AS last_seen_at,
    FALSE AS is_blocked,
    NULL AS blocked_at,
    FALSE AS is_deleted,
    NULL AS deleted_at,
    NULL AS block_reason,
    NULL AS profile_image_url,
    NOW() AS created_at,
    NOW() AS modified_at
  UNION ALL
  SELECT
    'admin@admin.com',
    '$2a$10$k1PEYBKO83YurbOiVR/tc.HUEdc9w9ZTYPlYTjBznNcNiWnZ6Bl5S',
    'Admin',
    'admin',
    'KR',
    '["🚀 space", "⚙️ robots"]',
    'INTERMEDIATE',
    '관리자 계정',
    'ROLE_ADMIN',
    'BASIC',
    NOW(),
    FALSE,
    NULL,
    FALSE,
    NULL,
    NULL,
    NULL,
    NOW(),
    NOW()
) AS v
WHERE NOT EXISTS (
  SELECT 1 FROM members m WHERE m.email = v.email
);
