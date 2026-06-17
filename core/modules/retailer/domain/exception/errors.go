package exception

// DomainError representa um erro de domínio com um código e uma mensagem
var (
	ErrInvalidRetailerID             = &DomainError{Code: "invalid_retailer_id", Message: "invalid retailer id"}
	ErrInvalidRetailerDocumentNumber = &DomainError{Code: "invalid_retailer_document_number", Message: "invalid retailer document number"}
	ErrInvalidRetailerName           = &DomainError{Code: "invalid_retailer_name", Message: "retailer name must be between 2 and 100 characters"}
	ErrInvalidRetailerTradeName      = &DomainError{Code: "invalid_retailer_trade_name", Message: "retailer trade name must be between 2 and 25 characters"}
	ErrRetailerNotFound              = &DomainError{Code: "retailer_not_found", Message: "retailer not found"}
	ErrRetailerDeleted               = &DomainError{Code: "retailer_deleted", Message: "retailer is deleted"}
	ErrRetailerDocumentNumberExists  = &DomainError{Code: "retailer_document_number_exists", Message: "retailer document number already exists"}
)
