INSERT INTO cercle_test.users (
    id,
    email,
    name,
    phone_number,
    document_number,
    nickname,
    created_at,
    updated_at
) VALUES
(
    '0e4a949c-b05c-4778-aeaa-a027ff3d7751',
    'taliaekiu@gmail.com',
    'Talia Ekiu',
    '11912345678',
    '10579550001',
    'talia-ekiu',
    NOW(),
    NOW()
),
(
    '1e4a949c-b05c-4778-aeaa-a027ff3d7752',
    'helena.nogueira@example.com',
    'Helena Nogueira',
    '11923456781',
    '44745727003',
    'helena-nogueira',
    NOW(),
    NOW()
),
(
    '2e4a949c-b05c-4778-aeaa-a027ff3d7753',
    'bianca.sousa@example.com',
    'Bianca Sousa',
    '11923456782',
    '62358156035',
    'bianca-sousa',
    NOW(),
    NOW()
),
(
    '3e4a949c-b05c-4778-aeaa-a027ff3d7754',
    'camila.freitas@example.com',
    'Camila Freitas',
    '11923456783',
    '98658495000',
    'camila-freitas',
    NOW(),
    NOW()
),
(
    '4e4a949c-b05c-4778-aeaa-a027ff3d7755',
    'larissa.melo@example.com',
    'Larissa Melo',
    '11923456784',
    '95763116089',
    'larissa-melo',
    NOW(),
    NOW()
)
ON CONFLICT (email) DO NOTHING;