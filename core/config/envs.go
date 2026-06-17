package config

import "os"

var (
	DATABASE_DRIVER   = os.Getenv("DATABASE_DRIVER")   //revive:disable-line:var-naming
	DATABASE_USER     = os.Getenv("DATABASE_USER")     //revive:disable-line:var-naming
	DATABASE_PASSWORD = os.Getenv("DATABASE_PASSWORD") //revive:disable-line:var-naming
	DATABASE_HOST     = os.Getenv("DATABASE_HOST")     //revive:disable-line:var-naming
	DATABASE_PORT     = os.Getenv("DATABASE_PORT")     //revive:disable-line:var-naming
	DATABASE_NAME     = os.Getenv("DATABASE_NAME")     //revive:disable-line:var-naming
)
