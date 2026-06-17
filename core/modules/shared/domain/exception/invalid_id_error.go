package exception

var (
	ErrInvalidID = &DomainError{Code: "invalid_id", Message: "invalid id"}
)
