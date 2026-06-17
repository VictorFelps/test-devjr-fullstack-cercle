package input

// CreateRetailerInputDTO representa a estrutura de dados de entrada para criar um novo varejista.
type CreateRetailerInputDTO struct {
	DocumentNumber string `json:"document_number"`
	Name           string `json:"name"`
	TradeName      string `json:"trade_name"`
}
