-- name: InsertRetailer :exec
INSERT INTO cercle_test.retailer (
    id,
    document_number,
    name,
    trade_name,
    created_at,
    updated_at,
    deleted_at
) VALUES (@id, @document_number, @name, @trade_name, @created_at, @updated_at, @deleted_at);

-- name: UpdateRetailer :execrows
UPDATE cercle_test.retailer
SET name = @name,
    trade_name = @trade_name,
    updated_at = @updated_at
WHERE id = @id
  AND deleted_at IS NULL;

-- name: SoftDeleteRetailer :execrows
UPDATE cercle_test.retailer
SET deleted_at = NOW(),
    updated_at = NOW()
WHERE id = @id
  AND deleted_at IS NULL;

-- name: SelectRetailerByID :one
SELECT
    id,
    document_number,
    name,
    trade_name,
    created_at,
    updated_at,
    deleted_at
FROM cercle_test.retailer
WHERE id = @id
  AND deleted_at IS NULL;

-- name: SelectRetailerList :many
SELECT
    id,
    document_number,
    name,
    trade_name,
    created_at,
    updated_at,
    deleted_at
FROM cercle_test.retailer
WHERE deleted_at IS NULL
ORDER BY created_at DESC;
