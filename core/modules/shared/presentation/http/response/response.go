package response

import (
	"crypto/rand"
	"encoding/hex"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

// SuccessDocument define a estrutura de resposta para casos de sucesso, contendo um campo "data" que pode ser de qualquer tipo.
type SuccessDocument struct {
	Data any `json:"data"`
}

// ErrorDocument define a estrutura de resposta para casos de erro, contendo um campo "errors" que é uma lista de objetos de erro.
type ErrorDocument struct {
	Errors []ErrorObject `json:"errors"`
}

// ErrorObject define a estrutura de cada objeto de erro, contendo campos como ID, status, código, título, detalhe e fonte do erro.
type ErrorObject struct {
	ID     string       `json:"id,omitempty"`
	Status string       `json:"status,omitempty"`
	Code   string       `json:"code,omitempty"`
	Title  string       `json:"title,omitempty"`
	Detail string       `json:"detail,omitempty"`
	Source *ErrorSource `json:"source,omitempty"`
	Meta   any          `json:"meta,omitempty"`
}

// ErrorSource define a estrutura para indicar a origem do erro, podendo ser um ponteiro, um parâmetro ou um cabeçalho específico.
type ErrorSource struct {
	Pointer   string `json:"pointer,omitempty"`
	Parameter string `json:"parameter,omitempty"`
	Header    string `json:"header,omitempty"`
}

// Success é uma função auxiliar para enviar respostas de sucesso, aceitando o contexto do Gin, o código de status HTTP e os dados a serem retornados.
func Success(c *gin.Context, statusCode int, data any) {
	c.JSON(statusCode, SuccessDocument{Data: data})
}

// Failure é uma função auxiliar para enviar respostas de erro, aceitando o contexto do Gin, o código de status HTTP, um código de erro, um título e um detalhe do erro.
func Failure(c *gin.Context, statusCode int, code, title, detail string) {
	err := ErrorObject{
		ID:     newErrorID(),
		Status: strconv.Itoa(statusCode),
		Code:   code,
		Title:  title,
		Detail: detail,
	}
	c.JSON(statusCode, ErrorDocument{Errors: []ErrorObject{err}})
}

// FailureWithSource é uma função auxiliar para enviar respostas de erro com informações adicionais sobre a origem do erro, aceitando o contexto do Gin, o código de status HTTP, um código de erro, um título, um detalhe do erro e uma estrutura indicando a fonte do erro.
func FailureWithSource(c *gin.Context, statusCode int, code, title, detail string, source *ErrorSource) {
	err := ErrorObject{
		ID:     newErrorID(),
		Status: strconv.Itoa(statusCode),
		Code:   code,
		Title:  title,
		Detail: detail,
		Source: source,
	}
	c.JSON(statusCode, ErrorDocument{Errors: []ErrorObject{err}})
}

// InternalServerError é uma função auxiliar para enviar respostas de erro genéricas de servidor, aceitando o contexto do Gin e um detalhe do erro.
func InternalServerError(c *gin.Context, detail string) {
	Failure(c, http.StatusInternalServerError, "INTERNAL_SERVER_ERROR", "Internal Server Error", detail)
}

// BadRequest é uma função auxiliar para enviar respostas de erro de requisição malformada, aceitando o contexto do Gin e um detalhe do erro.
func BadRequest(c *gin.Context, detail string) {
	Failure(c, http.StatusBadRequest, "BAD_REQUEST", "Bad Request", detail)
}

// NotFound é uma função auxiliar para enviar respostas de erro de recurso não encontrado, aceitando o contexto do Gin e um detalhe do erro.
func NotFound(c *gin.Context, detail string) {
	Failure(c, http.StatusNotFound, "NOT_FOUND", "Resource Not Found", detail)
}

// Conflict é uma função auxiliar para enviar respostas de erro de conflito, aceitando o contexto do Gin e um detalhe do erro.
func Conflict(c *gin.Context, detail string) {
	Failure(c, http.StatusConflict, "CONFLICT", "Conflict", detail)
}

// newErrorID é uma função auxiliar para gerar um ID único para cada erro, utilizando bytes aleatórios e codificando-os em hexadecimal. Em caso de falha na geração, retorna uma string indicando que o ID do erro está indisponível.
func newErrorID() string {
	buf := make([]byte, 12)
	if _, err := rand.Read(buf); err != nil {
		return "error-id-unavailable"
	}
	return hex.EncodeToString(buf)
}
