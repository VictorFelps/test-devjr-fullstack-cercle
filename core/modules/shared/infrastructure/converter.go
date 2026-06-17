package infrastructure

import (
	"database/sql"
	"time"
)

// NullTimeToPointer converte um sql.NullTime para um ponteiro de time.Time.
// Se o valor não for válido, retorna nil.
func NullTimeToPointer(value sql.NullTime) *time.Time {
	if !value.Valid {
		return nil
	}
	t := value.Time
	return &t
}
