package output

import "time"

// RetailerOutputDTO representa a estrutura de dados de saída para um varejista.
type RetailerOutputDTO struct {
	ID             string     `json:"id"`
	DocumentNumber string     `json:"document_number"`
	Name           string     `json:"name"`
	TradeName      string     `json:"trade_name"`
	CreatedAt      time.Time  `json:"created_at"`
	UpdatedAt      time.Time  `json:"updated_at"`
	DeletedAt      *time.Time `json:"deleted_at,omitempty"`
}

// ListRetailerOutputDTO representa a estrutura de dados de saída para uma lista de varejistas.
type ListRetailerOutputDTO struct {
	Items []RetailerOutputDTO `json:"items"`
}
