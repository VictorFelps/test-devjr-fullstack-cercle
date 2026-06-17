-- Retailer sample data
INSERT INTO cercle_test.retailer (
    id,
    document_number,
    name,
    trade_name,
    created_at,
    updated_at
) VALUES (
    '550e8400-e29b-41d4-a716-446655440002',
    '29721458000111',
    'LA ABACATEIRA - Sample Retailer',
    'LA ABACATEIRA',
    NOW(),
    NOW()
), (
    '550e8400-e29b-41d4-a716-446655440003',
    '24263930000104',
    'SPORTS STORE - Sample Retailer',
    'SPORTS STORE',
    NOW(),
    NOW()
), (
    '550e8400-e29b-41d4-a716-446655440004',
    '54321098000108',
    'Mulher Maravilha - Sample Retailer',
    'MM Store',
    NOW(),
    NOW()
), (
    '550e8400-e29b-41d4-a716-446655440005',
    '98765432000198',
    'Shield Hero - Sample Retailer',
    'Shield Hero',
    NOW(),
    NOW()
) ON CONFLICT (id) DO NOTHING;