package exception

// DomainError é um erro de domínio que carrega tanto um código legível por máquina quanto uma mensagem legível por humanos.
type DomainError struct {
	Code    string
	Message string
}

func (e *DomainError) Error() string { return e.Message }
