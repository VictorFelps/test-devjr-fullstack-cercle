package input

// UpdateRetailerInputDTO representa a estrutura de dados de entrada para atualizar um varejista existente.
type UpdateRetailerInputDTO struct {
	Name      string `json:"name"`
	TradeName string `json:"trade_name"`
}
