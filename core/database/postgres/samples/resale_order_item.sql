-- Resale Order Item sample data
INSERT INTO cercle_test.resale_order_item (
    id,
    fk_resale_order_id,
    sku,
    name,
    quantity,
    amount_value,
    shipping_code,
    shipping_status,
    created_at,
    updated_at
) VALUES
(
    'b14e75f8-a3d6-4f8d-8a2b-5fbb0cf51001', -- id
    '6ae28fac-280e-4879-bbe3-9277decb4a06', -- fk_resale_order_id (WAP-T0001-00001)
    'LAB-CAMISETA-001', -- sku
    'Camiseta Dry Fit Feminina - Branca/P', -- name
    1, -- quantity
    '219.00', -- amount_value
    'BRTRK1001', -- shipping_code
    'DELIVERED', -- shipping_status
    '2026-06-08 16:32:00', -- created_at
    '2026-06-09 10:40:00' -- updated_at
),
(
    'b14e75f8-a3d6-4f8d-8a2b-5fbb0cf51002', -- id
    '6ae28fac-280e-4879-bbe3-9277decb4a06', -- fk_resale_order_id (WAP-T0001-00001)
    'LAB-LEGGING-002', -- sku
    'Legging Performance Preta/M', -- name
    1, -- quantity
    '319.00', -- amount_value
    'BRTRK1001', -- shipping_code
    'DELIVERED', -- shipping_status
    '2026-06-08 16:32:05', -- created_at
    '2026-06-09 10:40:00' -- updated_at
),
(
    'b14e75f8-a3d6-4f8d-8a2b-5fbb0cf51003', -- id
    '7ae28fac-280e-4879-bbe3-9277decb4a07', -- fk_resale_order_id (SPR-2026-00002)
    'SPS-TENIS-010', -- sku
    'Tênis Running Alpha - Azul/37', -- name
    1, -- quantity
    '349.90', -- amount_value
    'BRTRK1002', -- shipping_code
    'DELIVERED', -- shipping_status
    '2026-06-10 09:16:00', -- created_at
    '2026-06-11 08:20:00' -- updated_at
),
(
    'b14e75f8-a3d6-4f8d-8a2b-5fbb0cf51004', -- id
    '8ae28fac-280e-4879-bbe3-9277decb4a08', -- fk_resale_order_id (MM-2026-00003)
    'MMS-BOLSA-021', -- sku
    'Bolsa Casual Couro Sintético - Caramelo', -- name
    1, -- quantity
    '1299.00', -- amount_value
    'BRTRK1003', -- shipping_code
    'CANCELLED', -- shipping_status
    '2026-06-11 11:43:30', -- created_at
    '2026-06-11 11:46:00' -- updated_at
),
(
    'b14e75f8-a3d6-4f8d-8a2b-5fbb0cf51005', -- id
    '9ae28fac-280e-4879-bbe3-9277decb4a09', -- fk_resale_order_id (SHD-2026-00004)
    'SHD-JAQUETA-030', -- sku
    'Jaqueta Corta Vento Feminina - Grafite/G', -- name
    1, -- quantity
    '589.50', -- amount_value
    'BRTRK1004', -- shipping_code
    'WAITING_PAYMENT', -- shipping_status
    '2026-06-12 14:05:45', -- created_at
    '2026-06-12 14:06:10' -- updated_at
),
(
    'b14e75f8-a3d6-4f8d-8a2b-5fbb0cf51006', -- id
    'aae28fac-280e-4879-bbe3-9277decb4a10', -- fk_resale_order_id (LAB-2026-00005)
    'LAB-MOLETOM-040', -- sku
    'Moletom Feminino Oversized - Off White/M', -- name
    1, -- quantity
    '249.99', -- amount_value
    'BRTRK1005', -- shipping_code
    'SHIPPED', -- shipping_status
    '2026-06-13 18:20:20', -- created_at
    '2026-06-14 08:35:00' -- updated_at
)
ON CONFLICT (id) DO NOTHING;